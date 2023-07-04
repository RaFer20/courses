Does the following statement use the DDL or DML component of SQL?
```sql
CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
```

It uses DDL, we're defining the type of information that will be stored in the table, we're not manipulating any actual data.