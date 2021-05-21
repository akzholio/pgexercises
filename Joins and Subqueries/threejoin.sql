-- How can you produce a list of all members who have used a tennis court?
-- Include in your output the name of the court, and the name of the member formatted as a single column.
-- Ensure no duplicate data, and order by the member name followed by the facility name.
SELECT DISTINCT
	mem.firstname || ' ' || mem.surname AS member,
	fac.name AS facility
FROM cd.members mem
INNER JOIN cd.bookings USING(memid)
LEFT JOIN cd.facilities fac USING(facid)
WHERE fac.name LIKE '%Tennis Court%'
ORDER BY member, facility;
