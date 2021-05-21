/*
In our previous exercises, we deleted a specific member who had never made a booking.
How can we make that more general, to delete all members who have never made a booking?
*/
WITH base AS (
  SELECT memid FROM cd.members
  LEFT JOIN cd.bookings b USING(memid)
  WHERE b.memid IS NULL
  )
DELETE FROM cd.members
WHERE memid IN (SELECT memid FROM base);
