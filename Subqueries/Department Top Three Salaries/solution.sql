SELECT d.name AS Department,
    e1.name AS Employee,
    e1.salary AS Salary
FROM Employee e1
    JOIN Employee e2
    JOIN Department d ON e1.departmentId = e2.departmentId
    AND e1.salary <= e2.salary
    AND d.id = e2.departmentId
GROUP BY d.name,
    e1.name,
    e1.salary
HAVING COUNT(DISTINCT e2.salary) <= 3
ORDER BY d.name,
    e1.salary DESC