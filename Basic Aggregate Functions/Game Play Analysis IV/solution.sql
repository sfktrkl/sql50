SELECT ROUND(AVG(IF(a.player_id, 1, 0)), 2) as fraction
FROM Activity a
    RIGHT JOIN (
        SELECT player_id,
            MIN(event_date) AS first_login
        FROM Activity
        GROUP BY player_id
    ) f ON a.player_id = f.player_id
    AND TO_DAYS(a.event_date) = TO_DAYS(f.first_login) + 1