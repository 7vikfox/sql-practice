/*
LeetCode SQL Practice
Problem: Person and Address

Description:
Report the first name, last name, city, and state of each person.
- If a person has no address, return NULL for city and state.
- Tables:
    1. Person(personId, lastName, firstName)
    2. Address(addressId, personId, city, state)
- Return the result in any order.

Example:
Input:
Person:
+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+

Address:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+

Output:
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | NULL          | NULL     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+
*/

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
