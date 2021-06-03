use master;
go
CREATE DATABASE FINAL52;
go
use FINAL52;



--kah52kah--
CREATE TABLE Student_Donor(
    Student_Code INT IDENTITY(1,1) NOT NULL,
    Student_FName CHAR(30),
    Student_LName CHAR(30),
    Student_Grade CHAR(4),
    Student_Age INT NOT NULL,
    School_Code INT NOT NULL,
    PRIMARY KEY(Student_Code),
    FOREIGN KEY(School_Code) REFERENCES School_Info(School_Code)
);
--------------------
SELECT * FROM Student_Donor;
DROP TABLE Student_Donor;
--------------------
INSERT INTO Student_Donor VALUES('Sandy', 'Tawfik', '11th', 17, 2)
INSERT INTO Student_Donor VALUES('Andy', 'Johnson', '12th', 18, 3)
INSERT INTO Student_Donor VALUES('Nicole', 'Harrelson', '10th', 15, 2)
INSERT INTO Student_Donor VALUES('Conrad', 'Mcduffee', '11th', 16, 1)
INSERT INTO Student_Donor VALUES('Detra', 'Jara', '11th', 16, 1)
INSERT INTO Student_Donor VALUES('Regina', 'Fraire', '12th', 18, 3)
INSERT INTO Student_Donor VALUES('Ayako', 'Forbush', '12th', 17, 3)
INSERT INTO Student_Donor VALUES('Elenore', 'Desantiago', '12th', 18, 1)
INSERT INTO Student_Donor VALUES('Starr', 'Archibald', '12th', 18, 1)
INSERT INTO Student_Donor VALUES('Christie', 'Townsend', '11th', 16, 2)
INSERT INTO Student_Donor VALUES('Chanelle', 'Moye', '11th', 16, 3)
INSERT INTO Student_Donor VALUES('King', 'Johnson', '10th', 15, 1)
INSERT INTO Student_Donor VALUES('Ofelia', 'Mote', '12th', 18, 1)
INSERT INTO Student_Donor VALUES('Kaestner', 'Portwood', '11th', 17, 2)
INSERT INTO Student_Donor VALUES('Deidre', 'Germaine', '10th', 15, 3)
INSERT INTO Student_Donor VALUES('Kortney', 'Weems', '11th', 16, 2)

--------------------
DELETE from Student_Donor WHERE Student_Code = 12 ;

--------------------



CREATE TABLE Teacher_Donor(
    Teacher_Code INT IDENTITY(1,1) NOT NULL,
    Teacher_FName CHAR(30),
    Teacher_LName CHAR(30),
    Teacher_Age INT NOT NULL,
    School_Code INT NOT NULL,
    PRIMARY KEY(Teacher_Code),
    FOREIGN KEY(School_Code) REFERENCES School_Info(School_Code)
);
--------------------
SELECT * FROM Teacher_Donor;
DROP TABLE Teacher_Donor;
--------------------
INSERT INTO Teacher_Donor VALUES('Kelly', 'Van Busum', 25, 1)
INSERT INTO Teacher_Donor VALUES('John', 'Harris', 32, 2)
INSERT INTO Teacher_Donor VALUES('Fang', 'Li', 28, 1)
INSERT INTO Teacher_Donor VALUES('Amanda', 'Daniel', 40, 3)
INSERT INTO Teacher_Donor VALUES('Jackson', 'Scott', 46, 2)

--------------------



CREATE TABLE School_Info(
    School_Code INT  NOT NULL,
    School_Street CHAR(50),
    School_City CHAR(50),
    School_State CHAR(2),
    School_Zip INT NOT NULL,
    PRIMARY KEY(School_Code)
);
--------------------
SELECT * FROM School_Info;
DROP TABLE School_Info;
--------------------
INSERT INTO School_Info VALUES( 1, 'E Carmel Dr', 'Carmel', 'IN', 46032)
INSERT INTO School_Info VALUES( 2, '18250 N Union St', 'Westfield', 'IN', 46074)
INSERT INTO School_Info VALUES( 3, '1801 E 86th St', 'Indianapolis', 'IN', 46240)

--------------------




CREATE TABLE School(
    School_Code INT NOT NULL,
    School_Name CHAR(100),
    PRIMARY KEY(School_Code),
    FOREIGN KEY(School_Code) REFERENCES School_Info (School_Code)
);
--------------------
SELECT * FROM School;
DROP TABLE School;
--------------------
INSERT INTO School VALUES(1,'Carmel High School')
INSERT INTO School VALUES(2,'North Central High School')
INSERT INTO School VALUES(3,'Westfield High School')

--------------------




CREATE TABLE Hospital_Info(
    Hospital_Code INT NOT NULL,
    Hospital_Street CHAR(50),
    Hospital_City CHAR(50),
    Hospital_State CHAR(2),
    Hospital_Zip INT NOT NULL,
    Hospital_Phone CHAR(15) NOT NULL,
    PRIMARY KEY(Hospital_Code)
);
--------------------
SELECT * FROM Hospital_Info;
DROP TABLE Hospital_Info;
--------------------
INSERT INTO Hospital_Info VALUES(1, 'E Carmel Dr', 'Carmel', 'IN', 46032, '317-365-9874')



--------------------




CREATE TABLE Hospital(
    Hospital_Code INT NOT NULL,
    Hospital_Name CHAR(100),
    PRIMARY KEY(Hospital_Code),
    FOREIGN KEY(Hospital_Code) REFERENCES Hospital_Info(Hospital_Code)
);
--------------------
SELECT * FROM Hospital;
DROP TABLE Hospital;
--------------------
INSERT INTO Hospital VALUES(1, 'St vincent hospital in Carmel')


--------------------
CREATE TABLE Blood_Bag_Quantity(
    Hospital_Code INT NOT NULL,
    A_Type_Fulfilled INT,
    B_Type_Fulfilled INT,
    AB_Type_Fulfilled INT,
    O_Type_Fulfilled INT,
    PRIMARY KEY(Hospital_Code),
    FOREIGN KEY(Hospital_Code) REFERENCES Hospital_Info(Hospital_Code)
);
--------------------
INSERT INTO Blood_Bag_Quantity VALUES(1,50,50,50,50);
--------------------

UPDATE Blood_Bag_Quantity
SET A_Type_Fulfilled = A_Type_Fulfilled+1;
--------------------
SELECT * FROM Blood_Bag_Quantity;
drop TABLE Blood_Bag_Quantity;
--------------------


CREATE TABLE Nurse(
    Nurse_ID INT IDENTITY(1,1) NOT NULL,
    Hospital_Code INT NOT NULL,
    Nurse_FName CHAR(30),
    Nurse_LName CHAR(30),
    PRIMARY KEY(Nurse_ID),
    FOREIGN KEY(Hospital_Code) REFERENCES Hospital_Info(Hospital_Code)
);
--------------------
SELECT * FROM Nurse;
DROP TABLE Nurse;
--------------------

INSERT INTO Nurse VALUES(1,'Jack','Dan')
INSERT INTO Nurse VALUES(1,'Sara','Wan')
INSERT INTO Nurse VALUES(1,'Jackie','Samuel')
INSERT INTO Nurse VALUES(1,'Sam','Scott')
--------------------


CREATE TABLE Pre_Exam(
    Exam_ID INT IDENTITY(1,1) NOT NULL,
    Nurse_ID INT NOT NULL,
    Student_Code INT NOT NULL,
    PRIMARY KEY(Exam_ID),
    FOREIGN KEY(Nurse_ID) REFERENCES Nurse(Nurse_ID),
    FOREIGN KEY(Student_Code) REFERENCES Student_Donor(Student_Code)
);
--------------------
SELECT * FROM Pre_Exam;
DROP TABLE Pre_Exam;
--------------------
INSERT INTO Pre_Exam VALUES(1,1)

--------------------

CREATE TABLE Blood_Type(
    Blood_Type CHAR(3),
    PRIMARY KEY(Blood_Type)
);
--------------------
SELECT * FROM Blood_Type;
DROP TABLE Blood_Type;
--------------------
INSERT INTO Blood_Type VALUES('A')
INSERT INTO Blood_Type VALUES('B')
INSERT INTO Blood_Type VALUES('AB')
INSERT INTO Blood_Type VALUES('O')


--------------------



CREATE TABLE Student_Donated_Info(
    Student_Code INT NOT NULL,
    Date_Of_Donation DATE NOT NULL,
    Blood_Type char(3),
    PRIMARY KEY(Student_Code),
    FOREIGN KEY(Student_Code) REFERENCES Student_Donor(Student_Code),
    FOREIGN KEY(Blood_Type) REFERENCES Blood_Type(Blood_Type)
);
--------------------
SELECT * FROM Student_Donated_Info;
DROP TABLE Student_Donated_Info;
--------------------
INSERT INTO Student_Donated_Info VALUES(1, '02-05-2021','O')
INSERT INTO Student_Donated_Info VALUES(2, '02-05-2021','O')
INSERT INTO Student_Donated_Info VALUES(3, '02-05-2021','A')
INSERT INTO Student_Donated_Info VALUES(4, '02-05-2021','A')
INSERT INTO Student_Donated_Info VALUES(5, '02-05-2021','A')
INSERT INTO Student_Donated_Info VALUES(6, '02-05-2021','AB')
INSERT INTO Student_Donated_Info VALUES(7, '02-05-2021','O')
INSERT INTO Student_Donated_Info VALUES(8, '02-05-2021','AB')
INSERT INTO Student_Donated_Info VALUES(9, '02-05-2021','O')
INSERT INTO Student_Donated_Info VALUES(10, '02-05-2021','B')
INSERT INTO Student_Donated_Info VALUES(11, '02-05-2021','AB')
INSERT INTO Student_Donated_Info VALUES(12, '02-05-2021','O')
INSERT INTO Student_Donated_Info VALUES(13, '02-05-2021','AB')
INSERT INTO Student_Donated_Info VALUES(14, '02-05-2021','B')
INSERT INTO Student_Donated_Info VALUES(15, '02-05-2021','B')
INSERT INTO Student_Donated_Info VALUES(16, '02-06-2021','AB')

delete from Student_Donated_Info where Student_Code = 15;






SELECT TOP 1 Blood_Type FROM Student_Donated_Info ORDER BY Student_Code DESC

--------------------



CREATE TABLE Teacher_Donated_Info(
    Teacher_Code INT NOT NULL,
    Date_Of_Donation DATE NOT NULL,
    Blood_Type char(3),
    PRIMARY KEY(Teacher_Code),
    FOREIGN KEY(Teacher_Code) REFERENCES Teacher_Donor(Teacher_Code),
    FOREIGN KEY(Blood_Type) REFERENCES Blood_Type(Blood_Type)
);
--------------------
SELECT * FROM Teacher_Donated_Info;
DROP TABLE Teacher_Donated_Info;
--------------------
INSERT INTO Teacher_Donated_Info VALUES(1,'02-05-2019','A')
--------------------
