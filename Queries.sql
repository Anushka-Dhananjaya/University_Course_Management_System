-- Query 1: Active Courses for a Specific Department 
-- Query to select active courses in the Computer Science department
SELECT c.Course_ID, c.Course_Name, i.First_Name, i.Last_Name
FROM Course c
JOIN Instructor i ON c.Instructor_ID = i.Instructor_ID
WHERE c.Department_ID = 1; -- Assuming 1 is the ID for the Computer Science Department

-- Creating a View for Active CS Courses
GO -- This statement separates the batches
CREATE VIEW ActiveCS_Courses AS
SELECT c.Course_ID, c.Course_Name, i.First_Name, i.Last_Name
FROM Course c
JOIN Instructor i ON c.Instructor_ID = i.Instructor_ID
WHERE c.Department_ID = 1;
GO

-- Query 2: Current Semester Enrollment Status
-- SQL query to gather current semester enrollment details
SELECT 
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    s.Email,
    COUNT(c.Course_ID) AS Courses_Enrolled,
    SUM(c.Credits) AS Total_Credits
FROM 
    Student s
JOIN 
    Enrollment e ON s.Student_ID = e.Student_ID
JOIN 
    Course c ON e.Course_ID = c.Course_ID
WHERE 
    e.Enrollment_Date >= '2024-01-01' AND e.Enrollment_Date <= '2024-05-01'  -- Assuming this range covers the current semester
GROUP BY 
    s.Student_ID, s.First_Name, s.Last_Name, s.Email;

-- Creating a View for Current Semester Enrollment
GO -- This statement separates the batches
CREATE VIEW CurrentSemesterEnrollment AS
SELECT 
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    s.Email,
    COUNT(c.Course_ID) AS Courses_Enrolled,
    SUM(c.Credits) AS Total_Credits
FROM 
    Student s
JOIN 
    Enrollment e ON s.Student_ID = e.Student_ID
JOIN 
    Course c ON e.Course_ID = c.Course_ID
WHERE 
    e.Enrollment_Date >= '2024-01-01' AND e.Enrollment_Date <= '2024-05-01'  -- Adjust this range according to your semester dates
GROUP BY 
    s.Student_ID, s.First_Name, s.Last_Name, s.Email;
GO

-- Query 3: Course Prerequisites
-- Query to find prerequisites for courses in a specific department (e.g., Mathematics)
SELECT c.Course_Name, p.Prerequisite_Course_ID, pc.Course_Name AS Prerequisite_Name
FROM Course c
JOIN Prerequisite p ON c.Course_ID = p.Course_ID
JOIN Course pc ON p.Prerequisite_Course_ID = pc.Course_ID
WHERE c.Department_ID = 2; -- Assuming 2 is the ID for the Mathematics Department

-- Creating a View for Course Prerequisites
GO -- This statement separates the batches
CREATE VIEW CoursePrerequisites AS
SELECT c.Course_Name, p.Prerequisite_Course_ID, pc.Course_Name AS Prerequisite_Name
FROM Course c
JOIN Prerequisite p ON c.Course_ID = p.Course_ID
JOIN Course pc ON p.Prerequisite_Course_ID = pc.Course_ID;
GO


