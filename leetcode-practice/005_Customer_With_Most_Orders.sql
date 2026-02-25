/*
LeetCode SQL Practice
Problem: Customer With Most Orders

Description:
Find the customer_number for the customer who has placed the largest number of orders.

Tables:
Orders(order_number, customer_number)

Example:
Input:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+

Output:
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
*/

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
