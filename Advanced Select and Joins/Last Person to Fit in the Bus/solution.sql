SELECT person_name
FROM (
        SELECT person_name,
            turn,
            SUM(weight) OVER(
                ORDER BY turn
            ) as total
        FROM Queue
    ) q
WHERE total <= 1000
ORDER BY turn DESC
LIMIT 1