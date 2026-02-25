/*
LeetCode SQL Practice
Problem: Classes With At Least Five Students

Description:
Find all classes that have at least five students.

Tables:
Courses(student, class)

Example:
Input:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+

Output:
+---------+
| class   |
+---------+
| Math    |
+---------+
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
