/*
The Produce a list of costly bookings exercise contained some messy logic:
we had to calculate the booking cost in both the WHERE clause and the CASE statement.
Try to simplify this calculation using subqueries.
For reference, the question was:
  How can you produce a list of bookings on the day of 2012-09-14 which will
  cost the member (or guest) more than $30?
  Remember that guests have different costs to members (the listed costs are per
  half-hour 'slot'), and the guest user is always ID 0.
  Include in your output the name of the facility, the name of the member
  formatted as a single column, and the cost. Order by descending cost.
*/
WITH base AS (
  SELECT
  	mem.firstname || ' ' || mem.surname AS member,
  	fac.name AS facility,
  	CASE
  		WHEN mem.memid = 0 THEN fac.guestcost * bks.slots
  		ELSE fac.membercost * bks.slots
  	END AS cost
  FROM cd.bookings bks
  INNER JOIN cd.members mem USING(memid)
  LEFT JOIN cd.facilities fac USING(facid)
  WHERE DATE(bks.starttime) = '2012-09-14'
)
SELECT * FROM base
WHERE cost > 30
ORDER BY cost DESC;
