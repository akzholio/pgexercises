/*
We want to alter the price of the second tennis court so that it costs 10% more
than the first one. Try to do this without using constant values for the prices,
so that we can reuse the statement if we want to.
*/
UPDATE cd.facilities
SET
	membercost =
    membercost
    + (SELECT membercost * 0.1 FROM cd.facilities WHERE facid = 0),
	guestcost =
    guestcost
    + (SELECT guestcost * 0.1 FROM cd.facilities WHERE facid = 0)
WHERE facid = 1;
