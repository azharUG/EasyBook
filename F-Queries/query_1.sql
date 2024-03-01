-- Query 1
-- This query will list all the activities with an age requirement of 18 or older
-- It will also sort the results by age requirement in ascending order

SELECT activity_name, age_requirement
FROM activity 
WHERE age_requirement >= 18
ORDER BY age_requirement ASC;

-- Here are the first 5 rows of the result for example,

-- activity_name | age_requirement
-- -------------------------------
-- Bungee Jumping | 18
-- Historical Sites Exploration	 | 18
-- Photography Workshops  | 18
-- Horseback Riding	  | 18
-- Kiteboarding	   | 18
