# Using keys
Table we're working with:
```sql
sql-course=# SELECT * FROM films;
           title           | year |   genre   |       director       | duration
---------------------------+------+-----------+----------------------+----------
 Die Hard                  | 1988 | action    | John McTiernan       |      132
 Casablanca                | 1942 | drama     | Michael Curtiz       |      102
 The Conversation          | 1974 | thriller  | Francis Ford Coppola |      113
 1984                      | 1956 | scifi     | Michael Anderson     |       90
 Tinker Tailor Soldier Spy | 2011 | espionage | Tomas Alfredson      |      127
 The Birdcage              | 1996 | comedy    | Mike Nichols         |      118
(6 rows)
```

If we add an earlier version and a remake of 'Godzilla'
```sql
INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139);
INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 2014, 'scifi', 'Gareth Edwards', 123);
```

We wouldnt be able to just use the title to update information on the table:
```sql
UPDATE films SET duration = 92 WHERE title = 'Godzilla';
```

We could be more specific on our `WHERE` condition to include a second piece of information, like the year:
```sql
UPDATE films SET duration = 141 WHERE title = 'Godzilla' AND year = 2014;
```

But it still wouldn't be a great solution because now we need to know two piece of information about the row we want to update. Some rows in larger tables could have even more identical values.
*It is entirely possible to have identical rows of data that represent different real-world entities appear in the same table.*

# Solving the Problem: Keys
The solution to this problem is to stop using values that have not been carefully selected to be unique across the entire dataset.

SQL databases provide something called keys that solve this problem. A key uniquely identifies a single row in a database table. There are two types of keys that we'll cover for now:

- Natural keys
- Surrogate keys

## Natural Keys
A natural key is an existing value in a dataset that can be used to uniquely identify each row of data in that dataset. On the surface there appear to be a lot of values that might be satisfactory for this use: a person's phone number, email address, social security number, or a product number.

In reality most values that seem like they are good candidates for natural keys turn out to not be. A phone number and email address can change hands. A social security number shouldn't change but only some people have them. And products often go through multiple revisions while retaining the same product number.

There are a variety of solutions to these problems, including using more than one existing value together as a composite key. But instead of solving the problems associated with natural keys, this will often just defer the problem until later without actually addressing it.

## Surrogate Keys
A surrogate key is a value that is created solely for the purpose of identifying a row of data in a database table. Because it is created specifically for that purpose, it can avoid many of the problems associated with natural keys.

Perhaps the most common surrogate key in use today is an auto-incrementing integer. This is a value that is added to each row in a table as it is created. With each row, this value increases in order to remain unique in each row.

If we create a table with a surrogate key:
```sql
CREATE TABLE colors (id serial, name text);
```

It's common to call the surrogate key created for a table id (short for identifier).

```sql
INSERT INTO colors (name) VALUES ('red');
INSERT INTO colors (name) VALUES ('green');
INSERT INTO colors (name) VALUES ('blue');

sql-course=# SELECT * FROM colors;
 id | name
----+-------
  1 | red
  2 | green
  3 | blue
(3 rows)
```

All three rows we've added had values automatically entered in their `id` column. We can use these values to identify each row, regardless of the other values in the row. Also, since these `id` values are created by this database, there is no way they will ever change due to outside forces.

serial columns in PostgreSQL are actually a short-hand for a column definition that is much longer:
```sql
-- This statement:
CREATE TABLE colors (id serial, name text);

-- is actually interpreted as if it were this one:
CREATE SEQUENCE colors_id_seq;
CREATE TABLE colors (
    id integer NOT NULL DEFAULT nextval('colors_id_seq'),
    name text
);
```
A sequence is a special kind of relation that generates a series of numbers. A sequence will remember the last number it generated, so it will generate numbers in a predetermined sequence automatically.

The sequence's value is used as the id column's default value. The next value of a sequence is accessed using nextval, and can be done in any SQL statement:
```sql
sql-course=# SELECT nextval('colors_id_seq');
 nextval
---------
       4
(1 row)
```
**Once a number is returned by nextval for a standard sequence, it will not be returned again, regardless of whether the value was stored in a row or not.**
If we insert another row into the colors table, the `id` value for that row will skip 4 and move on to the next value in the sequence:
```sql
sql-course=# INSERT INTO colors (name) VALUES ('yellow');
INSERT 0 1
sql-course=# SELECT * FROM colors;
 id |  name
----+--------
  1 | red
  2 | green
  3 | blue
  5 | yellow
(4 rows)
```

# Enforcing Uniqueness
A potential problem with the colors table we've been working with so far has to do with ensuring the values in the `id` column are unique. 
This is a requirement of using that column as a key - if there are duplicate values, then that column stops being able to uniquely identify a single row:
```sql
sql-course=# INSERT INTO colors (id, name) VALUES (3, 'orange');
INSERT 0 1
sql-course=# SELECT * FROM colors;
 id |  name
----+--------
  1 | red
  2 | green
  3 | blue
  5 | yellow
  3 | orange
(5 rows)
```

We can fix the `id` for orange and then add a `UNIQUE` constraint:
```sql
sql-course=# UPDATE colors SET id = nextval('colors_id_seq') WHERE name = 'orange';
UPDATE 1
sql-course=# ALTER TABLE colors ADD CONSTRAINT id_unique UNIQUE (id);
ALTER TABLE
sql-course=# SELECT * FROM colors;
 id |  name
----+--------
  1 | red
  2 | green
  3 | blue
  5 | yellow
  6 | orange
(5 rows)
```

Now duplicates in the `id` column will not be an issue:
```sql
sql-course=# INSERT INTO colors (id, name) VALUES (3, 'purple');
ERROR:  duplicate key value violates unique constraint "id_unique"
DETAIL:  Key (id)=(3) already exists.
```

adding a row without attempting to assign an id will still use the sequence to automatically fill in that value:
```sql
sql-course=# INSERT INTO colors (name) VALUES ('purple');
INSERT 0 1
sql-course=# SELECT * FROM colors;
 id |  name
----+--------
  1 | red
  2 | green
  3 | blue
  5 | yellow
  6 | orange
  7 | purple
(6 rows)
```

# Primary Keys
PostgreSQL has another shortcut for creating columns that uniquely identify the rows in a table.
```sql
CREATE TABLE more_colors (id int PRIMARY KEY, name text);
```

By specifying PRIMARY KEY (in a similar way to how we would specify NOT NULL), PostgreSQL will create an index on that column that enforces it holding unique values in addition to preventing the column from holding NULL values. 

The code above is essetially the same as:
```sql
CREATE TABLE more_colors (id int NOT NULL UNIQUE, name text);
```

The difference between the two is documenting your intention as a database designer. By using PRIMARY KEY, the fact that a certain column can be relied upon as a way to identify specific rows is baked into the table's schema.

*Note that, though PRIMARY KEY is effectively the same as having both NOT NULL and UNIQUE constraints, the PRIMARY KEY does not require those constraints*I
*If we want to change an existing column to a PRIMARY KEY, you don't have to add the NOT NULL and UNIQUE constraints first -- all that is required is that the column contains unique values, none of which are NULL.*

Different teams and software packages may have varying conventions, but contemporary database development within the Ruby, JavaScript, and other communities has settled on the following conventions for working with tables and primary keys:

1. All tables should have a primary key column called id.
2. The id column should automatically be set to a unique value as new rows are inserted into the table.
3. The id column will often be an integer, but there are other data types (such as UUIDs) that can provide specific benefits.

Technically we don't have to declare a `PRIMARY KEY` in every tables but doing so is a good idea.

# UUID 
UUIDs (or universally unique identifiers) are very large numbers that are used to identify individual objects or, when working with a database, rows in a database. There are a few formats and different ways to generate these numbers (they don't increment by 1 as we've been doing). UUIDs are often represented using hexadecimal strings with dashes such as `f47ac10b-58cc-4372-a567-0e02b2c3d479`.