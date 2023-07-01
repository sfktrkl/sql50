CREATE TABLE IF NOT EXISTS Person (id INT, email VARCHAR(255));
TRUNCATE TABLE Person;
INSERT INTO Person (id, email)
VALUES ('1', 'john@example.com');
INSERT INTO Person (id, email)
VALUES ('2', 'bob@example.com');
INSERT INTO Person (id, email)
VALUES ('3', 'john@example.com');