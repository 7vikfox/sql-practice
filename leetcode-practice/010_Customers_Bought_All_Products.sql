/*
LeetCode SQL Practice
Problem: Customers Who Bought All Products

Description:
Find customer IDs who bought all the products in the Product table.

Tables:
Customer(customer_id, product_key)
Product(product_key)

Example:
Input:
Customer:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+

Product:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+

Output:
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
*/

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
