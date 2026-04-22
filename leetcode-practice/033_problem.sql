Problem: Customers Who Visited but Did Not Make Any Transactions
Description

Given two tables:

Visits

Column Name	Type
visit_id	int
customer_id	int
visit_id is unique
Each row represents a customer visit

Transactions

Column Name	Type
transaction_id	int
visit_id	int
amount	int
transaction_id is unique
Each row represents a transaction made during a visit

Objective

Find:

customer_id
Number of visits where no transactions were made (count_no_trans)

Return the result in any order.

Approach
Use a LEFT JOIN from Visits to Transactions
Identify visits with no matching transactions (transaction_id IS NULL)
Group by customer_id
Count such visits

SQL Solution

SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;
