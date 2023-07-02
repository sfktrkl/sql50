SELECT product_name,
    SUM(unit) as unit
FROM(
        SELECT *,
            MONTH(order_date) as month,
            YEAR(order_date) as year
        FROM Orders
    ) m
    JOIN Products p ON m.product_id = p.product_id
WHERE m.month = 2
    AND m.year = 2020
GROUP BY product_name
HAVING SUM(unit) >= 100