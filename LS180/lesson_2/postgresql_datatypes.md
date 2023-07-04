PostgreSQL (and most database systems) support a large number of data types.
These are a few common ones:

*Data Type*               |*Type*       |*Value*	                              |*Example Values*
varchar(length)	          |character	  |up to length characters of text	      |canoe
text	                    |character	  |unlimited length of text	              |a long string of text
integer	                  |numeric	    |whole numbers	                        |42, -1423290
real	                    |numeric	    |floating-point numbers	                |24.563, -14924.3515
decimal(precision, scale)	|numeric	    |arbitrary precision numbers	          |123.45, -567.89
timestamp	                |date/time	  |date and time	                        |1999-01-08 04:05:06
date	                    |date/time	  |only a date	                          |1999-01-08
boolean	                  |boolean	    |true or false	                        |true, false

The names used above are the PostgreSQL-recommended names from its main documentation. Many of the types have alternate names that come from one of the SQL standards or one of the other SQL servers.


# Null
There is a special value in relational databases called `NULL`. This value represents nothing, that is, the absence of any other value. 

In sql it behaves somewhat differently than the nothing value in other languages. Most languages have something similar to `NULL`, and you can compare that value to itself to get a truthy result. 

For example:
```js
$ node
> null == null
= true
```

```rb
$ irb
> nil == nil
= true
```

```python
$ python
> None == None
= True
```


In SQL, however, NULL behaves differently:
```sql
sql-course=# SELECT NULL = NULL;
 ?column?
----------

(1 row)
```
When a `NULL` value appears to either side of any ordinary comparison operator (such as `=`, `<`, `>=`, etc.), the operator will return `NULL` instead of true or false. The empty output for the previous statement was an example of how psql displays `NULL` values:
```sql
sql-course=# SELECT NULL;
 ?column?
----------

(1 row)
```
*When dealing with `NULL` values, always use the `IS NULL` or `IS NOT NULL` constructs:*
```sql
sql-course=# SELECT NULL IS NULL;
 ?column?
----------
 t
(1 row)

sql-course=# SELECT NULL IS NOT NULL;
 ?column?
----------
 f
(1 row)
```
