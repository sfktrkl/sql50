SELECT 'High Salary' as category,
    COUNT(income) as accounts_count
FROM Accounts
WHERE income > 50000
UNION
SELECT 'Average Salary' as category,
    COUNT(income) as accounts_count
FROM Accounts
WHERE income <= 50000
    AND income >= 20000
UNION
SELECT 'Low Salary' as category,
    COUNT(income) as accounts_count
FROM Accounts
WHERE income < 20000