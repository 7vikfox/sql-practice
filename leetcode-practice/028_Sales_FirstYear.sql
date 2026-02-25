/*
LeetCode SQL Practice
Problem: First Year Sales of Each Product

Description:
Find all sales that occurred in the first year each product was sold. For each product, return all sales from its earliest year.

Tables:
Sales(sale_id, product_id, year, quantity, price)

Example:
Input:
Sales:
+---------+------------+------+----------+-------+ 
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Output:
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
*/

SELECT s.product_id,
       s.year AS first_year,
       s.quantity,
       s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) AS first_sales
ON s.product_id = first_sales.product_id
AND s.year = first_sales.first_year;
