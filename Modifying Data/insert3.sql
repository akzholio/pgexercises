/*
Let's try adding the spa to the facilities table again.
This time, though, we want to automatically generate the value for the next facid,
rather than specifying it as a constant.

Use the following values for everything else:
  Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
*/
INSERT INTO cd.facilities
  (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT
  MAX(facid) + 1 AS facid,
  'Spa' AS name,
  20 AS membercost,
  30 AS guestcost,
  100000 AS initialoutlay,
  800 AS monthlymaintenance
FROM cd.facilities;
