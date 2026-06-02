# Student-Course-Enrollment-System


Schema & Relationships
Students, Courses, Enrollments are well‑structured with proper PRIMARY KEY and FOREIGN KEY constraints.

Good normalization: Enrollments acts as a junction table between Students and Courses.

Joins
INNER JOIN: Perfect for showing only students who are enrolled.

LEFT JOIN: Correctly lists all students, even those without enrollments.

RIGHT JOIN: Works, but note that in MySQL, RIGHT JOIN is less commonly used than LEFT JOIN. It’s essentially the mirror image.


Built‑in Functions
ROUND(): You wrote Round(123.4567) but didn’t specify decimals. By default, MySQL rounds to 0 decimals. If you want two decimals, 


SELECT ROUND(123.4567, 2) AS TwoDecimalPlaces;
ABS() & MOD(): Correct usage.

CONCAT(): Nicely merges name and city. You could add a space for readability:

sql
SELECT CONCAT(StudentName, ' from ', City, '.') AS Merged_Column
FROM Students;
LENGTH(): Works fine.

REPLACE(): Good example of modifying course names.

SUBSTRING(): You used Substring(StudentName,3). This starts at the 3rd character and goes to the end. If you want the first 3 letters, use:

sql
SELECT StudentName, SUBSTRING(StudentName, 1, 3) AS Code_Prefix
FROM Students;
UPPER() & LOWER(): Correct usage.

📅 Date Functions
NOW(): Correct.

DATE_ADD(): Nicely adds 10 days.

DATEDIFF(): Works, but note that DATEDIFF(date1, date2) returns date1 - date2. So:

sql
SELECT DATEDIFF('2025-06-01', '2025-05-10') AS Days_Difference;
→ Returns 22.

🔍 Final Combined Query
Your last query is excellent — it combines student names, enrollment dates, follow‑up dates, difference in days, and current timestamp. That’s a neat dashboard‑style query.

✨ Suggestion: Try adding aggregate functions like COUNT(), AVG(), or GROUP BY to analyze enrollments per course. For example:

sql
SELECT c.CourseName, COUNT(e.StudentID) AS Total_Enrollments
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;
This will show how many students are enrolled in each course.

Would you like me to extend this dataset with advanced queries (like finding top enrolled courses, average student age per course, etc.) so you can showcase analytics in your SQL portfolio?

i wnt github repository detiled for this
Here’s a detailed GitHub repository draft for your SQL project. You can copy this into your README.md file to make the repo look professional and recruiter‑friendly:

📊 Student Course Enrollment System
📌 Project Overview
This project demonstrates a relational database schema for managing students, courses, and enrollments. It includes:

Table creation with primary keys and foreign keys

Sample data insertion

Queries using INNER JOIN, LEFT JOIN, RIGHT JOIN

Usage of built‑in SQL functions (string, numeric, and date functions)

🏗 Database Schema
Students Table
sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);
Courses Table
sql
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);
Enrollments Table
sql
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
📥 Sample Data
sql
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
🔗 SQL Joins
Inner Join
sql
SELECT s.StudentName, c.CourseName
FROM Students AS s
INNER JOIN Enrollments AS e ON s.StudentID = e.StudentID
INNER JOIN Courses AS c ON e.CourseID = c.CourseID;
Left Join
sql
SELECT s.StudentName, e.CourseID
FROM Students AS s
LEFT JOIN Enrollments AS e ON s.StudentID = e.StudentID;
Right Join
sql
SELECT s.StudentName, e.CourseID
FROM Students AS s
RIGHT JOIN Enrollments AS e ON s.StudentID = e.StudentID;
🛠 Built‑in Functions
ROUND() → SELECT ROUND(123.4567, 2);

ABS() → SELECT ABS(-25000);

MOD() → SELECT MOD(525,4);

CONCAT() → SELECT CONCAT(StudentName, ' from ', City, '.');

LENGTH() → SELECT StudentName, LENGTH(StudentName);

REPLACE() → SELECT REPLACE(CourseName,'SQL','Database');

SUBSTRING() → SELECT SUBSTRING(StudentName, 1, 3);

UPPER() / LOWER() → SELECT UPPER(StudentName), LOWER(StudentName);

📅 Date Functions
NOW() → Current date & time

DATE_ADD() → Add 10 days to enrollment date

DATEDIFF() → Difference between two dates

sql
SELECT EnrollmentDate,
       DATE_ADD(EnrollmentDate, INTERVAL 10 DAY) AS Followup_Date,
       DATEDIFF('2025-06-01','2025-05-10') AS Days_Difference,
       NOW() AS Current_DateTime
FROM Enrollments;
📊 Analytics Query Example
sql
SELECT c.CourseName, COUNT(e.StudentID) AS Total_Enrollments
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;
🚀 How to Run
Create the database in MySQL/PostgreSQL.

Run the schema creation scripts.

Execute queries to explore joins and functions.
