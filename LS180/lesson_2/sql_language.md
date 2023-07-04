# SQL
SQL is a language used to manipulate the structure and values of datasets stored in a relational database. It is described as a special purpose language because it is typically used only for a very specific purpose: interacting with relational databases. SQL is predominantly a *declarative* language. This means that it describes what needs to be done, but does not detail how to accomplish this objective.

# DDL, DML, DCL
SQL is really three languages in one, containing smaller sub-languages for data definition, data manipulation, and data control. These are often referred to using acronyms:

sub-language	                      |controls	                          |SQL Constructs
DDL or data definition language       |relation structure and rules	  |CREATE, DROP, ALTER
DML or data manipulation language     |values stored within relations	  |SELECT, INSERT, UPDATE, DELETE
DCL or data control language	      |who can do what	                  |GRANT, REVOKE

## DDL: Data Definition Language
The data definition parts of SQL are what allow a user to create and modify the schema stored within a database.

## DML: Data Manipulation Language
This part of the SQL language is what allows a user to retrieve or modify the data stored within a database. 

## DCL: Data Control Language
DCL is tasked with controlling the rights and access roles of the users interacting with a database or table.

# Syntax:
SQL code is made up of statements. A SQL statement is terminated by a semicolon.

We can evaluate arbitrary SQL expressions by typing them after `SELECT`
```sql
sql-course=# SELECT 1;
 ?column?
----------
        1
(1 row)

sql-course=# SELECT 'abc';
 ?column?
----------
 abc
(1 row)
```

Expressions in SQL can make use of operators and functions. 
Examples using operators and functions:
```sql
sql-course=# SELECT 1 + 1;
 ?column?
----------
        2
(1 row)

sql-course=# SELECT (1 + 4) * 6;
 ?column?
----------
       30
(1 row)

sql-course=# SELECT round(1.5678);
 round
-------
     2
(1 row)
```