SELECT DISTINCT p3.product_id,
    IF(p4.date IS NULL, 10, p3.new_price) as price
FROM Products p3
    RIGHT JOIN (
        SELECT DISTINCT p1.product_id,
            p2.date
        FROM Products p1
            LEFT JOIN (
                SELECT DISTINCT p.product_id,
                    MAX(p.change_date) as date
                FROM Products p
                WHERE TO_DAYS(p.change_date) <= TO_DAYS('2019-08-16')
                GROUP BY p.product_id
            ) p2 ON p1.product_id = p2.product_id
    ) p4 ON p3.product_id = p4.product_id
    AND (
        p3.change_date = p4.date
        OR p4.date IS NULL
    )