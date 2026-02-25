/*
LeetCode SQL Practice
Problem: Consecutive Numbers

Description:
Find all numbers that appear at least three times consecutively in the Logs table.

Table:
Logs(id, num)

Example:
Input:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Output:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/

SELECT DISTINCT L1.num AS ConsecutiveNums
FROM Logs L1, Logs L2, Logs L3
WHERE L1.num = L2.num
  AND L2.num = L3.num
  AND L1.id = L2.id - 1
  AND L2.id = L3.id - 1;
