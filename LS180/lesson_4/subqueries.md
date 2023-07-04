# Table used for examples
```sql
my_books=# SELECT * FROM authors;
 id |      name
----+----------------
  1 | William Gibson
  2 | Iain M. Banks
  3 | Philip K. Dick
(3 rows)

my_books=# SELECT * FROM books;
 id |        title         |     isbn      | author_id
----+----------------------+---------------+-----------
  1 | Neuromancer          | 9780441569595 |         1
  2 | Consider Phlebas     | 9780316005388 |         2
  3 | Idoru                | 9780425158647 |         1
  4 | The State of the Art | 0929480066    |         2
  5 | The Simulacra        | 9780547572505 |         3
  6 | Pattern Recognition  | 9780425198681 |         1
  7 | A Scanner Darkly     | 9780547572178 |         3
(7 rows)
```

# Subqueries
The key thing to understand conceptually is that we are using the nested query to generate a set of one or more values, we then use those values as part of an outer query (usually as part of a condition).

Example:
```sql
SELECT title FROM books WHERE author_id =
  (SELECT id FROM authors WHERE name = 'William Gibson');
```
The nested query `SELECT id FROM authors WHERE name = 'William Gibson';` returns the `id` value from the `authors` table for `William Gibson`. The 'outer' query uses that returned value in the `WHERE` condition.

```sql
SELECT title FROM books WHERE author_id = 1;
```

# Subquery Expressions
Subquery expressions are useful when the nested subquery returns more than just one value.
Subquery expressions are a special set of operators for use specifically with subqueries, most commonly within a conditional subquery. 

## EXISTS
`EXISTS` checks whether any rows at all are returned by the nested query. If at least one row is returned then the result of `EXISTS` is 'true', otherwise it is 'false'.
```sql
my_books=# SELECT 1 WHERE EXISTS
my_books-#   (SELECT id FROM books
my_books(#     WHERE isbn = '9780316005388');
 ?column?
----------
        1
(1 row)
```
This returns 1 if there is a row in the books table with an isbn of 9780316005388, and return no rows otherwise. `EXISTS` is somewhat unusual, but can be useful in some situations such as in correlated subqueries.

## IN
IN compares an evaluated expression to every row in the subquery result. If a row equal to the evaluated expression is found, then the result of IN is 'true', otherwise it is 'false'.

Example:
```sql
my_books=# SELECT name FROM authors WHERE id IN
my_books-#   (SELECT author_id FROM books
my_books(#     WHERE title LIKE 'The%');
      name
----------------
 Iain M. Banks
 Philip K. Dick
(2 rows)
```
The nested query returns a list of `author_id` values `(2, 3)` from the books table where the title of the book for that row starts with 'The'. The outer query then returns the name value from any row of the `authors` table, where the `id` for that row is in the results from the nested query.


## NOT IN
`NOT IN` is similar to `IN` except that the result of `NOT IN` is 'true' if an equal row is not found, and 'false' otherwise.

Example:
```sql
my_books=# SELECT name FROM authors WHERE id NOT IN
my_books-#   (SELECT author_id FROM books
my_books(#     WHERE title LIKE 'The%');
      name
----------------
 William Gibson
(1 row)
```
This works similar to the example for the `IN` section but returns the `id` that is not in the results from the nested query.

## ANY / SOME
`ANY` and `SOME` are synonyms, and can be used interchangeably. 
These expressions are used along with an operator (e.g. `=`, `<`, `>`, etc). The result of `ANY` / `SOME` is 'true' if any true result is obtained when the expression to the left of the operator is evaluated using that operator against the results of the nested query.

Example:
```sql
my_books=# SELECT name FROM authors WHERE length(name) > ANY
my_books-# (SELECT length(title) FROM books
my_books(# WHERE title LIKE 'The%');
      name
----------------
 William Gibson
 Philip K. Dick
(2 rows)
```
The nested query returns the string length of any book title starting with 'The', `(20, 13)`.
The outer query then returns the `name` of any author where the length of `name` is greater than any of the results from the nested query. Two of the author names are 14 characters in length and so satisfy the condition since they are greater in length than at least one of the title lengths (`13`) from the results of the nested query.

*Note: when the = operator is used with ANY / SOME, this is equivalent to IN.*

## ALL
`ALL` is used along with an operator. The result of `ALL` is true only if all of the results are true when the expression to the left of the operator is evaluated using that operator against the results of the nested query.

Example:
```sql
my_books=# SELECT name FROM authors WHERE length(name) > ALL
my_books-# (SELECT length(title) FROM books
my_books(# WHERE title LIKE 'The%');
 name
------
(0 rows)
```
The nested query again returns the string length of any book `title `starting with 'The', `(20, 13)`. 
The outer query then returns the `name` of any author where the length of `name` is greater than all of the results from the nested query.
This time no results are returned by the outer query, since the lengths of the author names would need to be greater than all of the title lengths, `(20, 13)`, in order to satisfy the condition.

*Note: when the <> / != operator is used with ALL, this is equivalent to NOT IN.*

# When to use Subqueries
*When we're not yet at the optimization stage and performance isn't a factor*, the decision over whether to use a subquery over a join will often come down to personal preference. There are however valid arguments to say that subqueries are more readable or make more logical sense in some situations.

Example:
 If we want to return data from one table conditional on data from another table, but don't need to return any data from the second table, then a subquery may make more logical sense and be more readable. If we need to return data from both tables then we would need to use a join.
