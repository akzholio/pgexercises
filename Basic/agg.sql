-- You'd like to get the signup date of your last member.
-- How can you retrieve this information?
SELECT joindate FROM cd.members
ORDER BY memid DESC
LIMIT 1;
