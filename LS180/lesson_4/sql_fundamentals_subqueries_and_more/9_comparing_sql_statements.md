In this exercise, we'll use EXPLAIN ANALYZE to compare the efficiency of two SQL statements. These two statements are actually from the "Query From a Virtual Table" exercise in this set. In that exercise, we stated that our subquery-based solution:
```sql
SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
```

was actually faster than the simpler equivalent without subqueries:
```sql
SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;
```

In this exercise, we will demonstrate this fact.

Run EXPLAIN ANALYZE on the two statements above. Compare the planning time, execution time, and the total time required to run these two statements. Also compare the total "costs". Which statement is more efficient and why?

-----------------------------------------------------

```sql
EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

                                                  QUERY PLAN
---------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.024..0.025 rows=1 loops=1)
   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.020..0.022 rows=6 loops=1)
         Group Key: bids.bidder_id
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.008..0.010 rows=26 loops=1)
 Planning Time: 0.077 ms
 Execution Time: 0.056 ms
(6 rows)
```

```sql
EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

                                                     QUERY PLAN
---------------------------------------------------------------------------------------------------------------------
 Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.034..0.034 rows=1 loops=1)
   ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.033..0.033 rows=1 loops=1)
         Sort Key: (count(bidder_id)) DESC
         Sort Method: top-N heapsort  Memory: 25kB
         ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.027..0.028 rows=6 loops=1)
               Group Key: bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.004..0.006 rows=26 loops=1)
 Planning Time: 0.118 ms
 Execution Time: 0.058 ms
(9 rows)
```

The first statement has a lower planning and execution time compared to the second statement.
The cost of the first statement is higher than the cost of the second statement.


**Further Exploration**
We mentioned earlier that using a scalar subquery was faster than using an equivalent JOIN clause. Determining that JOIN statement was part of the "Further Exploration" for that exercise. For this "Further Exploration", compare the times and costs of those two statements. The SQL statement that uses a scalar subquery is listed below.

Scalar Subquery:
```sql
EXPLAIN ANALYZE SELECT name,
(SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;

                                                 QUERY PLAN
-------------------------------------------------------------------------------------------------------------
 Seq Scan on items  (cost=0.00..25455.20 rows=880 width=40) (actual time=0.020..0.033 rows=6 loops=1)
   SubPlan 1
     ->  Aggregate  (cost=28.89..28.91 rows=1 width=8) (actual time=0.003..0.003 rows=1 loops=6)
           ->  Seq Scan on bids  (cost=0.00..28.88 rows=8 width=4) (actual time=0.002..0.002 rows=4 loops=6)
                 Filter: (item_id = items.id)
                 Rows Removed by Filter: 22
 Planning Time: 0.069 ms
 Execution Time: 0.057 ms
(8 rows)
```

JOIN:
```sql
EXPLAIN ANALYZE SELECT items.name, count(bids.item_id) FROM items 
LEFT OUTER JOIN bids ON items.id = bids.item_id
GROUP BY name;

                                                     QUERY PLAN
---------------------------------------------------------------------------------------------------------------------
 HashAggregate  (cost=66.44..68.44 rows=200 width=72) (actual time=0.035..0.037 rows=6 loops=1)
   Group Key: items.name
   ->  Hash Right Join  (cost=29.80..58.89 rows=1510 width=36) (actual time=0.019..0.027 rows=27 loops=1)
         Hash Cond: (bids.item_id = items.id)
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.002..0.003 rows=26 loops=1)
         ->  Hash  (cost=18.80..18.80 rows=880 width=36) (actual time=0.012..0.013 rows=6 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36) (actual time=0.008..0.009 rows=6 loops=1)
 Planning Time: 0.083 ms
 Execution Time: 0.067 ms
(10 rows)
```


The first statement is faster but much more costly, in a larger table it might not be as efficient.