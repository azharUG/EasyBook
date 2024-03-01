-- Query 7
-- This query finds the cheapest hotel for each destination city, ranked by price within each city.
-- Using partition by and a subquery
-- joins Location, Property, Payment, Booking

SELECT
    Location.city,
    Property.property_name,
    Payment.total_cost
FROM
    Location
    JOIN Property ON Location.location_id = Property.location_id
    JOIN Booking ON Property.property_id = Booking.property_id
    JOIN Payment ON Booking.booking_id = Payment.booking_id
-- using partition by and a subquery to find the cheapest hotel for each city
WHERE
    Payment.total_cost = (
        SELECT MIN(Payment.total_cost) 
        OVER (PARTITION BY Location.city) 
        FROM Property 
        WHERE Property.location_id = Location.location_id)
ORDER BY
    Payment.total_cost ASC;

-- This is a sample output of the query for the top 5 cheapest hotels in each city
-- city       | property_name | total_cost
-- -----------|---------------|-----------
-- Huanggong  | Pine Hill     | 1555
-- Huaping    | Azure Sky     | 1649
-- Jiantian   | Spring Valley | 1662
-- Jiaocun    | Crystal Lake  | 1711
-- Lab        | Cedar Ridge   | 1721