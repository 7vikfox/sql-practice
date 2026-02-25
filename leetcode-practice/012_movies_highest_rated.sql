/*
LeetCode SQL Practice
Problem: Movies and Users Ratings

Description:
1. Find the name of the user who rated the greatest number of movies. 
   If there is a tie, choose the lexicographically smaller name.
2. Find the movie with the highest average rating in February 2020. 
   If there is a tie, choose the lexicographically smaller movie title.

Tables:
Movies(movie_id, title)
Users(user_id, name)
MovieRating(movie_id, user_id, rating, created_at)

Example:
Movies:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+

Users:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+

MovieRating:
+-------------+--------------+--------+------------+
| movie_id    | user_id      | rating | created_at |
+-------------+--------------+--------+------------+
| 1           | 1            | 3      | 2020-01-12 |
| 1           | 2            | 4      | 2020-02-11 |
| 1           | 3            | 2      | 2020-02-12 |
| 1           | 4            | 1      | 2020-01-01 |
| 2           | 1            | 5      | 2020-02-17 |
| 2           | 2            | 2      | 2020-02-01 |
| 2           | 3            | 2      | 2020-03-01 |
| 3           | 1            | 3      | 2020-02-22 |
| 3           | 2            | 4      | 2020-02-25 |
+-------------+--------------+--------+------------+

Output:
+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+
*/

-- Part 1: User with most movie ratings
WITH UserCounts AS (
    SELECT u.name, COUNT(*) AS cnt
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
)
, MaxUser AS (
    SELECT name
    FROM UserCounts
    WHERE cnt = (SELECT MAX(cnt) FROM UserCounts)
    ORDER BY name
    LIMIT 1
)
-- Part 2: Movie with highest average rating in Feb 2020
, MovieAvg AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
)
, MaxMovie AS (
    SELECT title
    FROM MovieAvg
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM MovieAvg)
    ORDER BY title
    LIMIT 1
)
-- Combine results
SELECT name AS results FROM MaxUser
UNION ALL
SELECT title AS results FROM MaxMovie;
