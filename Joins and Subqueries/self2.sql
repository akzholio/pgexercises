-- How can you output a list of all members, including the individual who recommended them (if any)?
-- Ensure that results are ordered by (surname, firstname).
SELECT
	mem.firstname AS memfname,
	mem.surname AS memsname,
	rec.firstname AS recfname,
	rec.surname AS recsname
FROM cd.members mem
LEFT JOIN cd.members rec
  ON rec.memid = mem.recommendedby
ORDER BY memsname, memfname;
