Table: Employees

id (int, PK)

name (varchar)

Table: EmployeeUNI

id (int)

unique_id (int)

(id, unique_id) is PK

Goal: Show the unique_id for each employee. If an employee does not have a unique_id, show NULL.

Solution
SELECT eu.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;
