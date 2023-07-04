Write a query that displays the description for every service that is subscribed to by at least 3 customers. Include the customer count for each description in the report. The report should look like this:
```sql
 description  | count
--------------+-------
 DNS          |     3
 Unix Hosting |     5
(2 rows)
```

-----
```sql
SELECT description, COUNT(service_id)
FROM services
LEFT JOIN customers_services
             ON services.id = service_id
GROUP BY description
HAVING COUNT(customers_services.customer_id) >= 3;
```