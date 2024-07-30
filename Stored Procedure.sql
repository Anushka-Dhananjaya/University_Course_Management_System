-- Creating Stored Procedure 
CREATE PROCEDURE GetStudentCourses
    @Student_ID INT
AS
BEGIN
    SELECT
        c.Course_ID,
        c.Course_Name,
        c.Credits,
        e.Enrollment_Date
    FROM
        Course c
        JOIN Enrollment e ON c.Course_ID = e.Course_ID
    WHERE
        e.Student_ID = @Student_ID;
END;

--  Dropping Stored Procedure 
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'GetStudentCourses')
    DROP PROCEDURE GetStudentCourses;
GO
