For this exercise, use a scalar subquery to determine the number of bids on each item. The entire query should return a table that has the `name` of each item along with the number of bids on an item.

Here is the expected output:
```sql
    name      | count
--------------+-------
Video Game    |     4
Outdoor Grill |     1
Painting      |     8
Tent          |     4
Vase          |     9
Television    |     0
(6 rows)
```

-----------------------

```sql
SELECT name, (SELECT count(item_id) FROM bids WHERE bids.item_id = items.id) FROM items;
```

**Further Exploration**
If we wanted to get an equivalent result, without using a subquery, then we would have to use a LEFT OUTER JOIN. Can you come up with the equivalent query that uses LEFT OUTER JOIN?

-----------------------

```sql
SELECT items.name, count(bids.item_id) FROM items 
LEFT OUTER JOIN bids ON items.id = bids.item_id
GROUP BY name;
```

