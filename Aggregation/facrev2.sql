/*
Produce a list of facilities with a total revenue less than 1000.
Produce an output table consisting of facility name and revenue, sorted by revenue.
Remember that there's a different cost for guests and members!
*/
WITH base AS (
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
  ORDER BY 2
)
SELECT * FROM base WHERE revenue < 1000;
