SELECT visited_on,
    SUM(total) over (
        ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) as amount,
    ROUND(
        AVG(total) over (
            ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) as average_amount
FROM (
        SELECT visited_on,
            SUM(amount) as total
        FROM Customer
        GROUP BY visited_on
    ) sum
LIMIT 18446744073709551615 OFFSET 6