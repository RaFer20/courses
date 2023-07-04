# Updating Data

`UPDATE` Statement:
```sql
UPDATE table_name
SET column_name = value, ...
WHERE expression;
```

This statement can be read as, "Set column(s) to these values in a table when an expression evaluates to true".

The `WHERE` clause in the syntax above example is optional. If omitted, PostgreSQL will update every row in the target table.
We can always test our `WHERE` clause in a `SELECT` statement to check which rows are being targeted, before then using it in an `UPDATE` statement.

## Update All Rows
If we wanted to disable all users at once in our `users` table in response to a security issue we could do the following:
```sql
UPDATE users SET enabled = false;
```

Updating all rows like this is unusual. We will usually want to update specific rows based on some criteria on a `WHERE` clause.

## Update Specific Rows
Using a `WHERE` clause lets us update only the specific rows that meet the condition(s) set in that clause.
```sql
UPDATE users SET enabled = true
             WHERE full_name = 'Harry Potter'
                OR full_name = 'Jane Smith';
```

With a specific enough `WHERE` clause we can even update a single user.
```sql
UPDATE users SET full_name='Alice Walker' WHERE id=2;
```

# Deleting Data
The DELETE statement is used to remove entire rows from a database table:
```sql
DELETE FROM table_name WHERE expression;
```
As with UPDATE, the WHERE clause in a DELETE statement is used to target specific rows.

## Deleting Specific Rows

```sql
DELETE FROM users
WHERE full_name='Harry Potter' AND id > 3;
```
In the case of the code above the `id` column alone would have achieved the same result but we added the `full_name` column as extra protection from accidentally typing the wrong value for `id`.

## Deleting All Rows
Just as with `UPDATE`, the `WHERE` clause in a `DELETE` statement is optional. If omitted, all the rows in the table will be deleted.
```sql
DELETE FROM users;
```

# Update vs Delete
A key difference:
With `UPDATE` you can update one or more columns within one or more rows by using the `SET` clause; with `DELETE` you can only delete one or more entire rows, and not particular pieces of data from within those rows.

Although it's not possible to delete specific values within a row, we can approximate this by using `NULL`. By using an `UPDATE` statement to `SET` a specific value to `NULL`, although not deleting it as such, we are effectively removing that value.

Example:
```sql
UPDATE table_name SET column_name1 = NULL
WHERE expression;
```

Things to note:
- Unlike with a `WHERE` clause, with our `SET` clause we can use `=` with `NULL` since it's not being used as comparison operator in this situation.
- If a column has a `NOT NULL` constraint, then it's not possible to set its value to `NULL`. An error will be thrown.

# Use Caution
Although we are able to update or delete all the rows in the table, this is not usually what we want to do. If we are about to run an `UPDATE` or `DELETE` statement without a `WHERE` clause, we must be certain we want it to affect the whole table.

Even when using a `WHERE` clause it's better to be a bit cautious. It's typical to first do a `SELECT` to verify which rows we are targeting. We can then issue the `UPDATE` or `DELETE` with the same modifiers, being confident that we will only affect the rows that we intend to.

It's probably not a good idea to issue an `UPDATE` or `DELETE` statement without verifying first.

# Recap
## Update:
```sql
UPDATE table_name SET column_name = value, ... WHERE expression;
```
Update specified fields within a table. The rows updated are dependent on the WHERE clause. We may update all rows by leaving out the WHERE clause. The ellipsis (`...`) indicates that we can specify as many `column_name = value` pairs as needed.

## Delete:
```sql
DELETE FROM table_name WHERE expression;
```
Delete rows in the specified table. Which rows are deleted is dependent on the WHERE clause. We may delete all rows by leaving out the WHERE clause.

## Update Constraint:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name
SET constraint;
```