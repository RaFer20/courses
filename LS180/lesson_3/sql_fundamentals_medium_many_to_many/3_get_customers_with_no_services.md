Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.

---
```sql
SELECT DISTINCT customers.* FROM customers
LEFT JOIN customers_services AS cs ON customers.id = cs.customer_id
WHERE cs.service_id IS NULL;
```
---

**Further Exploration**
Can you write a query that displays all customers with no services and all services that currently don't have any customers? The output should look like this:
```sql
 id |     name      | payment_token | id |     description     | price
----+---------------+---------------+----+---------------------+--------
  2 | Nancy Monreal | JKWQPJKL      |    |                     |
    |               |               |  8 | One-to-one Training | 999.00
(2 rows)
```

---
```sql
SELECT DISTINCT customers.*, services.* FROM customers
LEFT JOIN customers_services AS cs ON customers.id = cs.customer_id
FULL JOIN services ON cs.service_id = services.id
WHERE cs.service_id IS NULL OR cs.customer_id IS NULL;
```
(the first condition on the `WHERE` clause works alone but leaving the `OR` seems more clear)