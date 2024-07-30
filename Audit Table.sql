-- Creating Audit Table
CREATE TABLE Department_Audit (
    Audit_ID INT IDENTITY(1,1) PRIMARY KEY,
    Department_ID INT,
    Department_Name VARCHAR(50),
    Operation_Type VARCHAR(10),
    Operation_DateTime DATETIME
);
