Employee Bonus
Problem

Given two tables:

Employee: Contains employee details
Bonus: Contains bonus information for some employees

Return the name and bonus of employees who:

Have a bonus less than 1000, OR
Did not receive any bonus

Approach
Use a LEFT JOIN to include all employees, even those without a bonus.
Filter:
bonus < 1000
OR bonus IS NULL (no bonus received)
  
SQL Solution
  
SELECT 
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

Explanation
LEFT JOIN ensures every employee appears in the result.
Employees without a bonus will have NULL in the bonus column.
The WHERE clause filters:
Low bonuses (< 1000)
Missing bonuses (NULL)
  
Complexity
Time: O(n)
Space: O(1) (ignoring output)

Notes
Using INNER JOIN would exclude employees without bonuses — which we need.
NULL handling is key to solving this problem correctly.
