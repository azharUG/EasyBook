-- Query 6
-- The amount of people that go to New York to vacation
-- That includes, Brooklyn, Bronx, Queens, Manhattan, and Staten Island.
-- Uses like to get the different parts of New York
-- uses or to combine the different parts of New York

SELECT COUNT(*)
FROM Location
WHERE city LIKE 'Brooklyn%' 
OR city LIKE 'Bronx%' 
OR city LIKE 'Queens%' 
OR city LIKE 'Manhattan%' 
OR city LIKE 'Staten Island%';

-- The output of this query is that there are 3 locations
-- that are in New York.

