CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,  -- Can be NULL (see Priya Menpara)
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID)
);


INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');


INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

--Part – A:

select * from PERSON
select * from DEPT

--1. Combine information from Person and Department table using cross join or Cartesian product.
select * from PERSON cross join DEPT 

--2. Find all persons with their department name
select p.PersonName,d.DepartmentName from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID

--3. Find all persons with their department name & code.
select d.DepartmentName, d.DepartmentCode , p.PersonName from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID

--4. Find all persons with their department code and location.
select d.DepartmentCode,d.Location,p.PersonName from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID 

--5. Find the detail of the person who belongs to Mechanical department.
select  p.PersonID,p.PersonName,d.DepartmentCode  from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID where d.DepartmentCode='ME'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.
select p.PersonID,p.PersonName,p.DepartmentID,p.Salary from PERSON p full outer join DEPT d on p.DepartmentID = d.DepartmentID where p.City = 'Ahmedabad' 

--7. Find the person's name whose department is in C-Block.
select p.PersonName from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID where d.Location = 'C-block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
select p.PersonName,p.Salary,d.DepartmentName from PERSON p inner join dept d on p.DepartmentID = d.DepartmentID where p.City = 'Jamnagar'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
select * from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID where p.JoiningDate = '2001-07-01' and  d.DepartmentName = 'Civil'

--10. Display all the person's name with the department whose joining date difference with the current date is
--more than 365 days.


--11. Find department wise person counts.
select d.DepartmentName,COUNT(*) from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID group by d.DepartmentName

--12. Give department wise maximum & minimum salary with department name.
select d.DepartmentName , max(p.Salary) as [max] , min(p.Salary) as [min] from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID group by d.DepartmentName

--13. Find city wise total, average, maximum and minimum salary.
select p.city,COUNT(*),avg(p.Salary),max(p.Salary),min(p.Salary) from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID group by p.city

--14. Find the average salary of a person who belongs to Ahmedabad city.
select p.city, avg(p.Salary) from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID group by p.city having p.City='Ahmedabad'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single
--column)
select p.PersonName + ' lives in ' + p.City + ' and works in ' + d.DepartmentName + ' Department.' AS Info from PERSON p
INNER JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

--Part – B:

--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
select p.PersonName + ' earns ' + CAST(p.Salary AS VARCHAR) + ' from ' + d.DepartmentName + ' department monthly.' AS Info
from PERSON p INNER JOIN  DEPT d on p.DepartmentID = d.DepartmentID;


--2. Find city & department wise total, average & maximum salaries.
select p.city,d.DepartmentName,sum(p.Salary),AVG(p.Salary),max(p.Salary) from PERSON p inner join DEPT d on p.DepartmentID=d.DepartmentID group by p.City,d.DepartmentName

--3. Find all persons who do not belong to any department.
select p.* from PERSON p full outer join DEPT d on p.DepartmentID = d.DepartmentID where p.DepartmentID is NULL


--4. Find all departments whose total salary is exceeding 100000.
select d.DepartmentName,sum(p.Salary) from PERSON p inner join DEPT d on p.DepartmentID = d.DepartmentID group by d.DepartmentName having sum(p.Salary) > 100000

--Part – C:


--1. List all departments who have no person.
select  * from PERSON p full outer join DEPT d on p.DepartmentID = d.DepartmentID where p.PersonID is null

--2. List out department names in which more than two persons are working.
select d.DepartmentName , COUNT(p.PersonName) from PERSON p inner join dept d on p.DepartmentID = d.DepartmentID group by d.DepartmentName having COUNT(p.PersonName) > 2
select d.DepartmentName , COUNT(*) from PERSON p inner join dept d on p.DepartmentID = d.DepartmentID group by d.DepartmentName having COUNT(*) > 2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE p
SET p.Salary = p.Salary * 1.10
FROM PERSON p
INNER JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer';

SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer';



