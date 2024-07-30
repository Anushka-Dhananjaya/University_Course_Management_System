/*
Authors:  Anushka Dhananjaya
Course:IFT 530,
Date: 04/19/2024
Final Project : University Course Management
*/

-- Create the database
CREATE DATABASE GROUP59;
GO

-- Use the database
USE GROUP59;
GO

-- Department Table
CREATE TABLE Department (
    Department_ID INT NOT NULL PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL
);

-- Instructor Table
CREATE TABLE Instructor (
    Instructor_ID INT NOT NULL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

-- Course Table
CREATE TABLE Course (
    Course_ID INT NOT NULL PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Department_ID INT NOT NULL,
    Credits INT NOT NULL,
    Instructor_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

-- Student Table
CREATE TABLE Student (
    Student_ID INT NOT NULL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Major VARCHAR(50) NOT NULL
);

-- Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT NOT NULL PRIMARY KEY,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Enrollment_Date DATE NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- Grade Table
CREATE TABLE Grade (
    Grade_ID INT NOT NULL PRIMARY KEY,
    Enrollment_ID INT NOT NULL,
    Grade VARCHAR(2) NOT NULL,
    Grade_Date DATE NOT NULL,
    FOREIGN KEY (Enrollment_ID) REFERENCES Enrollment(Enrollment_ID)
);

-- Prerequisite Table
CREATE TABLE Prerequisite (
    Prerequisite_ID INT NOT NULL PRIMARY KEY,
    Course_ID INT NOT NULL,
    Prerequisite_Course_ID INT NOT NULL,
    Semester VARCHAR(20) NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Prerequisite_Course_ID) REFERENCES Course(Course_ID)
);

-- Course Material Table
CREATE TABLE Course_Material (
    Material_ID INT NOT NULL PRIMARY KEY,
    Course_ID INT NOT NULL,
    Material_Name VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);
