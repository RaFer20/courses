When all the data is in a single table it only takes a simple `SELECT` query to retrieve the rows we're looking for in our table. When the data is spread across multiple tables we first need to 'join' those tables before we can select the data that we need.

SQL handles queries across more than one table through the use of JOINs. JOINs are clauses in SQL statements that link two tables together, usually based on the keys that define the relationship between those two tables. There are several types of JOINs: INNER, LEFT OUTER, RIGHT OUTER, FULL OUTER and CROSS; they all do slightly different things, but the basic theory behind them all is the same.

# JOIN Syntax
```sql
SELECT table_nameN.column_name, ...
       FROM table_name1
       join_type JOIN table_name2
                 ON join_condition;
```
*The ellipsis (...) in the command format above indicates that we can provide any number of columns with the table_nameN.column_name format.*


The first part of it:
```sql
SELECT table_nameN.column_name...
```
is the `SELECT column_list` we use when selecting from a single table with the slight difference that the column names are now prepended by the table names in the column list.

The second part of it is the one that joins the tables:
```sql
FROM table_name1
join_type JOIN table_name2
          ON join_condition
```

To join one table to another, PostgreSQL needs to know several pieces of information:
- The name of the first table to join
- The type of join to use
- The name of the second table to join
- The join condition.

These pieces of information are combined together using the `JOIN` and `ON` keywords. The part of the statement that comes after the `ON` keyword is the join condition; this defines the logic by which a row in one table is joined to a row in another table. In most cases this join condition is created using the primary key of one table and the foreign key of the table we want to join it with.

**Example**
If we had the following two tables:
            Colors                  |                   Shapes
    id    |          color          |    id   |  color_id  |   shape
    1     |           'Red'         |     1   |     1      |   'Square'
    2     |           'Blue'        |     2   |     1      |   'Star'
    3     |           'Orange'      |     3   |     2      |   'Triangle'
    4     |           'Green'       |     4   |     4      |   'Circle'

We could use a query like this to select of shapes and their colors:
```sql
SELECT colors.color, shapes.shape
       FROM colors
       JOIN shapes
            ON colors.id = shapes.color_id;
```
Within the second part of this query, colors `JOIN shapes ON colors.id = shapes.color_id`, the join condition will look at each `id` value in the `colors` table and attempt to match it with a `color_id` value in the `shapes` table. If there is a match then those two rows are joined together to form a new row in a transient table known as a 'join table'.

            shapes_colors_join_tables
  colors.id | colors.color |  shapes.id |  shapes.color_id | shapes.shape
  1         | 'Red'        |     1      |        1         | 'Square'
  1         | 'Red'        |     2      |        1         | 'Star'
  2         | 'Blue'       |     3      |        2         | 'Triangle'
  4         | 'Green'      |     4      |        4         | 'Circle'

With this transient join table created, the `SELECT column_list FROM` part of our statement can then be executed to select columns from this transient table. Those columns could originally be from either table; to avoid confusion, we need to specify both the table name and column name in our column list, in the form `table_name.column_name1`.

```sql
SELECT colors.color, shapes.shape
       FROM shapes_colors_join_table;
```
Which would give use this:
  colors.color  | shapes.shape
  'Red'         | 'Square'
  'Red'         | 'Star'
  'Blue'        | 'Triangle'
  'Green'       | 'Circle'

# Types of Joins
A `JOIN` statement can come in various forms. To specify which type of join to use, you can add either `INNER`, `LEFT`, `RIGHT`, `FULL` or `CROSS` just before the keyword `JOIN`. 

## INNER JOIN
An `INNER JOIN` returns a result set that contains the common elements of the tables, i.e the intersection where they match on the joined condition. `INNER JOINs` are the most frequently used `JOINs`.
If we don't specify a join type and just use the `JOIN` keyword Postgresql will assume we want an `INNER JOIN`. The `shapes` and `colors` example from earlier used `INNER JOIN` this way.

(LS sql_book example:)
```sql
SELECT users.*, addresses.*
       FROM users
       INNER JOIN addresses
             ON users.id = addresses.user_id;
```

## LEFT JOIN
A `LEFT JOIN` or a `LEFT OUTER JOIN` takes all the rows from one table, defined as the `LEFT` table, and joins it with a second table. The `JOIN` is based on the conditions supplied in the `ON` clause.
A `LEFT JOIN` will always include the rows from the `LEFT` table, even if there are no matching rows in the table it is JOINed with. When there is no match, the corresponding rows will use `NULL` to represent the missing values from the second table.

(LS sql_book example:)
```sql
SELECT users.*, addresses.*
       FROM users
       LEFT JOIN addresses
            ON users.id = addresses.user_id;
```

*Note that using either LEFT JOIN or LEFT OUTER JOIN does exactly the same thing, and the OUTER part is often omitted. Even so, it is still common to refer to this type of join as an 'outer' join in order to differentiate it from an 'inner' join.*

## Right JOIN
A `RIGHT JOIN` is similar to a `LEFT JOIN` except that the roles between the two tables are reversed, and all the rows on the second table are included along with any matching rows from the first table.

(LS sql_book example:)
(The join table will include all books in the `book` table, including those without a review from the `reviews` table.)
```sql
SELECT reviews.book_id, reviews.content,
       reviews.rating, reviews.published_date,
       books.id, books.title, books.author
    FROM reviews
    RIGHT JOIN books
          ON reviews.book_id = books.id;
```

## FULL JOIN
A `FULL JOIN` or `FULL OUTER JOIN` is essentially a combination of `LEFT JOIN` and `RIGHT JOIN`. This type of join contains all of the rows from both of the tables. Where the join condition is met, the rows of the two tables are joined, just as in the previous examples we've seen.
For any rows on either side of the join where the join condition is not met, the columns for the other table have `NULL` values for that row.

A `FULL JOIN` is a little less common than the other ones we've looked at so far.

## CROSS JOIN
A `CROSS JOIN`, also known as a Cartesian `JOIN`, returns all rows from one table crossed with every row from the second table. In other words, the join table of a cross join contains every possible combination of rows from the tables that have been joined. Since it returns all combinations, a `CROSS JOIN` does not need to match rows using a join condition, therefore it does not have an `ON` clause.

This SQL query has the similar syntax to other `JOINs`, but without the `ON` clause:
```sql
SELECT * FROM users CROSS JOIN addresses;
```

The query above returns the `addresses` and `users` tables, cross joined. The result set consists of every record in `users` mapped to every record in `addresses`. For 4 users and 3 addresses, we get a total of `4x3=12` records. In mathematical terms, this is the cross product of a set.

In an application, it's very unlikely that we would use a `CROSS JOIN`. Most of the time, it's more important to match rows together through a join condition in order to return a meaningful result. 
It's still important to be aware of CROSS JOINs however, since we may occasionally encounter them.

# Multiple Joins
It is possible to join more than two tables together. We do this by adding additional `JOIN` clauses to our `SELECT` statement. To join multiple tables this way, there must be a logical relationship between the tables involved. 

One example would be joining our `users`, `checkouts`, and `books` tables.
```sql
SELECT users.full_name, books.title,
       checkouts.checkout_date
    FROM users
    INNER JOIN checkouts
          ON users.id = checkouts.user_id
    INNER JOIN books
          ON books.id = checkouts.book_id;
```

Here we use two `INNER JOINs`. One between `users` and `checkouts` and one between `checkouts` and `books`. In both cases the `JOIN` is implemented by using the `Primary Key` of one table (either `users` or `books`) and the `Foreign Key` for that table in the checkouts table.

When we perform a `JOIN` between two tables, PostgreSQL creates a transient table that contains data from both the original table and the table identified by the `JOIN`. We can think of this transient table as containing all columns from the records in both the `FROM` and `JOIN` tables. Before PostgreSQL displays the results, it picks out just the columns that we mentioned in the `SELECT` statement.

When we add a second `JOIN`, PostgreSQL creates yet another transient table that contains all of the columns from the previous transient table as well as all of the columns from the matching rows in the second `JOIN` table. In this case we are not referring back to the `FROM` table, instead we're working with transient table and the 'JOIN' table.

Additional `JOINs` would act the same way; each works with the previous transient table and adds data from matching rows in the JOIN tables.

# Aliasing
We can cut back on the length of our queries by using aliasing. Aliasing allows us to specify another name for a column or table and then use that name in later parts of a query to allow for more concise syntax.

Using our three table join from above as an example. Using aliasing, the query would look like this:
```sql
SELECT u.full_name, b.title, c.checkout_date
       FROM users AS u
       INNER JOIN checkouts AS c
           ON u.id = c.user_id
       INNER JOIN books AS b
           ON b.id = c.book_id;
```
This is commonly referred to as 'table aliasing'.

We can even use a shorthand for aliasing by leaving out the AS keyword entirely. `FROM users u` and `FROM users AS u` are equivalent SQL clauses.

# Column Aliasing
We can also use aliasing to display more meaningful information in our result table. For instance, if we want to display the number of checkouts from the library we could write something like:
```sql
SELECT count(id) AS "Number of Books Checked Out"
       FROM checkouts;
```
```sql
Number of Books Checked Out
-----------------------------
                          4
(1 row)
```

Without aliasing we lose context about what was counted.
```sql
SELECT count(id) FROM checkouts;
```
```sql
 count
-------
     4
(1 row)
```

# Subqueries
Imagine executing a `SELECT` query, and then using the results of that `SELECT` query as a condition in another `SELECT` query. This is called nesting, and the query that is nested is referred to as a 'subquery'.

For example, suppose we need to select users that have no books checked out. We could do this by finding users whose `user_id` is not in the checkouts table. If no relation is found, that would mean that the user has not checked out any books.

```sql
SELECT u.full_name FROM users u
       WHERE u.id NOT IN (
           SELECT c.user_id FROM checkouts c
       );
```
```sql
  full_name
-------------
 Harry Potter
(1 row)
```

In the code above, the `NOT IN` clause compares the current `user_id` to all of the rows in the result of the subquery. If that id number isn't part of the subquery results, then the `full_name` for current row is added to the result set.

## Subquery Expressions
PostgreSQL provides a number of expressions that can be used specifically with sub-queries, such as `IN`, `NOT IN`, `ANY`, `SOME`, and `ALL`. These all work slightly differently, but essentially they all compare values to the results of a subquery.

# Subqueries vs Joins
As we write more queries, we find that there is more than one way to write a query and achieve the same results. JOINs and subqueries are the most common choices.

as an example, we can get the same result table as in our previous example by using a JOIN clause instead of a subquery:
```sql
SELECT u.full_name
       FROM users u
       LEFT JOIN checkouts c ON u.id = c.user_id
       WHERE c.user_id IS NULL;
```
```sql
  full_name
--------------
 Harry Potter
(1 row)
```

When creating queries that return the same result, a differentiator between them may be their performance when compared to each other. *As a general rule, JOINs are faster to run than subqueries*. This may be something to bear in mind if working with large datasets.

# Recap

Join Type	       Notes
`INNER`	Combines rows from two tables whenever the join condition is met.

`LEFT`	Same as an inner join, except rows from the first table are added to the join table, regardless of the evaluation of the join condition.

`RIGHT`	Same as an inner join, except rows from the second table are added to the join table, regardless of the evaluation of the join condition.

`FULL`	A combination of left join and right join.

`CROSS`	Doesn't use a join condition. The join table is the result of matching every row from the first table with the second table, the cross product of all rows across both tables.

We can use `Aliasing` to shorten the length of our queries and specify names for columns and tables to for later use to allow for more concise syntax. It can also be used to display more meaningful information in our result table.

`Subqueries` offer another method for us to query the database and retrieve the same results, or similar results, as if we had used a `JOIN` clause.