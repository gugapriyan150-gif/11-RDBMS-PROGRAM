CREATE DATABASE GUGAN;
USE GUGAN;
Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Insert Department data
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Information Technology');


-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Insert Student data
INSERT INTO Student (StudentID, StudentName, DepartmentID)
VALUES
(1001, 'Arun', 1),
(1002, 'Priya', 2),
(1003, 'Rahul', 3);


-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Insert Course data
INSERT INTO Course (CourseID, CourseName)
VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');


-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Enrollment data
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201);


-- Create StudentDetails view
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
JOIN Course
    ON Enrollment.CourseID = Course.CourseID
JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;


-- Display the view
SELECT * FROM StudentDetails;
