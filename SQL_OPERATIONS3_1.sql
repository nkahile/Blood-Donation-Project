CREATE PROCEDURE Donated_Students
AS
SELECT Student_Donor.Student_FName , Student_Donor.Student_LName, School.School_Name
FROM Student_Donor, School, Student_Donated_Info
WHERE Student_Donor.School_Code = School.School_Code
AND Student_Donated_Info.Student_Code = Student_Donor.Student_Code

-------------------------
EXEC Donated_Students;
------------------------

CREATE PROCEDURE Donated_Teachers
AS
SELECT Teacher_Donor.Teacher_FName , Teacher_Donor.Teacher_LName, School.School_Name
FROM Teacher_Donor, School, Teacher_Donated_Info
WHERE Teacher_Donor.School_Code = School.School_Code
AND Teacher_Donated_Info.Teacher_Code = Teacher_Donor.Teacher_Code
----------------------------
EXEC Donated_Teachers;
---------------------------
