/*
Produce a list of facilities along with their total revenue.
The output table should consist of facility name and revenue, sorted by revenue.
Remember that there's a different cost for guests and members!
*/
SELECT
	fac.name,
	SUM(
    CASE
      WHEN bks.memid = 0 THEN bks.slots * fac.guestcost
			ELSE bks.slots * fac.membercost
		END
  ) AS revenue
FROM cd.bookings bks
  INNER JOIN cd.facilities fac USING(facid)
GROUP BY 1
ORDER BY 2;
