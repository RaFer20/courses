Does the following statement use the DDL or DML component of SQL?
```sql
DROP DATABASE xyzzy;
```

DDL, we're dropping the whole structure of the database and it's tables, we're also removing any data in those tables.

"`DROP DATABASE` removes all data from the database, including any and all tables in the database. In this respect, it manipulates data, so some people think of it as part of DML. However, `DROP DATABASE` also deletes everything about the structure of the database and its tables. Furthermore, all variants of the DROP statement are generally treated as DDL. In these respects, `DROP DATABASE` manipulates how the data is structured, so it is considered part of the DDL sublanguage."