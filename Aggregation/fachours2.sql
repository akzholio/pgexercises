/*
Output the facility id that has the highest number of slots booked.
For bonus points, try a version without a LIMIT clause.
This version will probably look messy!
*/
WITH base AS (
  SELECT
    facid,
    SUM(slots) AS Total_Slots
  FROM cd.bookings
  GROUP BY 1
  )
SELECT
  facid,
  Total_Slots
FROM base
WHERE Total_Slots = (SELECT MAX(Total_Slots) FROM base);
