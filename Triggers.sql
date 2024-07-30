-- Trigger for INSERT
CREATE TRIGGER trg_Audit_Department_Insert
ON Department
AFTER INSERT
AS
BEGIN
    INSERT INTO Department_Audit (Department_ID, Department_Name, Operation_Type, Operation_DateTime)
    SELECT Department_ID, Department_Name, 'INSERT', GETDATE()
    FROM inserted;
END;
GO

-- Trigger for UPDATE
CREATE TRIGGER trg_Audit_Department_Update
ON Department
AFTER UPDATE
AS
BEGIN
    INSERT INTO Department_Audit (Department_ID, Department_Name, Operation_Type, Operation_DateTime)
    SELECT Department_ID, Department_Name, 'UPDATE', GETDATE()
    FROM inserted;
END;
GO

-- Trigger for DELETE
CREATE TRIGGER trg_Audit_Department_Delete
ON Department
AFTER DELETE
AS
BEGIN
    INSERT INTO Department_Audit (Department_ID, Department_Name, Operation_Type, Operation_DateTime)
    SELECT Department_ID, Department_Name, 'DELETE', GETDATE()
    FROM deleted;
END;
GO

-- Testing Triggers

-- Insert a new department
INSERT INTO Department (Department_ID, Department_Name)
VALUES (101, 'Data Science');
GO

-- Update a department
UPDATE Department
SET Department_Name = 'Data Sciences'
WHERE Department_ID = 101;
GO

-- Delete a department
DELETE FROM Department
WHERE Department_ID = 101;
GO

-- Query the audit table
SELECT * FROM Department_Audit;
