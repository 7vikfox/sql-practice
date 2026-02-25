/*
LeetCode SQL Practice
Problem: Rank Scores

Description:
Find the rank of scores. Ranking rules:
1. Scores ranked from highest to lowest.
2. If two scores tie, they get the same rank.
3. Next ranking is consecutive without gaps (dense ranking).

Table:
Scores(id, score)

Example:
Input:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

Output:
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
*/

SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC;
