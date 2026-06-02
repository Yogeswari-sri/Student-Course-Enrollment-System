
-- 1CREATE DATABASE

CREATE DATABASE StudentsDB;
USE StudentsDB;

-- CREATE TABLES

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Aarav', 21, 'Chennai'),
(2, 'Meera', 22, 'Bangalore'),
(3, 'Karthik', 23, 'Hyderabad'),
(4, 'Divya', 21, 'Delhi');

INSERT INTO Courses VALUES
(101, 'Data Analytics', '3 Months'),
(102, 'Python Programming', '2 Months'),
(103, 'SQL Basics', '1 Month');

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2025-05-10'),
(1002, 2, 102, '2025-06-01'),
(1003, 3, 103, '2025-06-15');

-- INNER JOIN
select 
s.StudentName,
c.CourseName
from students as s
inner join
Enrollments as e
on s.StudentID=e.StudentID
inner join
Courses as c
on e.CourseID=c.CourseID;

-- LEFT JOIN AND RIGHT JOIN
select 
s.StudentName,
e.CourseID
from students as s
left join
enrollments as e
on s.studentID=e.StudentID;

select 
s.StudentName,
e.CourseID
from students as s
right join
enrollments as e
on s.studentID=e.StudentID;

-- BUILT IN FUNCTION
-- ROUND()
select
Round(123.4567) as Twodecimal_places;

-- ABS() & MOD() 
-- CONVERT NEGATIVE TO POSITIVE
select 
abs(-25000) as absolute_values;

-- MOD() -- REMAINDER COMES
select 
mod(525,4) as Mod_values;

-- CONCAT() -- MERGER STUGENTNAME FROM CITY
select
concat(StudentName ,'from' ,City,'.') as MERGED_COLUMN
from students;

-- LENGTH()
-- TO DISPLAY EACH STUDENT NAME WITH ITS CHARACTER COUNT
select
StudentName,
Length(StudentName) as Name_Length
from students;

-- REPLACE() -- TO MODIFY COURSENAME IN COURSETABLES
Select
CourseName,
Replace(CourseName,'SQL','Database') as Updated_CourseName
from courses;

-- SUBSTRING()
-- TO EXTRACT FIRST 3 LETTERS OF EACH NAME
select
StudentName,
Substring(StudentName,3) as Code_Prefix
from students;

-- UPPER() & LOWER()
Select 
Upper(StudentName) as Upper_Name,
Lower(StudentName) as Lower_Name
from students;

-- DATE FUNCTION (NOW,DATEDIFF,DATE_ADD)
-- USE NOW() TO DISPLAY THE CURRENT DATE AND TIME
select EnrollmentDate,
now() as Current_DateTime
from enrollments;

-- USE DATE_ADD TO ADD 10 DAYS TO EACH ENROLLMENTDATE
select EnrollmentDate,
Date_add(enrollmentDate, INTERVAL 10  DAY) as Followup_Date
from enrollments;

-- USE DATE DIFF TO FIND BETWEEN NUMBER OF DAYS '2025-06-01','2025-05-10'
select EnrollmentDate,
DateDiff('2025-06-01','2025-05-10') as Days_Difference
from enrollments;

select
s.StudentName,
e.EnrollmentDate,
Date_add(enrollmentDate, INTERVAL 10  DAY) as Followup_Date,
DateDiff('2025-06-01','2025-05-10') as Days_Difference,
now() as Current_DateTime
from Students as s
inner join
Enrollments as e
on s.studentID=e.StudentID;