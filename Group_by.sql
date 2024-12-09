-- Create the database
CREATE DATABASE SchoolManagement;

-- Use the database
USE SchoolManagement;

-- Create tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    grade_level INT
);

CREATE TABLE Scores (
    score_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert sample data
INSERT INTO Students VALUES
(1, 'Alice', 10),
(2, 'Bob', 10),
(3, 'Charlie', 11),
(4, 'Diana', 11);

INSERT INTO Scores VALUES
(1, 1, 'Math', 85),
(2, 1, 'Science', 90),
(3, 2, 'Math', 78),
(4, 2, 'Science', 83),
(5, 3, 'Math', 88),
(6, 3, 'Science', 92),
(7, 4, 'Math', 91),
(8, 4, 'Science', 87);

SELECT student_id, SUM(marks) AS total_marks
FROM Scores
GROUP BY student_id;

SELECT subject, AVG(marks) AS avg_marks
FROM Scores
GROUP BY subject;

SELECT grade_level, COUNT(*) AS student_count
FROM Students
GROUP BY grade_level;

SELECT subject, AVG(marks) AS avg_marks
FROM Scores
GROUP BY subject
HAVING AVG(marks) > 86;

SELECT * 
FROM Scores
WHERE marks > 85;

SELECT s.grade_level, SUM(sc.marks) AS total_marks
FROM Students s
JOIN Scores sc ON s.student_id = sc.student_id
GROUP BY s.grade_level;


