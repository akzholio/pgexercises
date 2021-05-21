/*
Produce a monotonically increasing numbered list of members (including guests),
ordered by their date of joining.
Remember that member IDs are not guaranteed to be sequential.
*/
SELECT
  ROW_NUMBER() OVER (),
  firstname,
  surname
FROM cd.members
ORDER BY joindate;
