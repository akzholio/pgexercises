/*
Classify facilities into equally sized groups of high, average, and low 
based on their revenue. Order by classification and facility name.
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
),
classified AS (
    SELECT 
        name,
        NTILE(3) OVER (
            ORDER BY SUM(money) DESC
        )
    FROM base
    GROUP BY 1
    ORDER BY 2, 1
)
SELECT 
    name,
    CASE
        WHEN NTILE = 1 THEN 'high'
        WHEN NTILE = 2 THEN 'average'
        WHEN NTILE = 3 THEN 'low'
    END AS revenue
FROM classified;