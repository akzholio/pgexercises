-- How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT
  bks.starttime
FROM cd.bookings bks
INNER JOIN cd.members mem
  ON mem.firstname = 'David'
  AND mem.surname = 'Farrell'
  AND mem.memid = bks.memid;
