/*
 Output the facility id that has the highest number of slots booked.
 Ensure that in the event of a tie, all tieing results get output.
 */
WITH base AS (
    SELECT 
        facid,
        SUM(slots) AS total,
        RANK() OVER (
            ORDER BY SUM(slots) DESC
        ) AS r
    FROM cd.bookings
    GROUP BY 1
)
SELECT 
    facid,
    total
FROM base
WHERE r = 1;