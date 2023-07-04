For this exercise, let's explore the EXPLAIN PostgreSQL statement. It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements. More specifically, use EXPLAIN to check the efficiency of the query statement we used in the exercise on EXISTS:
```sql
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```
First use just EXPLAIN, then include the ANALYZE option as well. For your answer, list any SQL statements you used, along with the output you get back, and your thoughts on what is happening in both cases.

--------------------------------------------------
EXPLAIN:
```sql
EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```
```sql
                                QUERY PLAN
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
(7 rows)
```

- The name of the node used to perform the SQL statement. A node represents some operation taken to run the SQL statement. An example would be the name in the first row of our query plan, `Hash Join`

- The estimated startup cost and estimated total cost.`Hash Join (cost=33.38..62.84 rows=635 width=32)` The first number after cost is the estimated startup cost, and the second is the estimated total cost.

- The estimated number of rows to be shown when the SQL statement we are explaining is run. This is the number right after `rows=` above.

- The width is the estimated amount in bytes taken up by rows for the SQL statement we are explaining.


ANALYZE:
```sql
EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```
```sql
                                                     QUERY PLAN
---------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.027..0.029 rows=6 loops=1)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.007..0.008 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.016..0.016 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.014..0.015 rows=6 loops=1)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.003..0.005 rows=26 loops=1)
 Planning Time: 0.093 ms
 Execution Time: 0.052 ms
```

The planning and execution time have been added at the end of the query plan. They represent the total time it took to set up the statement and the total time it took to execute it.