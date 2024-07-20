CREATE DATABASE  School_Management_System;

USE School_Management_System;
CREATE TABLE Student(
 ID_Student INT PRIMARY KEY,
 Name_Student VARCHAR (50),
 DateBirth DATE,
 Address_Student VARCHAR (50),

);
USE School_Management_System;
CREATE TABLE family_information(
 ID_family_information INT PRIMARY KEY,
relative_name VARCHAR (50),
 RelationShip VARCHAR (50),
 ID_Student INT UNIQUE,
 FOREIGN KEY(ID_Student) REFERENCES Student(ID_Student)

);
USE School_Management_System;
CREATE TABLE COURSES(
  ID_COURSES INT PRIMARY KEY,
  name_COURSES VARCHAR (50),
  Discription VARCHAR (50),
  Rrsource VARCHAR (50),
);
USE School_Management_System;
CREATE TABLE Student_COURSES(
  ID_COURSES INT,
   ID_Student INT ,
   PRIMARY KEY(ID_COURSES,ID_Student),
    FOREIGN KEY (ID_Student) REFERENCES Student(ID_Student),
    FOREIGN KEY (ID_COURSES) REFERENCES COURSES(ID_COURSES)
);
USE School_Management_System;
CREATE TABLE CLASSES(
  ID_CLASSES INT PRIMARY KEY,
   CLASS_CODE VARCHAR(20) ,
    Room_number INT,
	SCHEDUALE VARCHAR(20) ,
	ID_COURSES INT,
    FOREIGN KEY (ID_COURSES) REFERENCES COURSES(ID_COURSES)
);
USE School_Management_System;
CREATE TABLE ASSIGNMENT(
  ID_ASSIGNMENT INT PRIMARY KEY,
  NAME_ASSIGNMENT VARCHAR(20) ,
  Discription VARCHAR (50),
	due_date  date,
	states VARCHAR (50),
	ID_CLASSES INT,
    FOREIGN KEY (ID_CLASSES) REFERENCES CLASSES(ID_CLASSES)
);
CREATE TABLE ATTANDANCE(
  ID_ATTANDANCE INT PRIMARY KEY,
  TYPE_ATTANDANCE VARCHAR (50),
	date_ATTANDANCE  date,
	REASON VARCHAR (50),
	ID_CLASSES INT,
    FOREIGN KEY (ID_CLASSES) REFERENCES CLASSES(ID_CLASSES)
);
/*******************************************************************/
USE School_Management_System;
INSERT INTO Student (ID_Student, Name_Student, DateBirth, Address_Student) VALUES
(1, 'John Doe', '2005-05-15', '123 Main St'),
(2, 'Jane Smith', '2006-06-20', '456 Oak St'),
(3, 'Alice Johnson', '2005-12-30', '789 Pine St'),
(4, 'Bob Brown', '2006-03-25', '321 Maple St'),
(5, 'Charlie Davis', '2007-07-10', '654 Elm St');


USE School_Management_System;
INSERT INTO family_information (ID_family_information, relative_name, RelationShip, ID_Student) VALUES
(1, 'Michael Doe', 'Father', 1),
(2, 'Sarah Smith', 'Mother', 2),
(3, 'James Johnson', 'Father', 3),
(4, 'Laura Brown', 'Mother', 4),
(5, 'Patricia Davis', 'Mother', 5);

USE School_Management_System;
INSERT INTO COURSES (ID_COURSES, name_COURSES, Discription, Rrsource) VALUES
(1, 'Mathematics', 'Algebra and Geometry', 'Textbook A'),
(2, 'Science', 'Physics and Chemistry', 'Textbook B'),
(3, 'History', 'World History', 'Textbook C'),
(4, 'English', 'Grammar and Literature', 'Textbook D'),
(5, 'Art', 'Drawing and Painting', 'Textbook E');

USE School_Management_System;
INSERT INTO Student_COURSES (ID_COURSES, ID_Student) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

USE School_Management_System;
INSERT INTO CLASSES (ID_CLASSES, CLASS_CODE, Room_number, SCHEDUALE, ID_COURSES) VALUES
(1, 'MATH101', 101, 'MWF 9-10 AM', 1),
(2, 'SCI201', 102, 'TTH 10-11 AM', 2),
(3, 'HIST301', 103, 'MWF 11-12 PM', 3),
(4, 'ENG401', 104, 'TTH 1-2 PM', 4),
(5, 'ART501', 105, 'MWF 2-3 PM', 5);

USE School_Management_System;
INSERT INTO ASSIGNMENT (ID_ASSIGNMENT, NAME_ASSIGNMENT, Discription, due_date, states, ID_CLASSES) VALUES
(1, 'Homework 1', 'Solve problems 1-10', '2023-09-15', 'Pending', 1),
(2, 'Lab Report', 'Complete lab experiment', '2023-09-20', 'Pending', 2),
(3, 'Essay', 'Write an essay on WWI', '2023-09-25', 'Pending', 3),
(4, 'Reading Assignment', 'Read chapters 1-3', '2023-09-30', 'Pending', 4),
(5, 'Art Project', 'Create a landscape painting', '2023-10-05', 'Pending', 5);

USE School_Management_System;
INSERT INTO ATTANDANCE (ID_ATTANDANCE, TYPE_ATTANDANCE, date_ATTANDANCE, REASON, ID_CLASSES) VALUES
(1, 'Present', '2023-09-01', '', 1),
(2, 'Absent', '2023-09-02', 'Sick', 2),
(3, 'Present', '2023-09-03', '', 3),
(4, 'Late', '2023-09-04', 'Traffic', 4),
(5, 'Present', '2023-09-05', '', 5);

update ATTANDANCE set TYPE_ATTANDANCE='Absent' where ID_ATTANDANCE=4;
INSERT INTO Student_ATTANDANCE (ID_Student, ID_ATTANDANCE) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


/**********************************************************/
SELECT *  FROM Student WHERE DateBirth='2005-05-15';
SELECT * FROM COURSES WHERE name_COURSES='Mathematics';
USE School_Management_System;
ALTER TABLE Student ADD Email VARCHAR(50);
--ALTER TABLE Student DROP COLUMN Email ;
USE School_Management_System;
INSERT INTO Student (ID_Student, Name_Student, DateBirth, Address_Student,Email) VALUES
(6, 'Najlaa', '1998-06-9', '123 Main St','najlaak399@gmail.com');
SELECT *  FROM Student join family_information on Student.ID_Student=family_information.ID_Student;

USE School_Management_System;
SELECT COUNT(*) AS count_students
FROM Student_COURSES
JOIN Student ON Student_COURSES.ID_Student = Student.ID_Student
JOIN COURSES ON Student_COURSES.ID_COURSES = COURSES.ID_COURSES
WHERE COURSES.name_COURSES = 'Mathematics';

USE School_Management_System;

SELECT *
FROM Student_ATTANDANCE
JOIN Student ON Student_ATTANDANCE.ID_Student = Student.ID_Student
JOIN ATTANDANCE ON Student_ATTANDANCE.ID_ATTANDANCE = ATTANDANCE.ID_ATTANDANCE;

SELECT *
FROM Student_ATTANDANCE
JOIN Student ON Student_ATTANDANCE.ID_Student = Student.ID_Student
JOIN ATTANDANCE ON Student_ATTANDANCE.ID_ATTANDANCE = ATTANDANCE.ID_ATTANDANCE
where ATTANDANCE.date_ATTANDANCE between '2023-09-01' and '2023-09-03';

USE School_Management_System;

SELECT s.Name_Student
FROM Student s
JOIN Student_ATTANDANCE sa ON s.ID_Student = sa.ID_Student
JOIN ATTANDANCE a ON sa.ID_ATTANDANCE = a.ID_ATTANDANCE
WHERE a.TYPE_ATTANDANCE = 'Absent'
GROUP BY s.Name_Student
HAVING COUNT(*) > 4;
