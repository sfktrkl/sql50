SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
        SELECT *,
            COUNT(*) OVER(PARTITION BY tiv_2015) AS c1,
            COUNT(*) OVER(PARTITION BY lat, lon) AS c2
        FROM Insurance
    ) c
WHERE c.c1 >= 2
    AND c.c2 = 1