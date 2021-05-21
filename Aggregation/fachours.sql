/*
Produce a list of the total number of slots booked per facility.
For now, just produce an output table consisting of facility id and slots, sorted by facility id.
*/
SELECT
  fac.facid,
  SUM(bks.slots)
FROM cd.facilities fac
  LEFT JOIN cd.bookings bks USING(facid)
GROUP BY 1
ORDER BY 1;
