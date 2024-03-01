-- Query 5
-- This finds the most frequent city where our users
-- can travel to.  This can be useful for marketing purposes

SELECT city, COUNT(city) as count
FROM Location
GROUP BY city
ORDER BY count DESC

-- The most frequent city is Yong'an with 3 users
-- The second most frequent city is Xinxing with 3 users
-- The third most frequent city is Washington with 3 users