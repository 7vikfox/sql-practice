/*
LeetCode SQL Practice
Problem: Employees Earning More Than Their Managers

Description:
Find the employees who earn more than their managers.

Tables:
1. Employee(id, name, salary, managerId)

Example:
Input:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

Output:
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation:
Joe earns 70000, which is more than his manager Sam's salary of 60000.
*/

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;
