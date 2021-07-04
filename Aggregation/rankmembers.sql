/*
Produce a list of members (including guests), along with the number of hours 
they've booked in facilities, rounded to the nearest ten hours. 
Rank them by this rounded figure, producing output of first name, surname, 
rounded hours, rank. Sort by rank, surname, and first name.
*/
SELECT
	firstname, 
	surname,
	hours::INTEGER,
	rank() OVER (ORDER BY hours DESC)
FROM (SELECT 
	  mems.firstname, 
		mems.surname,
	  ROUND(SUM(bks.slots) / 2, -1) AS hours
	  FROM cd.bookings bks
INNER JOIN cd.members mems USING(memid)
GROUP BY mems.memid) subq
ORDER BY rank, surname, firstname;