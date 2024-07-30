DECLARE @Student_ID INT, @Total_Credits INT;

-- Create the cursor
DECLARE credit_cursor CURSOR FOR 
    SELECT Student_ID, SUM(Credits) AS TotalCredits
    FROM Enrollment
    JOIN Course ON Enrollment.Course_ID = Course.Course_ID
    GROUP BY Student_ID
    HAVING SUM(Credits) > 15;  -- More than 15 credits

-- Open the cursor
OPEN credit_cursor;

-- Fetch data into variables
FETCH NEXT FROM credit_cursor INTO @Student_ID, @Total_Credits;

-- Loop through the results
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Student ID: ' + CAST(@Student_ID AS VARCHAR(10)) + ' has ' + CAST(@Total_Credits AS VARCHAR(10)) + ' credits.';
    -- Fetch next
    FETCH NEXT FROM credit_cursor INTO @Student_ID, @Total_Credits;
END;

-- Close and deallocate the cursor
CLOSE credit_cursor;
DEALLOCATE credit_cursor;
