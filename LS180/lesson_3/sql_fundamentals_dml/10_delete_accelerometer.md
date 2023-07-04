Our workshop has decided to not make an Accelerometer after all. Delete any data related to "Accelerometer", this includes the parts associated with an Accelerometer.


```sql
DELETE FROM parts WHERE device_id=1;
DELETE FROM devices WHERE name='Accelerometer' AND id=1;
```


**Further Exploration**
This process may have been a bit simpler if we had initially defined our devices tables a bit differently. We could delete both a device and its associated parts with one SQL statement if that were the case. What change would have to be made to table parts to make this possible? Also, what SQL statement would you have to write that can delete both a device and its parts all in one go?



We could have added `ON DELETE CASCADE` to `device_id` in `parts` when creating the table.

We must first remove the current foreign key from `parts`:
```sql
ALTER TABLE parts DROP CONSTRAINT parts_device_id_fkey;
```
We can now add it and if the row being referenced is deleted the row referencing it will be deleted aswell:
```sql
ALTER TABLE parts
ADD CONSTRAINT parts_device_id_fkey 
FOREIGN KEY (device_id)
REFERENCES devices(id)
ON DELETE CASCADE;
```

Now we can just delete the device from the `devices` table and it will delete the parts associated with it in the `parts` table.
```sql
DELETE FROM devices WHERE id=4; /* id of the device*/
```
