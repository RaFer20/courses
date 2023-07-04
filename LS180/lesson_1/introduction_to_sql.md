# Common Commands/Statements
(PostgreSQL)
## Common PSQL Meta-Commands
`\l` or `\list`	         displays all databases
`\c sql_book` or 
`\connect sql_book`	    connects to the `sql_book` database
`\q`	                  exits the PostgreSQL session and return to the command-line prompt
`\e`                    calls up an editor that lets you edit and rerun the previous command
`\dt`	                  Shows the tables in the current database
`\d users`	            Shows the schema of the table users

## Common Client/Application Command-Line Commands
`psql -d sql_book`	starts a psql session and connect to the `sql_book` database
`createdb sql_book`	creates a new database called `sql_book` using a psql utility
`dropdb my_database`	permanently deletes the database named `my_database` and all its data

## Common SQL Statements
`CREATE DATABASE sql_book`	creates a new database called sql_book
`DROP DATABASE my_database`	permanently deletes the database named `my_database` and all its data
`CREATE TABLE users..`	Creates a new table called users

###############################################################################################################################

# Create Tables
```sql
CREATE TABLE table_name (
    column_1_name column_1_data_type [constraints, ...],
    column_2_name column_2_data_type [constraints, ...],
    .
    .
    .
    constraints
);
```

## Data Types
**Column Data Type /	Description**
- *serial*	This data type is used to create identifier columns for a PostgreSQL database. These identifiers are integers, auto-incrementing, and cannot contain a null value.

- *char(N)*	This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length is filled with space characters.

- *varchar(N)*	This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length isn't used.

- *boolean* This is a data type that can only contain two values "true" or "false". In PostgreSQL, boolean values are often displayed in a shorthand format, t or f

- *integer or INT* An integer is simply a "whole number." An example might be 1 or 50, -50, or 792197 depending on what storage type is used.

- *decimal(precision, scale)* The decimal type takes two arguments, one being the total number of digits in the entire number on both sides of the decimal point (the precision), the second is the number of the digits in the fractional part of the number to the right of the decimal point (the scale).

- *timestamp* The timestamp type contains both a simple date and time in YYYY-MM-DD HH:MM:SS format.

- *date* The date type contains a date but no time.


## Keys and Constraints
While data types are a mandatory part of a column definition, constraints are optional.

- *DEFAULT TRUE* `DEFAULT` with a value of `TRUE` If no value is set in this field when a record is created then the value of TRUE is set in that field.

- *Unique* prevents any duplicate values from being entered into that column.

- *NOT NULL* when adding data to the table a value MUST be specified for this column; it cannot be left empty.

## Example
```sql
CREATE TABLE users (
       id serial UNIQUE NOT NULL,
       username char(25),
       enabled boolean DEFAULT TRUE
);
```
1. CREATE TABLE: Firstly, CREATE TABLE users is the primary command.
2. users: The name of the table that will be created.
3. (): The information in the parentheses is related to the columns in the table.
4. id, username, enabled: These are the three columns of the table.
5. serial, char(25), boolean: These are the data types of the columns. We will look at data types shortly.
6. UNIQUE, NOT NULL: These are constraints. We'll talk about these later in this chapter.
7. DEFAULT TRUE: Specifies a default value for the column. We'll revisit this later.
*Notice that each column definition is comma separated; this is the standard in any SQL database management system.*

###############################################################################################################################

# Alter Tables
```
ALTER TABLE table_to_change
    stuff_to_change_goes_here
    additional_arguments
```

- Renaming a table
- Renaming a column
- Changing a column's data type
- Adding a constraint
- Removing a constraint
- Adding a column
- Removing a column
- Dropping a table

## Renaming a Table
```sql
ALTER TABLE users
      RENAME TO all_users;
```

## Renaming a Column
```sql
ALTER TABLE all_users
      RENAME COLUMN username TO full_name;
```

## Changing a Column's Datatype
We use `ALTER COLUMN` to target a specific column for change.

```sql
ALTER TABLE all_users
      ALTER COLUMN full_name TYPE varchar(25);
```

## Adding a Constraint
If we want to change a column's name or data type we need to alter the existing definition for those things. Constraints are a little different in that rather than changing them we add them to, or remove them from, the column definition 
(note: there is an `ALTER CONSTRAINT` clause that can be used to change certain aspects of `Foreign Key` constraints, but most of the time you will be adding or removing constraints). 
Another difference with constraints is that whereas a column can only have one name and one data type, it can have more than one constraint.

The syntax for adding constraints can vary depending on the type of constraint we're adding. Some types of constraint are considered 'table constraints' (even if they apply to a specific column) and others, such as `NOT NULL` are considered 'column constraints'.

In general, `NOT NULL` is always a column constraint. 
The remaining constraints (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `CHECK`) can be either table or column constraints.
The `CREATE TABLE` command lets you define both column and table constraints, while most other commands (like `ALTER TABLE`) only let you work with table constraints or `NOT NULL`. (We can also add column constraints when defining a new column in an existing table.)

Since `NOT NULL` is always a column constraint, there's a special command for adding the constraint to an existing table:
```sql
ALTER TABLE table_name
      ALTER COLUMN column_name
      SET NOT NULL;
```

To add any other constraint to an existing table, you must use this syntax to add a table constraint:
```sql
ALTER TABLE table_name
      ADD [ CONSTRAINT constraint_name ]
      constraint_clause;
```
*The brackets around constraint_name indicate that the name is optional.*

## Removing a Constraint
For most types of constraint, the same syntax can be used for both column and table constraints:
```sql
ALTER TABLE table_name
      DROP CONSTRAINT constraint_name;
```

When we use a specified data type of `serial` for a column, this automatically adds a `DEFAULT` clause that uses the nextval function to set id to the next available value if no value is specified.
If we want to drop a `DEFAULT` clause the syntax is a little different since it's not technically a constraint.

Example:
```sql
ALTER TABLE all_users
      ALTER COLUMN id
      DROP DEFAULT;
```

## Adding a Column
If you need to add a column to the table you've created, one that was not specified in the original schema, you can use an ADD COLUMN clause in an ALTER TABLE statement.

Example:
```sql
ALTER TABLE all_users
      ADD COLUMN last_login timestamp
                 NOT NULL
                 DEFAULT NOW();
```
The command above adds a new column to the `all_users` table with the name `last_login`, a datatype of `timestamp` and a `default` value based on the function `NOW()`.

*`NOW()` is a SQL function. It provides the current date and time when it is called.*

## Removing a Column
```sql
ALTER TABLE all_users DROP COLUMN last_login;
```

## Dropping Tables
```sql
DROP TABLE all_users;
```
**Caution: Actions such as DROP COLUMN and DROP TABLE are not reversible.**

###############################################################################################################################

## Alter Recap

### Add a column to a table:
```sql
ALTER TABLE table_name ADD COLUMN column_name data_type CONSTRAINTS;
```

### Alter a column's data type:
```sql
ALTER TABLE table_name ALTER COLUMN column_name TYPE data_type;
```

### Rename a Table:
```sql
ALTER TABLE table_name RENAME TO new_table_name;
```

### Rename a column within a table
```sql
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;
```

### Add column constraint (`NOT NULL`)
```sql
ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
```

### Add table constraint
```sql
ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_clause;
```

### Remove a table constraint
```sql
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
```

### Remove a column constraint
```sql
ALTER TABLE table_name ALTER COLUMN column_name DROP CONSTRAINT;
```

### Remove a column from a table
```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

### Delete a table from the database
```sql
DROP TABLE table_name;
```


###############################################################################################################
*Note that although in PostgreSQL boolean values display as t or f in the results of a SELECT query, t and f are not valid literal boolean values unless used in single quote marks: 't', 'f'. Other acceptable literals are true or false without quote marks; or 't', 'true', 'y', 'yes', 'on', '1' with quote marks for true, and 'f', 'false', 'n', 'no', 'off', '0' with quote marks for false.*

three ways to use the schema to restrict what values can be stored in a column:
1. Data type (which can include a length limitation)
2. NOT NULL Constraint
3. Check Constraint