SELECT d.name AS Department,
    e.name AS Employee,
    salary AS Salary
FROM Employee e
    LEFT JOIN Department d ON e.departmentId = d.id
    LEFT JOIN (
        SELECT departmentId,
            MAX(m.min) as max
        FROM (
                SELECT *,
                    MIN(salary) OVER(
                        PARTITION BY departmentId
                        ORDER BY salary ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
                    ) as min
                FROM(
                        SELECT salary,
                            departmentId
                        FROM Employee
                        GROUP BY salary,
                            departmentId
                        ORDER BY departmentId,
                            salary DESC
                    ) s
                ORDER BY departmentId,
                    salary DESC
            ) m
        GROUP BY departmentId
    ) dd ON e.departmentId = dd.departmentId
WHERE salary >= dd.max
ORDER BY e.departmentId,
    salary DESC