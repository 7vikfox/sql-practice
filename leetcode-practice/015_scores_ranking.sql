/*
LeetCode SQL Practice
Problem: Scores Ranking

Description:
Find the rank of each score in the Scores table.
- Rank from highest to lowest.
- If scores are tied, assign the same rank.
- The next rank after a tie is the next consecutive integer (no gaps).

Tables:
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
