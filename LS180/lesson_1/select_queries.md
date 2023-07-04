# Select Query Syntax
```sql
SELECT column_name, ...
  FROM table_name
  WHERE condition;
```
*The ellipsis (...) in the above command format indicates that multiple column names may be specified. You can also use * if you want to specify all columns.*

*If for some reason we need to name an identifier with the same name as a keyword:*
In a SQL statement such as `SELECT` enabled, full_name `FROM` users; there are identifiers and keywords. The identifiers, such as enabled, full_name, and users, identify tables or columns within a table. The keywords, such as `SELECT` and `FROM`, tell PostgreSQL to do something specific.

Generally it's best to try and avoid naming columns the same as keywords for this very reason. If it's unavoidable however, *you can double quote the identifier in your statement: "year". PostgreSQL then knows to treat it specifically as an identifier rather than as a keyword.*


# 'Order By' clause
 Rather than returning only certain rows, as `WHERE` does, `ORDER` BY displays the results of a query in a particular sort order.
```sql
SELECT column_name, ...
       FROM table_name
       WHERE condition
       ORDER BY column_name;
```
The `ORDER BY` clause comes after we have specified the table name. If our statement includes a `WHERE` clause, the `ORDER BY` clause comes after this also.

You can fine tune your ordering with the `ORDER BY` clause by specifying the sort direction, either ascending or descending, using the keywords `ASC` or `DESC`. If omitted, then the default is `ASC`.

Example:
```sql
SELECT column_name, ...
       FROM table_name
       WHERE condition
       ORDER BY column_name DESC;
```

You can fine tune your ordering even further by returning results ordered by more than one column. This is done by having comma-separated expressions in the `ORDER BY` clause.

Example:
```sql
SELECT full_name FROM users
ORDER BY enabled DESC, id DESC;
```

# Operators
Operators are generally used as part of an expression in a `WHERE` clause.

## Comparison Operators
Examples of comparison operator would be 'less than' `<` or 'not equal to' `<>`.
```sql
SELECT full_name, enabled, last_login
       FROM users
       WHERE id >= 2;
```
Some other comparison operators:
Operator  |  	Description
<	        |    less than
>	        |    greater than
<=	      |    less than or equal to
>=	      |    greater than or equal to
=	        |    equal
<> or !=	|    not equal

As well as the comparison operators listed above, there are what is termed comparison predicates which behave much as operators but have special syntax. Examples include `BETWEEN`, `NOT BETWEEN`, `IS DISTINCT FROM`, `IS NOT DISTINCT FROM`, `IS NULL`, `IS NOT NULL`.

`NULL` is a special value in SQL which actually represents the absence of a value or an unknown value. 
What this means is that we can't simply treat `NULL` as we would any other value. We couldn't, for example, have a `WHERE` clause in the form `WHERE column_name = NULL`. When identifying `NULL` values we must instead use the `IS NULL` comparison predicate.

Example:
```sql
SELECT * FROM my_table WHERE my_column IS NULL;
```
The above example would select all rows for which the column my_column had a `NULL` value.
Using `IS NOT NULL` would do the opposite; i.e. it would select all rows for which the column had any value other than `NULL`.

## Logical Operators
Logical operators can be used to provide more flexibility to your expressions. There are three logical operators:
1. AND
2. OR
3. NOT

The `AND` and `OR` operators allow us to combine multiple conditions in a single expression.
```sql
SELECT * FROM users
         WHERE full_name = 'Harry Potter'
            OR enabled = 'false';
```
The code above will retrieve rows that meet either condition.

```sql
SELECT * FROM users
         WHERE full_name = 'Harry Potter'
           AND enabled = 'false';
```
The code above will only retrieve rows that meet BOTH conditions.

## String Matching Operators
As the name suggests, string matching can only be done when the data type of the column is a string type. It is most often carried out using the LIKE operator.
```sql
SELECT * FROM users WHERE full_name LIKE '%Smith';
```
By putting `%` just before Smith we are saying:
'Match all users that have a full name with any number of characters followed by "Smith"'
*Note that `LIKE` is case sensitive: `LIKE %Smith` matches Smith but not 'smith' or 'SMITH'. If you want a case-insensitive selection, you can use `ILIKE %Smith`.*

The underscore `_` can also be used as a wildcard with `LIKE` and `ILIKE`. However, _ stands in for only a single character whereas `%` stands in for any number of characters.

An alternative to `LIKE` and `ILIKE` for pattern matching is to use `SIMILAR TO`.  It works in much the same way as `LIKE`, except that it compares the target column to a Regex (Regular Expression) pattern.

# Select Recap
```sql
ORDER BY column_name [ASC, DESC]
```
Orders the data selected by a column name within the associated table. Data can be ordered in descending or ascending order; if neither are specified, the query defaults to ascending order. The brackets (`[]`) indicate that you can select `ASC` or `DESC`, but not both.

```sql
WHERE column_name [>,<, >=, <=, =, <>] value
```
Filters a query result based on some comparison between a column's value and a specified literal value. There are several comparison operators available for use, from "greater than" to "not equal to". The brackets (`[]`) indicate that you can choose any of the operators, but only one of them.

```sql
WHERE expression1 [AND, OR] expression2
```
Filters a query result based whether one expression is true [and,or] another expression is true. The brackets (`[]`) indicate that you can choose `AND` or `OR`, but not both.

```sql
WHERE string_column LIKE '%substring'
```
Filters a query result based on whether a substring is contained within string_column's data and has any number of characters before that substring. Those characters are matched using the wildcard `%`. `%` doesn't have to come before a substring, you can also put it after one as well, matching the substring first and then any number of characters after that substring.


# LIMIT and OFFSET
When working with large datasets, a common requirement is to only display one portion of the data at a time.
Displaying portions of data as separate 'pages' is a user interface pattern used in many web applications, generally referred to as 'pagination'. The `LIMIT` and `OFFSET` clauses of `SELECT` are the base on which pagination is built.

```sql
SELECT * FROM users LIMIT 1;
```
Setting the limit to 1 lets us select a single row, the first row, from our table.

If we want to return the second row instead, we need a way to skip the first row when querying data.
We can do this with the `OFFSET` clause. This clause will skip the first N rows. Let's give it a try.

```sql
SELECT * FROM users LIMIT 1 OFFSET 1;
```
Here we still only return one row, due to the `LIMIT` clause, but since we have `OFFSET` our query by 1, it is the second row that is returned instead of the first.


To return more results per page we can just adjust `LIMIT` and `OFFSET` accordingly.
```sql
SELECT topic, author, publish_date, category,
       replies_count, likes_count, last_activity_date
    FROM posts
    LIMIT 12
    OFFSET 12;
```

`LIMIT` can also be very helpful during development if we want a preview of what data would be returned without returning the entire dataset.

# DISTINCT
`DISTINCT` helps us deal with duplicate data.

```sql
SELECT DISTINCT full_name FROM users;
```
The code above will only retrieve 'distinct' values in the `full_name` column.


`DISTINCT` can be useful when used in conjunction with SQL functions. 
Example:
```sql
SELECT count(DISTINCT full_name) FROM users;
```
The code above will tell us how many unique values are present in the `full_name` column.


# Functions
Functions are a set of commands included as part of the RDBMS that perform particular operations on fields or data.
Some of the most commonly used types of functions are:
1. String
2. Date/Time
3. Aggregate

## String Functions
String functions perform some sort of operation on values whose data type is String.

### length
```sql
SELECT length(full_name) FROM users;
```
This returns the length of every user's name. You could also use length in a WHERE clause to filter data based on name length.

### trim
```sql
SELECT trim(leading ' ' from full_name) FROM users;
```
If any of the data in our full_name column had a space in front of the name, using the trim function like this would remove that leading space.

## Date/Time Functions
Date/ Time functions, for the most part, perform operations on date and time data. Many of the date/ time functions take time or timestamp inputs.

### date_part
```sql
SELECT full_name, date_part('year', last_login) FROM users;
```
`date_part` allows us to view a table that only contains a part of a user's timestamp that we specify. The example query allows us to see each user's name along with the year of the last_login date. Sometimes having date/time data down to the second isn't needed.

### age
```sql
SELECT full_name, age(last_login) FROM users;
```
The `age` function, when passed a single timestamp as an argument, calculates the time elapsed between that timestamp and the current time. The example query allows us to see how long it has been since each user last logged in.

## Aggregate Functions
Aggregate functions compute a single result from a set of input values.

### count
```sql
SELECT count(id) FROM users;
```
Returns the number of values in the column passed in as an argument. This type of function can be very useful depending on the context. We could find the number of users who have enabled an account, or even how many users have certain last names if we use the above statement with other clauses.

### sum
```sql
SELECT sum(id) FROM users;
```
Not to be confused with `count`. This sums numeric type values for all of the selected rows and returns the total.

### min
```sql
SELECT min(last_login) FROM users;
```
This returns the lowest value in a column for all of the selected rows. Can be used with various data types such as numeric, date/ time, and string.

### max
```sql
SELECT max(last_login) FROM users;
```
This returns the highest value in a column for all of the selected rows. Can be used with various data types such as numeric, date/ time, and string.

### avg
```sql
SELECT avg(id) FROM users;
```
Returns the average (arithmetic mean) of numeric type values for all of the selected rows.

# GROUP BY
Sometimes you need to combine data results together to form more meaningful information.
```sql
SELECT enabled, count(id) FROM users GROUP BY enabled;
```


One thing to be aware of when using aggregate functions, is that if you include columns in the column list alongside the function, then those columns must also be included in a `GROUP BY` clause.
```sql
SELECT enabled, full_name, count(id)
       FROM users
       GROUP BY enabled;   -- full_name is not grouped
```
```
ERROR:  column "users.full_name" must appear in the GROUP BY clause or be used in an aggregate function
```
The code above would return an error.

All of the columns in the select list must either be included in the GROUP BY clause, be the result of an aggregate function, or the GROUP BY clause must be based on the primary key. This requirement ensures that there is a single value for every column in the result set.

