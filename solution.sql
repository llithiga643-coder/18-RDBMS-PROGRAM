DROP FUNCTION IF EXISTS Count_Students;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    DeptID INT
);

INSERT INTO Department VALUES (101, 'Computer Science');
INSERT INTO Department VALUES (102, 'Information Technology');

INSERT INTO Student VALUES (1, 'Arun', 101);
INSERT INTO Student VALUES (2, 'Priya', 101);
INSERT INTO Student VALUES (3, 'Kumar', 102);

DELIMITER //

CREATE FUNCTION Count_Students(D_ID INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE Total INT;

    SELECT COUNT(*)
    INTO Total
    FROM Student
    WHERE DeptID = D_ID;

    RETURN Total;
END//
DELIMITER ;

SELECT CONCAT('Number of Students: ', Count_Students(101)) AS Result;
