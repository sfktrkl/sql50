SELECT e.employee_id,
    e.department_id
FROM Employee e
    JOIN (
        SELECT employee_id,
            COUNT(DISTINCT department_id) as department_count
        FROM Employee
        GROUP BY employee_id
    ) d ON e.employee_id = d.employee_id
WHERE primary_flag = 'Y'
    OR department_count = 1