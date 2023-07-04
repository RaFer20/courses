Write a query to display a list of all customer names together with a comma-separated list of the services they use. Your output should look like this:
```sql
     name      |                                services
---------------+-------------------------------------------------------------------------
 Pat Johnson   | Unix Hosting, DNS, Whois Registration
 Nancy Monreal |
 Lynn Blake    | DNS, Whois Registration, High Bandwidth, Business Support, Unix Hosting
 Chen Ke-Hua   | High Bandwidth, Unix Hosting
 Scott Lakso   | DNS, Dedicated Hosting, Unix Hosting
 Jim Pornot    | Unix Hosting, Dedicated Hosting, Bulk Email
(6 rows)
```

-----
```sql
SELECT customers.name, string_agg(services.description, ', ') AS services FROM customers
LEFT JOIN customers_services AS cs ON customers.id = cs.customer_id
LEFT JOIN services ON cs.service_id = services.id
GROUP BY customers.id;
```

-----

**Further Exploration**
Can you modify the above command so the output looks like this?
```sql
     name      |    description
---------------+--------------------
 Chen Ke-Hua   | High Bandwidth
               | Unix Hosting
 Jim Pornot    | Dedicated Hosting
               | Unix Hosting
               | Bulk Email
 Lynn Blake    | Whois Registration
               | High Bandwidth
               | Business Support
               | DNS
               | Unix Hosting
 Nancy Monreal |
 Pat Johnson   | Whois Registration
               | DNS
               | Unix Hosting
 Scott Lakso   | DNS
               | Dedicated Hosting
               | Unix Hosting
(17 rows)
```
Hint: you will need to use the window lag function together with a CASE condition in your SELECT. To get you started, try this command:
```sql
SELECT customers.name,
       lag(customers.name)
         OVER (ORDER BY customers.name)
         AS previous,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;
```


--------
```sql
SELECT  CASE WHEN customers.name = lag(customers.name) OVER (ORDER BY customers.name) THEN NULL
        ELSE customers.name
        END,
        services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;
```