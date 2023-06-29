SELECT DATE_FORMAT(trans_date, '%Y-%m') as month,
    country,
    COUNT(amount) as trans_count,
    SUM(state = 'approved') as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(IF(state = 'approved', 1, 0) * amount) as approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'),
    country