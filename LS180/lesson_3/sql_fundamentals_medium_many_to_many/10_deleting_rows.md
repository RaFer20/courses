Write the necessary SQL statements to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database.

-----
```sql
DELETE FROM customers WHERE name = 'Chen Ke-Hua' AND id = 4;
DELETE FROM customers_services WHERE service_id = 7;
DELETE FROM services WHERE description = 'Bulk Email' AND id = 7;
```