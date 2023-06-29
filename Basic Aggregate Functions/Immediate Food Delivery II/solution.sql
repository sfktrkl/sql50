SELECT ROUND(
        AVG(d.customer_pref_delivery_date = d.order_date) * 100,
        2
    ) as immediate_percentage
FROM Delivery d
    LEFT JOIN (
        SELECT customer_id,
            MIN(order_date) as first_order
        FROM Delivery
        GROUP BY customer_id
    ) m ON d.customer_id = m.customer_id
WHERE d.order_date = m.first_order