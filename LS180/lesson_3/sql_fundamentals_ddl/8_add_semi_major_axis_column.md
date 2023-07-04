Add a `semi_major_axis` column for the semi-major axis of each planet's orbit; the semi-major axis is the average distance from the planet's star as measured in astronomical units (1 AU is the average distance of the Earth from the Sun). Use a data type of numeric, and require that each planet have a value for the `semi_major_axis`.

```sql
ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;
```

**Further Exploration**
Assume the planets table already contains one or more rows of data. What will happen when you try to run the above command? What will you need to do differently to obtain the desired result? To test this, delete the semi_major_axis column and then add a row or two of data (note: your stars table will also need some data that corresponds to the star_id values):
```sql
ALTER TABLE planets
DROP COLUMN semi_major_axis;

DELETE FROM stars;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

INSERT INTO planets (designation, mass, star_id)
           VALUES ('b', 0.0036, 9); -- check star_id; see note below
INSERT INTO planets (designation, mass, star_id)
           VALUES ('c', 0.1, 10); -- check star_id; see note below

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;
```
NOTE: The semi_major_axis for Alpha Centauri B planet b is 0.04 AU while that for Epsilon Eridani planet c is about 40 AU. Note also that the star_id values shown above may be different from what is in your database. Check your stars table to see which star_id values to use.

We get the error: "column "semi_major_axis" contains null values"
To get the desired result we must add the `semi_major_axis` column without the `NOT NULL` constraint:
```sql
ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric;
```

Then we modify the NULL values to the values we need:
```sql
UPDATE planets SET semi_major_axis=0.04 WHERE designation='b';
UPDATE planets SET semi_major_axis=40 WHERE designation='c';
```

Finally, we make the value in `semi_major_axis` required:
```sql
ALTER TABLE planets
  ALTER COLUMN semi_major_axis SET NOT NULL;
```