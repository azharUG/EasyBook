-- Query 3
-- This query will get the top 5 countries where the 
-- nightlife average rating value is 4 or higher stars

SELECT Location.country, ROUND(AVG(Review.rating_value),1) AS Average_Shopping_Rating
FROM Location
JOIN Property ON Location.location_id = Property.location_id
JOIN Activity ON Activity.activity_id = Property.activity_id
JOIN Review ON Property.review_id = Review.rating_id
WHERE Activity.activity_name = 'Shopping'
GROUP BY Location.country
HAVING AVG(Review.rating_value) >= 3
ORDER BY Average_Shopping_Rating DESC
LIMIT 3;

-- This query joined the Location, Property, Activity, and Review tables to get the average rating value for the shopping activity in each country.
-- Here are the top 3 countries:
-- 1. United States - 3.5
-- 2. China - 3.4
-- 3. Germany - 3.0