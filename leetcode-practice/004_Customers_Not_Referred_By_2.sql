/*
LeetCode SQL Practice
Problem: Customers Not Referred By 2 or Referred By Others

Description:
Find the names of customers that are either:
1. Referred by any customer with id != 2
2. Not referred by any customer (referee_id is NULL)

Tables:
Customer(id, name, referee_id)

Example:
Input:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

Output:
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL
   OR referee_id <> 2;
