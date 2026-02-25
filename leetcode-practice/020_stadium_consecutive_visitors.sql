/*
LeetCode SQL Practice
Problem: Consecutive Visitors in Stadium

Description:
Display records with three or more rows with consecutive ids,
where the number of people is greater than or equal to 100.

Tables:
Stadium(id, visit_date, people)

Example:
Input:
+------+------------+--------+
| id   | visit_date | people |
+------+------------+--------+
| 1    | 2017-01-01 | 10     |
| 2    | 2017-01-02 | 109    |
| 3    | 2017-01-03 | 150    |
| 4    | 2017-01-04 | 99     |
| 5    | 2017-01-05 | 145    |
| 6    | 2017-01-06 | 1455   |
| 7    | 2017-01-07 | 199    |
| 8    | 2017-01-09 | 188    |
+------+------------+--------+

Output:
+------+------------+--------+
| id   | visit_date | people |
+------+------------+--------+
| 5    | 2017-01-05 | 145    |
| 6    | 2017-01-06 | 1455   |
| 7    | 2017-01-07 | 199    |
| 8    | 2017-01-09 | 188    |
+------+------------+--------+
*/

WITH flagged AS (
    SELECT *,
           CASE WHEN people >= 100 THEN 1 ELSE 0 END AS flag
    FROM Stadium
),
grp AS (
    SELECT *,
           SUM(CASE WHEN flag = 0 THEN 1 ELSE 0 END) 
               OVER (ORDER BY id ROWS UNBOUNDED PRECEDING) AS grp_id
    FROM flagged
)
SELECT id, visit_date, people
FROM grp
WHERE grp_id IN (
    SELECT grp_id
    FROM grp
    WHERE flag = 1
    GROUP BY grp_id
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;
