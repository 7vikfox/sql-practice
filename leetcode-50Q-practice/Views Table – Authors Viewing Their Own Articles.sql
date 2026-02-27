-- LeetCode SQL Notes
-- Problem: Views Table – Authors Viewing Their Own Articles
-- Goal: Find authors who viewed at least one of their own articles
-- Return: author_id, sorted in ascending order

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
