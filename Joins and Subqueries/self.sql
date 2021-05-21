-- How can you output a list of all members who have recommended another member?
-- Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
SELECT DISTINCT
  m1.firstname,
  m1.surname
FROM cd.members m1
INNER JOIN cd.members m2
  ON m2.recommendedby = m1.memid
ORDER BY 1, 2;
