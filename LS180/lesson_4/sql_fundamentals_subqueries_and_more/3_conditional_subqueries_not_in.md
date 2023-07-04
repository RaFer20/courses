Write a SQL query that shows all items that have not had bids put on them. Use the logical operator NOT IN for this exercise, as well as a subquery.

Here is the expected output:
```sql
 Not Bid On
------------
 Television
(1 row)
```

--------------


```sql
SELECT name AS "Not Bid On" FROM items WHERE items.id NOT IN
(SELECT item_id FROM bids);
```