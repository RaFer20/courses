# How PostgreSQL Executes a Query
While the exact way that a PostgreSQL database server will execute a query will depend on many variables, there is a high-level process that each query goes through. Being familiar with these steps can be a benefit for knowing the difference between two queries that appear to return the same results, or understanding why some queries are rejected by the database.

The basic process for a `SELECT` query is described below.

## Rows are collected into a virtual derived table
You can think of this step as the database creating a new temporary table using the data from all the tables listed in the query's `FROM` clause. This includes tables that are used in `JOIN` clauses.

## Rows are filtered using WHERE conditions
All the conditions in the `WHERE` clause are evaluated for each row, and those that don't meet these requirements are removed.

## Rows are divided into groups
If the query includes a `GROUP BY` clause, the remaining rows are divided into the appropriate groups.

## Groups are filtered using HAVING conditions
`HAVING` conditions are very similar to `WHERE` conditions, only they are applied to the values that are used to create groups and not individual rows. This means that a column that is mentioned in a `HAVING` clause should almost always appear in a `GROUP BY` clause and/or an aggregate function in the same query. Both `GROUP BY` and aggregate functions perform grouping, and the `HAVING` clause is used to filter that aggregated/grouped data.

## Compute values to return using select list
Each element in the select list is evaluated, including any functions, and the resulting values are associated with the name of the column they are from or the name of the last function evaluated, unless a different name is specified in the query with `AS`.

## Sort Results
The result set is sorted as specified in an `ORDER BY` clause. Without this clause, the results are returned in an order that is the result of how the database executed the query and the rows' order in the original tables. 

## Limit Results
If `LIMIT` or `OFFSET` clauses are included in the query, these are used to adjust which rows in the result set are returned.