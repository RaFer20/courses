# Insertion Statement Syntax
```sql
INSERT INTO table_name
            (column1_name, column2_name,...)
     VALUES (data_for_column1, data_for_column2, ...);
```

When we use an INSERT statement, we have to provide three key pieces of information:

1. The table name we wish to store data in.
2. The names of the columns we're adding data to.
3. The values we wish to store in the columns listed directly after the table name.

When specifying columns, for each column specified you must supply a value for it in the `VALUES` clause, otherwise you'll get an error back. If you don't specify a column for data insertion, then `null` or a default value will be added to the record you wish to store instead.
*We can also specify default values by using `DEFAULT` as our value.*

# Adding Rows of Data

If we think of columns as giving structure to our table, then we can think of rows (sometimes referred to as 'tuples') as actually containing the data. Each row in a table is an individual entity, which can perhaps be seen as the logical equivalent of a record, and has a corresponding value for each column in the table.

Example:
```sql
INSERT INTO users (full_name, enabled)
           VALUES ('John Smith', false);
```
(specified columns for the values to be inserted into)


# Adding Multiple Rows
```sql
INSERT INTO users (full_name)
           VALUES ('Jane Smith'), ('Harry Potter');
```

The syntax is very similar to when adding a single row, except each row of values is comma separated.
We don't necessarily need to have each row on a separate line but it is generally good practice to do so though, as it enables you to clearly see the rows that you are adding and the values of those rows.

# Constraints and Adding Data
Although constraints are set at the level of the table structure, or schema, and so are part of DDL, they are primarily concerned with controlling what data can be added to a table.

## Default Values
Setting a DEFAULT value for a column ensures that if a value is not specified for that column in an INSERT statement, then the default value will be used instead.

## NOT NULL Constraints
`NOT NULL` constraints can be used to ensure that when a new row is added, a value must be specified for that column.

If our `INSERT` statement specifies both columns and values but we don't specify a particular column, SQL will try to insert null into that column by default. 

## Unique Constraints
The `UNIQUE` constraint ensures that the value added for that column is unique. This type of constraint ensures that you can't have duplicate values in that column of the table.

An Index is created as a result of the UNIQUE constraint, when we try to insert a row into our table, the value specified for the 'unique' table is checked against the existing values in the index; if the value already exists in there then we can't insert it into that column for our new row.

It's not unusual for a column such as id to have a `UNIQUE` constraint. Having some sort of 'id' column in a database table is a common, and useful, practice. Such a column is generally used to store a unique identifier for each row of data. In order for it to work effectively though, we need to ensure that each value in such a column is actually unique. Thus far, we've added data in such a way so that each id was unique and each record distinct, but we don't want to have to manually keep track of every value we add to that column; using a `UNIQUE` constraint lets PostgreSQL do the work for us.

*Looking up values for UNIQUE constraints is just one use for indexes in a database.*

## CHECK Constraints
Check constraints limit the type of data that can be included in a column based on some condition we set in the constraint. Each time a new record is in the process of being added to a table, that constraint is first checked to ensure that data being added conforms to it.

Example:
```sql
ALTER TABLE users ADD CHECK (full_name <> '');
```

`<>` is an operator in SQL. It's a 'not equal' to operator (and alternative syntax for `!=`), and here we're using it to specify that any value we try to insert for full_name cannot be equal to an empty string.

# Quote marks in PostgreSQL
A string is denoted by using single quote marks. If we need to add a single quote mark within a string (example: 'O'Leary') we need to use a second quote mark to escape the first. (example: 'O''Leary')


# Commands Recap
Creates a new record in table_name with the specified columns and their associated values:
```sql
INSERT INTO table_name (column1_name, column2_name, ...) 
     VALUES (data_for_column1, data_for_column2, ...);
```

Adds a constraint to table_name that prevent non-unique values from being added to the table for column_name:
```sql
ALTER TABLE table_name ADD UNIQUE (column_name);
```

Adds a constraint to table_name that prevents new rows from being added if they don't pass a *check* based on a specified expression:
```sql
ALTER TABLE table_name ADD CHECK (expression);
```

Adds a constraint with a specific name:
```sql
ALTER TABLE birds 
ADD CONSTRAINT check_age CHECK (age > 0);
```

Adds a constraint with specific name to specific column:
```sql
ALTER TABLE contacts ADD CONSTRAINT number_unique UNIQUE (number);
```

Adds uniqueness to a combination of values in a join table:
```sql
ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);
```