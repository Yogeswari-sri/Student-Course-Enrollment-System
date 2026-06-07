# Student-Course-Enrollment-System


Schema & Relationships
Students, Courses, Enrollments are well‑structured with proper PRIMARY KEY and FOREIGN KEY constraints.

Good normalization: Enrollments acts as a junction table between Students and Courses.

Joins
INNER JOIN: Perfect for showing only students who are enrolled.


LEFT JOIN: Correctly lists all students, even those without enrollments.

RIGHT JOIN: Works, but note that in MySQL, RIGHT JOIN is less commonly used than LEFT JOIN. It’s essentially the mirror image.


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
OUTPUT
<img width="1588" height="755" alt="image" src="https://github.com/user-attachments/assets/b0a9346b-9f22-4ff8-bd5a-1a0e8f5f1810" />

Left Join
sql
SELECT s.StudentName, e.CourseID
FROM Students AS s
LEFT JOIN Enrollments AS e ON s.StudentID = e.StudentID;
OUTPUT
<img width="1600" height="760" alt="image" src="https://github.com/user-attachments/assets/2b247a6e-70e0-431b-81a2-0b9d696cbe74" />

Right Join
sql
SELECT s.StudentName, e.CourseID
FROM Students AS s
RIGHT JOIN Enrollments AS e ON s.StudentID = e.StudentID;
OUTPUT

<img width="1591" height="760" alt="image" src="https://github.com/user-attachments/assets/2f542871-76ec-4192-9195-2a0a4788e1ce" />

🛠 Built‑in Functions
ROUND() → SELECT ROUND(123.4567, 2);
OUTPUT

<img width="1600" height="783" alt="image" src="https://github.com/user-attachments/assets/9f8a0331-c041-4261-a988-aa3161c89011" />
ABS() → SELECT ABS(-25000);
OUTPUT
<img width="1600" height="808" alt="image" src="https://github.com/user-attachments/assets/64b1c501-ccd9-4b83-88b2-714ae08503e6" />
MOD() → SELECT MOD(525,4);
OUTPUT
<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/b67f4efa-b09d-400d-b1db-f47b16974fb2" />
CONCAT() → SELECT CONCAT(StudentName, ' from ', City, '.');
OUTPUT

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/6233443f-c17f-49d3-9b0a-fe44f2d39f66" />

LENGTH() → SELECT StudentName, LENGTH(StudentName);
OUTPUT

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/6819a11e-6590-4461-9845-4432cc0a2ad5" />

REPLACE() → SELECT REPLACE(CourseName,'SQL','Database');

<img width="1600" height="854" alt="image" src="https://github.com/user-attachments/assets/22d688e5-2737-489a-a434-c912ca682a53" />

SUBSTRING() → SELECT SUBSTRING(StudentName, 1, 3);
OUTPUT

<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/22ef7758-1b3f-4b88-88d7-42ea9df60157" />

UPPER() / LOWER() → SELECT UPPER(StudentName), LOWER(StudentName);
OUTPUT

<img width="1598" height="844" alt="image" src="https://github.com/user-attachments/assets/5946b9c9-453e-41d3-a251-bb2a10b02e0e" />

📅 Date Functions
NOW() → Current date & time
OUTPUT

<img width="1600" height="852" alt="image" src="https://github.com/user-attachments/assets/d4e2eb8d-d392-47b1-8c6b-5d5d5e664109" />

DATE_ADD() → Add 10 days to enrollment date
OUTPUT

<img width="1600" height="859" alt="image" src="https://github.com/user-attachments/assets/02bf2bfe-6d5f-4b98-98c6-cc854ec95546" />

DATEDIFF() → Difference between two dates
OUTPUT

<img width="1600" height="860" alt="image" src="https://github.com/user-attachments/assets/aba35eef-fc6d-4384-afd3-98b1119286c7" />

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
OUTPUT

<img width="1600" height="860" alt="image" src="https://github.com/user-attachments/assets/db71a7ec-c515-4d7e-a512-c598575ee933" />


Execute queries to explore joins and functions.
