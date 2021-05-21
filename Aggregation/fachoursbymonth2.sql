/*
Produce a list of the total number of slots booked per facility per month in the
year of 2012. Produce an output table consisting of facility id and slots,
sorted by the id and month.
*/
SELECT
  fac.facid,
  EXTRACT(MONTH FROM bks.starttime) AS month,
  SUM(b.slots) AS total_slots
FROM cd.facilities fac
  JOIN cd.bookings bks USING(facid)
WHERE EXTRACT(YEAR FROM bks.starttime) = 2012
GROUP BY 1, 2
ORDER BY 1;
