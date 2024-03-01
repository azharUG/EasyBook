-- Query 4
-- This query will use group by and having to find the 
-- payment_id (receipts) and total_cost of all payments that have 
-- a total_cost greater than 2000

SELECT payment_id, total_cost
FROM Payment
GROUP BY payment_id
HAVING total_cost > 2000;

-- Here is the top 5 rows of the result
-- payment_id | total_cost
-- 1          | 2165
-- 3          | 2138
-- 7          | 2139
-- 8          | 2038
-- 9          | 2124
