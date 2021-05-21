/*
How can you output a list of all members, including the individual
who recommended them (if any), without using any joins?
Ensure that there are no duplicates in the list, and that each
firstname + surname pairing is formatted as a column and ordered.
*/
SELECT
	mem.firstname || ' ' || mem.surname AS member,
	rec.firstname || ' ' || rec.surname AS recommender
FROM cd.members mem, cd.members rec
WHERE mem.recommendedby = rec.memid
UNION
SELECT
	mem.firstname || ' ' || mem.surname AS member,
	'' AS recommender
FROM cd.members mem
WHERE mem.recommendedby IS NULL
ORDER BY 1;
