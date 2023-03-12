CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50),
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)

CREATE TABLE WHEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50),
)

INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

INSERT INTO WHEmployeeDemographics VALUES
(NULL, 'Jack', 'Rose', NULL, NULL)



/*
Select Statement - Top, Distinct, Count, As, Max, Min, Avg
*/

SELECT * FROM EmployeeDemographics

SELECT * FROM
[SQL Tutorial].dbo.EmployeeDemographics

SELECT Top 5 *
From EmployeeDemographics

SELECT DISTINCT(Gender) 
From EmployeeDemographics

SELECT COUNT(LastName) AS LastNameCount
From EmployeeDemographics

SELECT MAX(salary) as MaxSalary
FROM EmployeeSalary

SELECT AVG(Age) as AvgAge
FROM EmployeeDemographics

/*
Where Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

SELECT * 
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

SELECT * 
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT * 
FROM EmployeeDemographics
WHERE Age >= 30 OR Gender = 'Male'

SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE '_c%'

SELECT * 
FROM EmployeeDemographics
WHERE LastName is NOT NULL

SELECT * 
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Pam')

/* 
Group By, Order By
*/

SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, Age, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
--WHERE Age >=30
GROUP BY Gender, Age

SELECT *
FROM EmployeeDemographics
ORDER BY Gender DESC, Age DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 1,2,3,4 DESC, 5 DESC

--SELECT Gender, Age, COUNT(Gender) AS GenderCount
--FROM EmployeeDemographics
--WHERE Age >=30
--GROUP BY Gender
--ORDER BY Age

/*
Joins - Inner, Full, Left, Right
*/

SELECT * 
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
Left Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
Right Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

SELECT  JobTitle, AVG(Salary) AS AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle ='Salesman'
GROUP BY JobTitle

/*
Union, Union All
*/

SELECT * 
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION
SELECT *
FROM [SQL Tutorial].dbo.WHEmployeeDemographics

SELECT * 
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM [SQL Tutorial].dbo.WHEmployeeDemographics
ORDER BY FirstName

SELECT EmployeeID, FirstName, Age
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION 
SELECT EmployeeID, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeSalary
ORDER BY FirstName

/*
Case Statement
*/

SELECT FirstName, LastName, Age,
CASE
	When Age = 38 THEN 'Stanley'
	WHEN Age > 30 THEN 'Old'
	Else 'Baby'
END
FROM [SQL Tutorial].dbo.EmployeeDemographics
WHERE Age is NOT NULL
Order BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN  JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRise
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Having Clause
*/

SELECT JobTitle, COUNT(JobTitle) As JobTitleCount
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary) As AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AvgSalary

/*
Alias
*/

SELECT FirstName  + ' ' + LastName AS FullName
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT FirstName, Avg(Age) As AvgAge
FROM  [SQL Tutorial].dbo.EmployeeDemographics
GROUP BY FirstName

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics AS Demo
JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

SELECT Demo.EmployeeID, Demo.FirstName, Sal.Salary, WHDemo.Age
FROM [SQL Tutorial].dbo.EmployeeDemographics AS Demo
LEFT JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQL Tutorial].dbo.WHEmployeeDemographics AS WHDemo
	ON Demo.EmployeeID = WHDemo.EmployeeID

/*
Partition By
*/

SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographics Dem
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID


SELECT Gender, COUNT(Gender) as GenderCount
FROM [SQL Tutorial].dbo.EmployeeDemographics Dem
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID
--GROUP BY Gender

/*
CTE
*/

WITH CTE_Employee AS
	(SELECT 
		FirstName, 
		Gender, 
		Salary, 
		COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender,
		AVG(Salary) OVER (PARTITION BY Salary) as AvgSalary
	FROM [SQL Tutorial].dbo.EmployeeDemographics Dem
	JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID
	WHERE Salary > '45000'
)
SELECT FirstName, AvgSalary
FROM CTE_Employee

/*
Temp Tables
*/

CREATE TABLE #temp_Employee (
	EmployeeID int,
	JobTitle varchar(50),
	Salary int
);

SELECT * 
FROM #temp_employee;

INSERT INTO #temp_Employee VALUES (
	1001, 'HR', 50000
)

INSERT INTO #temp_Employee 
SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary

DROP TABLE IF EXISTS #temp_Employee2
CREATE TABLE #temp_Employee2 (
JobTitle varchar(50),
EmpPerJob  int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics Dem
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT * FROM #temp_Employee2

/*
String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')



-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors 


-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


-- Using Substring

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)

-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors

/*
Stored Procedures
*/

CREATE PROCEDURE TEST
AS
Select *
From EmployeeDemographics

EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_Employee (
JobTitle varchar(50),
EmpPerJob  int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics Dem
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID
	where JobTitle = @JobTitle
GROUP BY JobTitle

SELECT * FROM #temp_Employee

EXEC Temp_Employee


/*
SubQueries/ InnerQueries/ NestedQueries (Select, From, and Where statements)
*/

Select * from EmployeeSalary

--SubQuery in Select statement

SELECT EmployeeID, Salary, ( SELECT AVG(Salary) From EmployeeSalary) AS AvgSalary
FROM EmployeeSalary

SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2

--SubQueries in From statement

SELECT a.EmployeeID, AllAvgSalary
FROM
(	SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
	FROM EmployeeSalary
) a
	
--SubQuery in Where Statement

Select EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID in (
	SELECT EmployeeID
	FROM EmployeeDemographics
	WHERE Age > 30) 