SELECT e2.employee_id,
    e2.name as name,
    COUNT(e1.reports_to) AS reports_count,
    ROUND(AVG(e1.age)) as average_age
FROM Employees e1
    JOIN Employees e2 ON e1.reports_to = e2.employee_id
GROUP BY e1.reports_to,
    e2.name
ORDER BY e1.reports_to