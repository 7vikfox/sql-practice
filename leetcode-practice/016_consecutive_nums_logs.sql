/*
LeetCode SQL Practice
Problem: Consecutive Numbers in Logs

Description:
Find all numbers that appear at least three times consecutively in the Logs table.

Tables:
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
FROM Logs L1
JOIN Logs L2 ON L2.id = L1.id + 1
JOIN Logs L3 ON L3.id = L1.id + 2
WHERE L1.num = L2.num AND L2.num = L3.num;
