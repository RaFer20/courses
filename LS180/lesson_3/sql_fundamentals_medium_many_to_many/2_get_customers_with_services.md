Write a query to retrieve the customer data for every customer who currently subscribes to at least one service.

---
```sql
SELECT DISTINCT customers.* FROM customers 
INNER JOIN customers_services AS CS
ON customers.id = cs.customer_id;
```