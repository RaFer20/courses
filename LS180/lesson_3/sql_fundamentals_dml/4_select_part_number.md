We want to grab all parts that have a part_number that starts with 3. Write a `SELECT` query to get this information. This table may show all attributes of the parts table.

```sql
SELECT * FROM parts WHERE part_number::text LIKE '3%';
```
(converts `part_number` to `text` then searches for a strings that start with 3 in that column.)