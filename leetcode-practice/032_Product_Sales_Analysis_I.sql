Problem: Product Sales Analysis I
Description

Given two tables:

Sales

Column Name	Type
sale_id	int
product_id	int
year	int
quantity	int
price	int
(sale_id, year) is the primary key
product_id is a foreign key referencing Product

Product

Column Name	Type
product_id	int
product_name	varchar
product_id is the primary key

Each row in Sales represents a product sale in a given year.
The price is per unit.

Objective

Write a query to report:

product_name
year
price

for each sale in the Sales table.

Return the result in any order.

Approach
Join Sales and Product tables using product_id
Select required fields from both tables
Use an INNER JOIN since all product_id values in Sales exist in Product

 SQL Solution

SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;
