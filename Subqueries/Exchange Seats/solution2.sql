SELECT s1.id,
    IF(
        s1.id % 2 = 0,
        s2.student,
        IF(s3.student IS NULL, s1.student, s3.student)
    ) as student
FROM Seat s1
    LEFT JOIN Seat s2 ON s1.id = s2.id + 1
    LEFT JOIN Seat s3 ON s1.id + 1 = s3.id