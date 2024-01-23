-- Create the database
CREATE DATABASE TutoringPlatform;
USE TutoringPlatform;

-- Create the table for top locations
CREATE TABLE TopLocations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(50) UNIQUE
);

-- Insert data into TopLocations table
INSERT INTO TopLocations (LocationID, LocationName)
VALUES
    (1, 'Delhi'),
    (2, 'Kolkata'),
    (3, 'Bangalore'),
    (4, 'Hyderabad'),
    (5, 'Mumbai'),
    (6, 'Chennai');

-- Create the table for top subjects
CREATE TABLE TopSubjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50) UNIQUE
);

-- Insert data into TopSubjects table
INSERT INTO TopSubjects (SubjectID, SubjectName)
VALUES
    (1, 'Mathematics'),
    (2, 'English'),
    (3, 'Science'),
    (4, 'Biological Science'),
    (5, 'Physics'),
    (6, 'Computer Science');

-- Create the table for tuition jobs
CREATE TABLE TuitionJobs (
    JobID INT PRIMARY KEY,
    LocationName VARCHAR(50),
    FOREIGN KEY (LocationName) REFERENCES TopLocations(LocationName)
);

-- Insert data into TuitionJobs table
INSERT INTO TuitionJobs (JobID, LocationName)
VALUES
    (1, 'Delhi'),
    (2, 'Kolkata'),
    (3, 'Bangalore'),
    (4, 'Hyderabad'),
    (5, 'Mumbai'),
    (6, 'Chennai');
-- Create the table for top teachers
CREATE TABLE TopTeachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50),
    LocationName VARCHAR(50),
    SubjectName VARCHAR(50),
    FOREIGN KEY (LocationName) REFERENCES TopLocations(LocationName),
    FOREIGN KEY (SubjectName) REFERENCES TopSubjects(SubjectName)
);

-- Insert data into TopTeachers table
INSERT INTO TopTeachers (TeacherID, TeacherName, LocationName, SubjectName)
VALUES
    (1, 'Teacher1', 'Delhi', 'Mathematics'),
    (2, 'Teacher2', 'Kolkata', 'English'),
    (3, 'Teacher3', 'Bangalore', 'Science'),
    (4, 'Teacher4', 'Hyderabad', 'Biological Science'),
    (5, 'Teacher5', 'Mumbai', 'Physics'),
    (6, 'Teacher6', 'Chennai', 'Computer Science');
    
    
SELECT * FROM TopLocations;

SELECT * FROM TopSubjects;

SELECT * FROM TuitionJobs;

SELECT * FROM TopTeachers;



    
-- Find the number of top teachers in each location:

SELECT LocationName, COUNT(*) AS TeacherCount
FROM TopTeachers
GROUP BY LocationName;

-- Find the number of top teachers for each subject:

SELECT SubjectName, COUNT(*) AS TeacherCount
FROM TopTeachers
GROUP BY SubjectName;

-- Find teachers who teach in their respective top locations:
SELECT TeacherName
FROM TopTeachers
WHERE LocationName = (SELECT LocationName FROM TopLocations WHERE LocationID = TopTeachers.TeacherID);


-- Find the teachers who teach both Physics and Computer Science:

SELECT TeacherName
FROM TopTeachers
WHERE SubjectName IN ('Physics', 'Computer Science')
GROUP BY TeacherName;

-- Count the total number of tuition jobs:

SELECT COUNT(*) AS TotalTuitionJobs
FROM TuitionJobs;

-- Find the average number of teachers per location:

SELECT AVG(TeacherCount) AS AverageTeachersPerLocation
FROM (
    SELECT LocationName, COUNT(*) AS TeacherCount
    FROM TopTeachers
    GROUP BY LocationName
) AS LocationTeacherCounts;









