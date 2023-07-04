The company president is looking to increase revenue. As a prelude to his decision making, he asks for two numbers: the amount of expected income from "big ticket" services (those services that cost more than $100) and the maximum income the company could achieve if it managed to convince all of its customers to select all of the company's big ticket items.

For simplicity, your solution should involve two separate SQL queries: one that reports the current expected income level, and one that reports the hypothetical maximum. The outputs should look like this:
```sql
 sum
--------
 500.00
(1 row)

   sum
---------
 10493.00
(1 row)
```


------
Expected:
```sql
SELECT sum(price) FROM services
INNER JOIN customers_services ON service_id = services.id
WHERE price > 100;
```

Hypothetical
```sql
SELECT SUM(price)
FROM customers
CROSS JOIN services
WHERE price > 100;
```


**Further Exploration**
This exercise is really contrived: it just shows how hard it is to come up with a possible use case for `CROSS JOIN`. `CROSS JOIN` is generally best suited to generating test data rather than production queries.

Can you think of any other situations where a `CROSS JOIN` might be useful?

-----
`CROSS JOIN` seems useful for hypothetical scenarios and for exploratory purposes. Scenarios where we'd want to know all possible combinations of certain elements in a database.