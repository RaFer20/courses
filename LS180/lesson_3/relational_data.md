# What is Relational Data
Relational databases are called relational because they persist data in a set of relations. What is a relation? A table, which is a set of columns and rows of data, is a relation. PostgreSQL also exposes some other objects as relations, such as sequences and views. If you can use something in the `FROM` clause in a `SELECT` statement, it's probably a relation.

The words 'relation' and 'relationship' are visually similar, but they name two distinct things within a database. A relationship is a connection between entity instances, or rows of data, usually resulting from what those rows of data represent.
For example: a row in a customers table in a database would probably have a relationship with zero or more rows in an orders table.

- A relation is usually another way to say "table".
- A relationship is an association between the data stored in those relations.

For a developer, relational data can be translated into a more functional definition: working with more than one table at a time. There are many reasons to break data up into multiple tables, and considerations about how tables and their keys and constraints interact affects how rows are retrieved, inserted, updated, and deleted. 