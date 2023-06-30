SELECT x,
    y,
    z,
    CASE
        WHEN x + y <= z THEN 'No'
        WHEN x + z <= y THEN 'No'
        WHEN y + z <= x THEN 'No'
        ELSE 'Yes'
    END as triangle
FROM Triangle