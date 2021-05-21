-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
-- Return a list of start time and facility name pairings, ordered by the time.
SELECT
	bks.starttime AS start,
	fac.name
FROM cd.bookings bks
LEFT JOIN cd.facilities fac
USING(facid)
WHERE DATE(bks.starttime) = '2012-09-21' AND fac.name LIKE '%Tennis Court%'
ORDER BY bks.starttime;
