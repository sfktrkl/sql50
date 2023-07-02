SELECT requester_id as id,
    COUNT(accepter_id) as num
FROM(
        SELECT accepter_id,
            requester_id
        FROM RequestAccepted
        UNION ALL
        SELECT requester_id,
            accepter_id
        FROM RequestAccepted
    ) sum
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1