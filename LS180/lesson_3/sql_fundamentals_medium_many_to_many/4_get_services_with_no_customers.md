Using RIGHT OUTER JOIN, write a query to display a list of all services that are not currently in use. Your output should look like this:
```sql
 description
-------------
 One-to-one Training
(1 row)
```


-----
```sql
SELECT services.description FROM customers_services
RIGHT OUTER JOIN services ON services.id = customers_services.service_id
WHERE customer_id IS NULL;
```