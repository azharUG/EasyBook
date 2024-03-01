-- Query 2
-- Finds the activity that is the most frequent in the database

SELECT activity_name, COUNT(activity_name) AS visits
FROM Activity
GROUP BY activity_name
ORDER BY COUNT(activity_name) DESC

-- Here are the first 5 rows of the result for example,
-- activity_name | visits
-- --------------|-------
-- Nightlife       | 35
-- Kiteboarding    | 35
-- Bungee Jumping  | 34
-- Theater Shows   | 33
-- Kayaking        | 33