/*
Produce a list of facilities with more than 1000 slots booked.
Produce an output table consisting of facility id and slots, sorted by facility id.
*/
SELECT
  fac.facid,
  SUM(bks.slots) AS total_slots
FROM cd.facilities fac
  JOIN cd.bookings bks USING(facid)
GROUP BY 1
HAVING SUM(bks.slots) > 1000
ORDER BY 1;
