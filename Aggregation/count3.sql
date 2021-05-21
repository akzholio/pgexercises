/*
Produce a count of the number of recommendations each member has made. Order by member ID.
*/
SELECT
  recommendedby,
  COUNT(*)
FROM cd.members
WHERE recommendedby IS NOT NULL
GROUP BY 1
ORDER BY 1;
