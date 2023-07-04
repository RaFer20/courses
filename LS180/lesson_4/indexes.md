# What are Indexes
In the context of a database, an index is a mechanism that SQL engines use to speed up queries. They do this by storing indexed data in a table-like structure, which can be quickly searched using particular search algorithms. The results of the search provide a link back to the record(s) to which the indexed data belongs. Using an index means that the database engine can locate column values more efficiently since it doesn't have to search through every record in a table in sequence.

# When to use an Index?
When we build an index of a field, reads become faster, but every time a row is updated or inserted, the index must be updated as well. Now we're updating not only the table but also the index, so that's a performance cost. As with many database optimization decisions, there are a lot of choices involved in how to decide whether or not a column should be designated an index.

Making such choices is often about trade-offs. There are some useful rules of thumb that can help when assessing what those trade-offs are:
- Indexes are best used in cases where sequential reading is inadequate. For example: columns that aid in mapping relationships (such as Foreign Key columns), or columns that are frequently used as part of an ORDER BY clause, are good candidates for indexing.

- They are best used in tables and/ or columns where the data will be read much more frequently than it is created or updated.

## Types of Index
Another decision when using indexes is the type of index to use. Different types of index use different data structures and different search algorithms. Some of the index types available within PostgreSQL are B-tree, Hash, GiST, and GIN.


# Creating Indexes
When we define a PRIMARY KEY constraint, or a UNIQUE constraint, on a column we automatically create an index on that column. In fact, the index is the mechanism by which these constraints enforce uniqueness.

Example:
```sql
my_books=# CREATE TABLE authors (
my_books(#   id serial PRIMARY KEY,
my_books(#   name varchar(100) NOT NULL
my_books(# );
CREATE TABLE
my_books=# CREATE TABLE books (
my_books(#   id serial PRIMARY KEY,
my_books(#   title varchar(100) NOT NULL,
my_books(#   isbn char(13) UNIQUE NOT NULL,
my_books(#   author_id int REFERENCES authors(id)
my_books(# );
CREATE TABLE
my_books=# \d books
                          Table "public.books"
     Column     |          Type          |                     Modifiers
----------------+------------------------+----------------------------------------------------
 id             | integer                | not null default nextval('books_id_seq'::regclass)
 title          | character varying(100) | not null
 isbn           | character(13)          | not null
 author_id      | integer                |
Indexes:
  "books_pkey" PRIMARY KEY, btree (id)
  "books_isbn_key" UNIQUE CONSTRAINT, btree (isbn)
Foreign-key constraints:
  "books_author_id_fkey" FOREIGN KEY (author_id) REFERENCES authors(id)
```
In the description of the table schema, we can see two entries listed under Indexes:, books_pkey and books_isbn_key. The btree part of each entry identifies the type of index used (PostgreSQL uses B-tree by default for all indexes, and it is the only type available for unique indexes), followed by the name of the column that is indexed.

`FOREIGN KEY` constraints do not automatically create an index on a column, unlike `UNIQUE` and `PRIMARY KEY`.
Foreign keys are good candidates for indexes but we need to explicitly create an index for that column.

The general form for adding an index to a table is:
```sql
CREATE INDEX index_name ON table_name (field_name);
```

If we omit `index_name`, PostgreSQL automatically generates a unique name for the index. If you want to specify your own name for the index, it must be a name that hasn't already been used.

To add an index to the `author_id` column of the `books` table, we could execute the following statement:
```sql
my_books=# CREATE INDEX ON books (author_id);
CREATE INDEX
```

If we now look at schema for the table, we can see that there is another entry, books_author_id_idx, listed under `Indexes:`:
```sql
my_books=# \d books
                         Table "public.books"
     Column     |          Type          |                     Modifiers
----------------+------------------------+----------------------------------------------------
 id             | integer                | not null default nextval('books_id_seq'::regclass)
 title          | character varying(100) | not null
 isbn           | character(13)          | not null
 author_id      | integer                |
Indexes:
  "books_pkey" PRIMARY KEY, btree (id)
  "books_isbn_key" UNIQUE CONSTRAINT, btree (isbn)
  "books_author_id_idx" btree (author_id)
Foreign-key constraints:
  "books_author_id_fkey" FOREIGN KEY (author_id) REFERENCES authors(id)
```


## Unique and Non-unique
When we create an index via `PRIMARY KEY` or `UNIQUE` constraints, the index created is a unique index. When an index is unique, multiple table rows with equal values for that index are not allowed. The `books_pkey` and `books_isbn_key` indexes in the books table are unique indexes and it is not possible to insert duplicate values in the columns that they index. The `books_author_id_idx` index that we added doesn't enforce uniqueness, meaning that the same value can occur multiple times in the indexed column. 


## Multicolumn Indexes
Indexes can also be created on more than one column. The form is almost the same as a single-column index, except instead of specifying a single column name, you specify more than one:
```sql
CREATE INDEX index_name ON table_name (field_name_1, field_name_2);
```
Only certain index types support multi-column indexes, and there is a limit to the number of columns that can be combined in an index.

## Partial Indexes
Partial indexes are built from a subset of the data in a table. The subset of data is defined by a conditional expression, and the index contains entries only for the rows from the table where the value in the indexed column satisfies the condition.

Going back to our earlier `author_name` example, we could perhaps index only rows where the value `author_name` column starts with an A.

Partial indexes can be useful in certain situations, but most of the time we will be using single-column or perhaps multi-column indexes.

# Deleting Indexes
The `DROP INDEX` command can be used to delete the index that was created. In order to execute the command you need to refer to the index by its name.

Rather than displaying the entire schema for a table, another way of listing indexes is to use the `\di` psql console command. This is similar to the `\d` command, except rather than listing the tables, views, and sequences of a database, it lists the indexes.

```sql
my_books=# \di
              List of relations
 Schema |        Name         | Type  | Owner |  Table
--------+---------------------+-------+-------+---------
 public | authors_pkey        | index | User  | authors
 public | books_author_id_idx | index | User  | books
 public | books_isbn_key      | index | User  | books
 public | books_pkey          | index | User  | books
(4 rows)
```

Let's delete the books_author_id_idx we created earlier:
```sql
my_books=# DROP INDEX books_author_id_idx;
DROP INDEX
```

If we list the indexes now, we can see that the `books_author_id_idx index` is not there anymore:
```sql
my_books=# \di
                 List of relations
 Schema |      Name      | Type  | Owner |  Table
--------+----------------+-------+-------+---------
 public | authors_pkey   | index | karl  | authors
 public | books_isbn_key | index | karl  | books
 public | books_pkey     | index | karl  | books
(3 rows)
```

