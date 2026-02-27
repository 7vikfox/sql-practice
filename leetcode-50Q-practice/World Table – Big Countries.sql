-- LeetCode SQL Notes
-- Problem: World Table – Big Countries
-- A country is considered big if:
--   1. area >= 3,000,000 OR
--   2. population >= 25,000,000
-- Return: name, population, area

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
