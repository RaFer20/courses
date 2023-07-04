Assuming that everybody in our database has a bill coming due, and that all of them will pay on time, write a query to compute the total gross income we expect to receive.

Answer:
```sql
  gross
 --------
 678.50
(1 row)
```


-----
```sql
SELECT sum(price) AS Gross FROM services
INNER JOIN customers_services on services.id = service_id;
```