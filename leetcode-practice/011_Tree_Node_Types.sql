/*
LeetCode SQL Practice
Problem: Tree Node Types

Description:
Classify nodes in a tree as "Root", "Inner", or "Leaf".

Tables:
Tree(id, p_id)

Rules:
- Root: node with no parent (p_id IS NULL)
- Leaf: node with no children
- Inner: node that is neither Root nor Leaf

Example:
Input:
Tree:
+----+------+
| id | p_id |
+----+------+
| 1  | null |
| 2  | 1    |
| 3  | 1    |
| 4  | 2    |
| 5  | 2    |
+----+------+

Output:
+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
| 2  | Inner |
| 3  | Leaf  |
| 4  | Leaf  |
| 5  | Leaf  |
+----+-------+
*/

SELECT t1.id,
       CASE
           WHEN t1.p_id IS NULL THEN 'Root'
           WHEN t2.id IS NULL THEN 'Leaf'
           ELSE 'Inner'
       END AS type
FROM Tree t1
LEFT JOIN Tree t2
ON t1.id = t2.p_id;
