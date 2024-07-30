-- Creating User Defined Function
CREATE FUNCTION CalculateTotalCredits
    (@Student_ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalCredits INT;
    SELECT
        @TotalCredits = SUM(c.Credits)
    FROM
        Course c
        JOIN Enrollment e ON c.Course_ID = e.Course_ID
    WHERE
        e.Student_ID = @Student_ID
        AND e.Enrollment_Date BETWEEN '2024-01-01' AND '2024-05-01'; -- Assuming this is the current semester
    RETURN (@TotalCredits);
END;
GO

-- Dropping User Defined Function if it exists
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'FN' AND name = 'CalculateTotalCredits')
BEGIN
    DROP FUNCTION CalculateTotalCredits;
END
GO
