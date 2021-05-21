/*
Produce a list of the total number of hours booked per facility, remembering
that a slot lasts half an hour. The output table should consist of the facility
id, name, and hours booked, sorted by facility id.
Try formatting the hours to two decimal places.
*/

SELECT
  bks.facid,
  fac.name,
  ROUND((CAST(SUM(bks.slots) AS FLOAT) / 2)::numeric, 2) AS total_hours
FROM cd.bookings bks
  LEFT JOIN cd.facilities fac USING (facid)
GROUP BY 1, 2
ORDER BY 1;
