(
    SELECT u.name AS results
    FROM MovieRating r
        LEFT JOIN Users u ON r.user_id = u.user_id
    GROUP BY u.name,
        r.user_id
    ORDER BY COUNT(r.user_id) DESC,
        name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT m.title
    FROM MovieRating r
        LEFT JOIN Movies m ON m.movie_id = r.movie_id
    WHERE r.created_at BETWEEN '2019-02-01' AND '2020-02-29'
    GROUP BY r.movie_id,
        m.title
    ORDER BY AVG(r.rating) DESC,
        title ASC
    LIMIT 1
)