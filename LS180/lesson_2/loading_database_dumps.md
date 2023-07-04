There are two ways to load SQL files into a PostgreSQL database.

# psql
## Import
The first option is to pipe the SQL file into the psql program, using redirection on the command line to stream the SQL file into psql's standard input:
```bash
$ psql -d my_database < file_to_import.sql
```
This will execute the SQL statements within file_to_import.sql within the my_database database.

If we already have a running psql session, though, we can import a SQL file using the \i meta command:
```sql
my_database=# \i ~/some/files/file_to_import.sql
```
This will have the same effect as the first command, but does not require exiting a running psql session.




## Export
(https://www.postgresql.org/docs/current/app-pgdump.html)
```bash
$ pg_dump -d my_database -t my_table --inserts > dump.sql
```
If we leave off the `--inserts` argument to `pg_dump`, the resulting SQL statements will still restore the table and its data. The format will just be slightly different, using a `COPY FROM stdin` statement instead of multiple `INSERT` statements.

`COPY FROM` is the default for a reason (it is more efficient on large data sets), but using `INSERTS` is also valid and creates SQL statements that are typically the same as those that a user of the database might write themselves when adding data to the table manually.

with `--inserts`
```sql
--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: instructor
--

INSERT INTO weather VALUES ('2016-03-07', 29, 32, 0.000);
INSERT INTO weather VALUES ('2016-03-08', 23, 31, 0.000);
INSERT INTO weather VALUES ('2016-03-09', 17, 28, 0.000);
INSERT INTO weather VALUES ('2016-03-01', 34, 43, 0.117);
INSERT INTO weather VALUES ('2016-03-02', 32, 44, 0.117);
INSERT INTO weather VALUES ('2016-03-03', 31, 47, 0.156);
INSERT INTO weather VALUES ('2016-03-04', 33, 42, 0.078);
INSERT INTO weather VALUES ('2016-03-05', 39, 46, 0.273);
INSERT INTO weather VALUES ('2016-03-06', 32, 43, 0.078);
```

without `--inserts`
```sql
COPY weather (date, low, high, rainfall) FROM stdin;
2016-03-07  29  32  0.000
2016-03-08  23  31  0.000
2016-03-09  17  28  0.000
2016-03-01  34  43  0.117
2016-03-02  32  44  0.117
2016-03-03  31  47  0.156
2016-03-04  33  42  0.078
2016-03-05  39  46  0.273
2016-03-06  32  43  0.078
\.
```