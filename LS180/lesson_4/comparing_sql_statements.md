# Assessing a Query with EXPLAIN
To use `EXPLAIN` you prepend the query with the `EXPLAIN` keyword. This does not actually execute the query, but instead returns the query plan for that query.

```sql
auction=# EXPLAIN SELECT * FROM items;
                       QUERY PLAN                        
---------------------------------------------------------
 Seq Scan on items  (cost=0.00..18.80 rows=880 width=64)
(1 row)
```

`EXPLAIN` gives a step by step analysis of how the query will be run internally by PostgreSQL.
In order to execute each query that it receives, PostgreSQL devises an appropriate 'query plan'. The creation of this query plan is one step in the path of executing a query as outlined in the PostgreSQL Documentation. What `EXPLAIN` does is allow us to access and read that query plan.

The structure of the query plan is a node-tree. The more 'elements' that there are to our query, the more nodes there will be in the tree.
The example above explains a very simple query, so there is only one node in the plan tree. Each node consists of the node type (in this case a sequential scan on the items table) along with estimated cost for that node (start-up cost, followed by total cost), the estimated number of rows to be output by the node, and the estimated average width of the rows in bytes. The cost values are calculated using arbitrary units determined by the planner's cost parameters, and represent the estimated amount of effort or resources required to execute the query as planned. 

A more complex query would have more nodes:
```sql
auction=# EXPLAIN SELECT name FROM items
auction-# JOIN bids ON items.id = bids.item_id
auction-# WHERE amount > 100 AND amount < 120;
                                   QUERY PLAN                                    
---------------------------------------------------------------------------------
 Hash Join  (cost=32.75..54.93 rows=8 width=32)
   Hash Cond: (items.id = bids.item_id)
   ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36)
   ->  Hash  (cost=32.65..32.65 rows=8 width=4)
         ->  Seq Scan on bids  (cost=0.00..32.65 rows=8 width=4)
               Filter: ((amount > '100'::numeric) AND (amount < '120'::numeric))
(6 rows)
```

However many nodes the query plan has, one of the key pieces of information to look out for in order to compare queries is the estimated 'total cost' value of the top-most node. For our first query this value is `18.80`. Our second, more complex, query understandably has a higher estimated cost of `54.93`.

For a more interesting comparison, we can replace our second example with an equivalent subquery:
```sql
auction=# EXPLAIN SELECT name FROM items
auction-# WHERE items.id =
auction-# (SELECT item_id FROM bids
auction(# WHERE amount > 100 AND amount < 120);
                                 QUERY PLAN                                  
-----------------------------------------------------------------------------
 Index Scan using items_pkey on items  (cost=32.80..40.82 rows=1 width=32)
   Index Cond: (id = $0)
   InitPlan 1 (returns $0)
     ->  Seq Scan on bids  (cost=0.00..32.65 rows=8 width=4)
           Filter: ((amount > '100'::numeric) AND (amount < '120'::numeric))
(5 rows)
```
Looking at the two outputs, the estimated cost for the subquery, `40.82`, is lower than that for the join, `54.93`. This is not necessarily always the case, and often joins are more efficient than subqueries.


# EXPLAIN ANALYZE
when we use `EXPLAIN`, the query is not actually run. The values that `EXPLAIN` outputs are estimates, based on the planner's knowledge of the schema and assumptions based on PostgreSQL system statistics. In order to assess a query using actual data, you can add the `ANALYZE` option to an `EXPLAIN` command.
```sql
auction=# EXPLAIN ANALYZE SELECT name FROM items
auction-# JOIN bids ON items.id = bids.item_id
auction-# WHERE amount > 100 AND amount < 120;
                                                QUERY PLAN                                                 
-----------------------------------------------------------------------------------------
 Hash Join  (cost=32.75..54.93 rows=8 width=32) (actual time=0.438..0.442 rows=1 loops=1)
   Hash Cond: (items.id = bids.item_id)
   ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36) (actual time=0.017..0.019 rows=6 loops=1)
   ->  Hash  (cost=32.65..32.65 rows=8 width=4) (actual time=0.398..0.398 rows=1 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on bids  (cost=0.00..32.65 rows=8 width=4) (actual time=0.016..0.026 rows=1 loops=1)
               Filter: ((amount > '100'::numeric) AND (amount < '120'::numeric))
               Rows Removed by Filter: 25
 Planning Time: 0.410 ms
 Execution Time: 0.491 ms
(10 rows)
```

`Analyze` actually runs the query and, in addition to the output of `EXPLAIN`,it includes the time (milliseconds) it took to run the query and its parts, as well as the actual rows returned by each plan node rather than just a number of rows based on defaults statistics.