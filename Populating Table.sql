/*
Authors:Anushka Dhananjaya
Course:IFT 530,
Date: 04/19/2024
Final Project : University Course Management
Populating tables
*/
-- Populate Department Table
INSERT INTO Department (Department_ID, Department_Name)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics'),
    (4, 'Biology'),
    (5, 'Chemistry'),
    (6, 'History'),
    (7, 'English'),
    (8, 'Art'),
    (9, 'Music'),
    (10, 'Business');

-- Populate Instructor Table (10 rows)
INSERT INTO Instructor (Instructor_ID, First_Name, Last_Name, Email, Department_ID)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 1),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 2),
          (3, 'Michael', 'Johnson', 'michael.johnson@example.com', 3),
   	    (4, 'Emily', 'Williams', 'emily.williams@example.com', 4),
    	    (5, 'James', 'Brown', 'james.brown@example.com', 5),
    	    (6, 'Sarah', 'Miller', 'sarah.miller@example.com', 6),
    	    (7, 'David', 'Taylor', 'david.taylor@example.com', 7),
   	    (8, 'Jessica', 'Anderson', 'jessica.anderson@example.com', 8),
   	    (9, 'Daniel', 'Thomas', 'daniel.thomas@example.com', 9),
          (10, 'Rachel', 'Jackson', 'rachel.jackson@example.com', 10);

-- Populate Course Table (20 rows)
INSERT INTO Course (Course_ID, Course_Name, Department_ID, Credits, Instructor_ID)
VALUES
    (1, 'Introduction to Programming', 1, 3, 1),
    (2, 'Calculus I', 2, 4, 2),
    (3, 'Mechanics', 3, 3, 3),
    (4, 'Biology Basics', 4, 3, 4),
    (5, 'Organic Chemistry', 5, 4, 5),
    (6, 'World History', 6, 3, 6),
    (7, 'English Literature', 7, 3, 7),
    (8, 'Art History', 8, 3, 8),
    (9, 'Music Theory', 9, 2, 9),
    (10, 'Introduction to Business', 10, 3, 10),
    (11, 'Data Structures', 1, 3, 1),
    (12, 'Calculus II', 2, 4, 2),
    (13, 'Electricity and Magnetism', 3, 3, 3),
    (14, 'Genetics', 4, 3, 4),
    (15, 'Biochemistry', 5, 4, 5),
    (16, 'European History', 6, 3, 6),
    (17, 'American Literature', 7, 3, 7),
    (18, 'Modern Art', 8, 3, 8),
    (19, 'Music History', 9, 2, 9),
    (20, 'Marketing Principles', 10, 3, 10);

-- Populate Student Table (10 rows)
INSERT INTO Student (Student_ID, First_Name, Last_Name, Email, Major)
VALUES
    (1, 'Alice', 'Johnson', 'alice.johnson@example.com', 'Computer Science'),
    (2, 'Bob', 'Smith', 'bob.smith@example.com', 'Mathematics'),
    (3, 'Charlie', 'Williams', 'charlie.williams@example.com', 'Physics'),
    (4, 'Diana', 'Brown', 'diana.brown@example.com', 'Biology'),
    (5, 'Eva', 'Davis', 'eva.davis@example.com', 'Chemistry'),
    (6, 'Frank', 'Miller', 'frank.miller@example.com', 'History'),
    (7, 'Grace', 'Wilson', 'grace.wilson@example.com', 'English'),
    (8, 'Henry', 'Martinez', 'henry.martinez@example.com', 'Art'),
    (9, 'Isabel', 'Garcia', 'isabel.garcia@example.com', 'Music'),
    (10, 'Jack', 'Lopez', 'jack.lopez@example.com', 'Business');

-- Populate Enrollment Table (50 rows)
DECLARE @i INT = 1;
WHILE @i <= 50
BEGIN
    INSERT INTO Enrollment (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date)
    VALUES
        (@i, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(20-1)+1), DATEADD(day, -ROUND(RAND()*365, 0), GETDATE()));
    SET @i = @i + 1;
END;

-- Populate Grade Table (50 rows)
DECLARE @j INT = 1;
WHILE @j <= 50
BEGIN
    INSERT INTO Grade (Grade_ID, Enrollment_ID, Grade, Grade_Date)
    VALUES
        (@j, @j, CASE WHEN RAND() < 0.7 THEN 'A' ELSE 'B' END, DATEADD(day, ROUND(RAND()*365, 0), GETDATE()));
    SET @j = @j + 1;
END;
-- Populate Prerequisite Table (10 rows)
INSERT INTO Prerequisite (Prerequisite_ID, Course_ID, Prerequisite_Course_ID, Semester)
VALUES
    (1, 2, 1, 'Spring 2023'),
    (2, 3, 2, 'Fall 2022'),
    (3, 4, 3, 'Spring 2022'),
    (4, 5, 4, 'Fall 2021'),
    (5, 6, 5, 'Spring 2021'),
    (6, 7, 6, 'Fall 2020'),
    (7, 8, 7, 'Spring 2020'),
    (8, 9, 8, 'Fall 2019'),
    (9, 10, 9, 'Spring 2019'),
    (10, 11, 10, 'Fall 2018');
-- Populate Course_Material Table (10 rows)
INSERT INTO Course_Material (Material_ID, Course_ID, Material_Name, Description)
VALUES
    (1, 1, 'Introduction to Programming Textbook', 'This textbook covers the fundamental concepts of programming languages and techniques.'),
    (2, 2, 'Calculus I Workbook', 'This workbook provides exercises and problems for students to practice calculus concepts.'),
    (3, 3, 'Mechanics Lecture Notes', 'Comprehensive lecture notes covering classical mechanics topics such as motion, forces, and energy.'),
    (4, 4, 'Biology Basics Lab Manual', 'Step-by-step guide for laboratory experiments covering basic biology concepts.'),
    (5, 5, 'Organic Chemistry Lecture Slides', 'Presentation slides covering organic chemistry topics including structure, reactions, and synthesis.'),
    (6, 6, 'World History Documentary Series', 'A series of documentaries exploring major events and developments in world history.'),
    (7, 7, 'English Literature Anthology', 'Collection of literary works from various periods and genres of English literature.'),
    (8, 8, 'Art History Textbook', 'Comprehensive textbook covering the history of art from ancient to contemporary times.'),
    (9, 9, 'Music Theory Workbook', 'Exercises and activities to reinforce music theory concepts such as harmony, rhythm, and notation.'),
    (10, 10, 'Introduction to Business Case Studies', 'Case studies illustrating key concepts and principles in business management and strategy.');
