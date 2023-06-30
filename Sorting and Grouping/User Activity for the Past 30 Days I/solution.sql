SELECT activity_date as day,
    COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE TO_DAYS(activity_date) BETWEEN TO_DAYS('2019-07-27') - 29 AND TO_DAYS('2019-07-27')
GROUP BY activity_date