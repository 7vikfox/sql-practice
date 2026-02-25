/*
LeetCode SQL Practice
Problem: Trips Cancellation Rate

Description:
Compute the cancellation rate per day for unbanned users (both client and driver not banned) between "2013-10-01" and "2013-10-03". 
Cancellation rate = cancelled requests / total requests (with unbanned users), rounded to 2 decimal places.

Tables:
Trips(id, client_id, driver_id, city_id, status, request_at)
Users(users_id, banned, role)

Example:
Trips:
+----+-----------+-----------+---------+---------------------+------------+
| id | client_id | driver_id | city_id | status              | request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
+----+-----------+-----------+---------+---------------------+------------+

Users:
+----------+--------+--------+
| users_id | banned | role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+

Output:
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+
*/

SELECT t.request_at AS Day,
       ROUND(SUM(CASE WHEN t.status IN ('cancelled_by_driver','cancelled_by_client') THEN 1 ELSE 0 END) / COUNT(*),2) AS `Cancellation Rate`
FROM Trips t
JOIN Users c ON t.client_id = c.users_id AND c.banned='No'
JOIN Users d ON t.driver_id = d.users_id AND d.banned='No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;
