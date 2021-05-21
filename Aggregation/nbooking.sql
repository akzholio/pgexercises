/*
Produce a list of each member name, id, and their first booking
after September 1st 2012. Order by member ID.
*/
SELECT DISTINCT
  mem.surname,
  mem.firstname,
  bks.memid,
  MIN(bks.starttime) OVER (PARTITION BY bks.memid) AS starttime
FROM cd.bookings bks
  LEFT JOIN cd.members mem USING(memid)
WHERE bks.starttime > '2012-09-01 00:00:00'
ORDER BY 3;
