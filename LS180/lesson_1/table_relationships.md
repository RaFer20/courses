# Normalization
Normalization is the process of splitting up data to remove duplication and improve data integrity.

Important things to remember:
- The reason for normalization is to reduce data redundancy and improve data integrity.
- The mechanism for carrying out normalization is arranging data in multiple tables and defining relationships between them.

# Database Design
At a high level, the process of database design involves defining 'entities' to represent different sorts of data and designing relationships between those entities.

## Entities
An entity represents a real world object, or a set of data that we want to model within our database; we can often identify these as the major nouns of the system we're modeling.

## Relationships
An ERD is a graphical representation of entities and their relationships to each other, and is a commonly used tool within database design. There are different types of ERD varying from conceptual to detailed, and often using specific conventions such as crow's foot notation to model relationships. 

# Keys
Keys are a special type of constraint used to establish relationships and uniqueness. They can be used to identify a specific row in the current table, or to refer to a specific row in another table.

## Primary Keys
A Primary Key is a unique identifier for a row of data.

In order to act as a unique identifier, a column must contain some data, and that data should be unique to each row. Making a column a PRIMARY KEY is essentially equivalent to adding NOT NULL and UNIQUE constraints to that column.

To set a primary key:
```sql
ALTER TABLE users ADD PRIMARY KEY (id);
```

Although any column in a table can have UNIQUE and NOT NULL constraints applied to them, each table can have only one Primary Key. It is common practice for that Primary Key to be a column named `id`.

## Foreign Keys
A Foreign Key allows us to associate a row in one table to a row in another table. This is done by setting a column in one table as a Foreign Key and having that column reference another table's Primary Key column. Creating this relationship is done using the REFERENCES keyword in this form:
```sql
FOREIGN KEY (fk_col_name)
REFERENCES target_table_name (pk_col_name);
```

We can think of this reference as creating a connection between rows in different tables.

Referential integrity is the assurance that a column value within a record must reference an existing value; if it doesn't then an error is thrown. In other words, PostgreSQL won't allow you to add a value to the Foreign Key column of a table if the Primary Key column of the table it is referencing does not already contain that value.


Example(Using sql_book database):
1. A User can have ONE address. An address has only ONE user.
2. A review can only be about ONE Book. A Book can have MANY reviews.
3. A User can have MANY books that he/she may have checked out or returned. A Book can be/ have been checked out by MANY users.

The entity relationships described above can be classified into three relationship types:
- one-to-one
- one-to-many
- many-to-many


## One-to-One
A one-to-one relationship between two entities exists when a particular entity instance exists in one table, and it can have only one associated entity instance in another table.

Example: A user can have only one address, and an address belongs to only one user.
```sql
CREATE TABLE addresses (
  user_id int,  -- Both a primary and foreign key
  street varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  state varchar(30) NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id)
      REFERENCES users (id)
      ON DELETE CASCADE
);
```
Notice the PRIMARY KEY and FOREIGN KEY clauses at the end of the CREATE statement. These two clauses make the user_id both the Primary key of the addresses table and the Foreign key that references the users table.

```sql
INSERT INTO addresses
         (user_id, street, city, state)
  VALUES (1, '1 Market Street', 'San Francisco', 'CA'),
         (2, '2 Elm Street', 'San Francisco', 'CA'),
         (3, '3 Main Street', 'Boston', 'MA');
```
The user_id column uses values that exist in the id column of the users table in order to connect the tables through the foreign key constraint we just created.

## Referential Integrity
The constraints we've defined for our `addresses` table enforce the one-to-one relationship we want between it and our `users` table, whereby a user can only have one address and an address must have one, and only one, user. This is an example of referential integrity.

If we try to add an address for a user that already has one we get an error:
```sql
INSERT INTO addresses (user_id, street, city, state)
  VALUES (1, '2 Park Road', 'San Francisco', 'CA');

ERROR:  duplicate key value violates unique constraint "addresses_pkey"
DETAIL:  Key (user_id)=(1) already exists.
```

We get a different error if we try to add an address for a user that doesn't exist:
```sql
INSERT INTO addresses (user_id, street, city, state)
       VALUES (7, '11 Station Road', 'Portland', 'OR');

ERROR:  insert or update on table "addresses" violates foreign key constraint "addresses_user_id_fkey"
DETAIL:  Key (user_id)=(7) is not present in table "users".
```

### The ON DELETE Clause
Adding this clause, and setting it to `CASCADE` basically means that if the row being referenced is deleted, the row referencing it is also deleted. 

There are alternatives to `CASCADE` such as `SET NULL` or `SET DEFAULT` which instead of deleting the referencing row will set a new value in the appropriate column for that row.

Determining what to do when a row is deleted is an important design decision and part of mantaining referential integrity.
In the case of PostgreSQL an error will be thrown if we try to delete a row that is being referenced by another row in another table and we have no `ON DELETE` clause for that reference.

## One-to-Many
A one-to-many relationship exists between two entities if an entity instance in one of the tables can be associated with multiple records (entity instances) in the other table but the opposite relationship doesn't exist; each entity instance in the second table can only be associated with one entity instance in the first table.

Example: A review belongs to only one book. A book has many reviews.
```sql
CREATE TABLE books (
  id serial,
  title varchar(100) NOT NULL,
  author varchar(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn char(12),
  PRIMARY KEY (id),
  UNIQUE (isbn)
);
/*
 one-to-many: Book has many reviews
*/
CREATE TABLE reviews (
  id serial,
  book_id integer NOT NULL,
  reviewer_name varchar(255),
  content varchar(255),
  rating integer,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id)
      REFERENCES books(id)
      ON DELETE CASCADE
);
```

Adding some data:
```sql
INSERT INTO books
  (id, title, author, published_date, isbn)
  VALUES
      (1, 'My First SQL Book', 'Mary Parker',
          '2012-02-22 12:08:17.320053-03',
          '981483029127'),
      (2, 'My Second SQL Book', 'John Mayer',
          '1972-07-03 09:22:45.050088-07',
          '857300923713'),
      (3, 'My First SQL Book', 'Cary Flint',
          '2015-10-18 14:05:44.547516-07',
          '523120967812');

INSERT INTO reviews
  (id, book_id, reviewer_name, content, rating,
       published_date)
  VALUES
      (1, 1, 'John Smith', 'My first review', 4,
          '2017-12-10 05:50:11.127281-02'),
      (2, 2, 'John Smith', 'My second review', 5,
          '2017-10-13 15:05:12.673382-05'),
      (3, 2, 'Alice Walker', 'Another review', 1,
          '2017-10-22 23:47:10.407569-07');
```
The order in which we add the data is important here. Since a column in `reviews` references data in `books` we must first ensure that the data exists in the `books` table for us to reference.

Just as with the `users`/ `addresses` relationship, the `FOREIGN KEY` creates relationships between the `reviews` table and the `books` table. Unlike the `users`/ `addresses` relationship however, both `books` and `users` can have multiple reviews. For example the `id` value of `2` for `My Second SQL Book` appears twice in the `book_id` column of the `reviews` table.

## Many-to-Many
A many-to-many relationship exists between two entities if for one entity instance there may be multiple records in the other table, and vice versa.

Example: A user can check out many books. A book can be checked out by many users (over time).

There isn't a way to implement a many-to-many relationship between two tables directly. Instead, we break apart this many-to-many relationship into two one-to-many relationships using a third, cross-reference, table (also known as a 'join table').
This table holds the relationship between the two entities, by having two `FOREIGN KEY`s, each of which references the `PRIMARY KEY` of one of the tables for which we want to create this relationship. 

We will create a cross-reference table `checkouts` in our example:
```sql
CREATE TABLE checkouts (
  id serial,
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
                        ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(id)
                        ON DELETE CASCADE
);
```
Here, the `user_id` column in checkouts references the `id` column in `users`, and the `book_id` column in `checkouts` references the `id` column in books. Each row of the `checkouts` table uses these two Foreign Keys to create an association between rows of `users` and `books`.

*sidenote*:our table contains a couple of other columns `checkout_date `and `return_date`. While these aren't necessary to create the relationship between the users and books table, they can provide additional context to that relationship.
This kind of additional context can be useful within the business logic of the application using our database. For example, in order to prevent more than one user trying to check out the same book at the same time, the app could determine which books are currently checked out by querying those that have a value in the `checkout_date` column of the checkouts table but where the `return_date` is set to `NULL`.

Now that we have our checkouts created, we can add the data that will create the associations between the rows in `users` and `books`.
```sql
INSERT INTO checkouts
  (id, user_id, book_id, checkout_date, return_date)
  VALUES
    (1, 1, 1, '2017-10-15 14:43:18.095143-07',
              NULL),
    (2, 1, 2, '2017-10-05 16:22:44.593188-07',
              '2017-10-13 13:0:12.673382-05'),
    (3, 2, 2, '2017-10-15 11:11:24.994973-07',
              '2017-10-22 17:47:10.407569-07'),
    (4, 5, 3, '2017-10-15 09:27:07.215217-07',
              NULL);
```

We can think of a many-to-many relationship as combining two one-to-many relationships; in this case between `checkouts` and `users`, and between `checkouts` and `books`.


# Recap

Relationship	    |Example
one-to-one	      |A User has ONE address
one-to-many	      |A Book has MANY reviews
many-to-many	    |A user has MANY books and a book has MANY users