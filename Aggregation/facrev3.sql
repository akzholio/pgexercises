/*
Produce a list of the top three revenue generating facilities (including ties). 
Output facility name and rank, sorted by rank and facility name.
*/
WITH base AS (
    SELECT 
        bks.facid,
        fac.name,
        CASE
            WHEN bks.memid = 0 THEN bks.slots * fac.guestcost
            ELSE bks.slots * fac.membercost
        END AS money
    FROM cd.bookings AS bks
        LEFT JOIN cd.facilities AS fac USING(facid)
)
SELECT 
    name,
    RANK() OVER (
        ORDER BY SUM(money) DESC
    )
FROM base
GROUP BY 1
ORDER BY 2
LIMIT 3;