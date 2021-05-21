/*
Produce a list of the total number of slots booked per facility in the month of
September 2012. Produce an output table consisting of facility id and slots,
sorted by the number of slots.
*/
SELECT
  fac.facid,
  SUM(bks.slots) AS total_slots
FROM cd.facilities fac
  LEFT JOIN cd.bookings bks USING(facid)
WHERE DATE(bks.starttime) BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY 1
ORDER BY 2;
