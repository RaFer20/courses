We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". Write an SQL statement that will associate the last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".

```sql
UPDATE parts SET device_id = 1
WHERE part_number=7 OR part_number=8;
```

**Further Exploration**
What if we wanted to set the part with the smallest part_number to be associated with "Gyroscope"? How would we go about doing that?

```sql
UPDATE parts SET device_id = 2
WHERE part_number = (SELECT min(part_number) FROM parts);
```