-- Create a database
CREATE DATABASE SchoolDB;

-- Use the database
USE SchoolDB;

-- Create a table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    grade_level INT
);

-- Insert data into the Students table
INSERT INTO Students (student_id, first_name, last_name, age, grade_level)
VALUES
(1, 'John', 'Doe', 15, 10),
(2, 'Jane', 'Smith', 16, 11),
(3, 'Emily', 'Johnson', 14, 9);

CREATE USER 'john_doe'@'localhost' IDENTIFIED BY 'securepassword';

GRANT ALL PRIVILEGES ON schooldb.* TO 'john_doe'@'localhost';

FLUSH PRIVILEGES;

DROP USER 'john_doe'@'localhost';
FLUSH PRIVILEGES;

-- Create an index on the 'last_name' column
CREATE INDEX idx_last_name ON Students (last_name);

-- Query with the indexed column
SELECT * FROM Students WHERE last_name = 'Doe';
