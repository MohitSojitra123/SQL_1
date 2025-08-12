--Lab 6 
--Implement SQL In-built functions (Math, String, and Date Functions)

--Math functions
--Part � A:
--1. Display the result of 5 multiply by 30.
select 5*30 as result

--2. Find out the absolute value of -25, 25, -50 and 50.
select ABS(-25),ABS(25),ABS(-50),ABS(50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
select CEILING(25.2),CEILING(25.7),CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
select FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3.
select 5%2,5%3

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
select POWER(3,2),POWER(4,3)

--7. Find out the square root of 25, 30 and 50.
select SQRT(25) as '25', SQRT(30) as '30' , SQRT(50) as '50'

--8. Find out the square of 5, 15, and 25.
select SQUARE(5) as '5',SQUARE(15) as '15',SQUARE(25) as '25'

--9. Find out the value of PI.
select pi()

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
select ROUND(157.732,2) as '157.732,2',ROUND(157.732,0) as '157.732,0',ROUND(157.732,-2) as '157.732,-2'

--11. Find out exponential value of 2 and 3.
select exp(2) as '2',exp(3) as '3'

--12. Find out logarithm having base e of 10 and 2.
select log(10),log(2)

--13. Find out logarithm having base b having value 10 of 5 and 100.
select log10(5),log10(100)

--14. Find sine, cosine and tangent of 3.1415.
select SIGN(3.1415) as 'SIGN',Cos(3.1415) as 'COSINE'

--15. Find sign of -25, 0 and 25.
select SIGN(-25) as '-25',Sign(0) as '0',SIGN(25) as '25'

--16. Generate random number using function.
select RAND()

--Part � B:
--Create and insert the following records in the EMP_MASTER table. 

--1. Display the result of Salary plus Commission.


--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.


--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.


--4. Find out remainder of 55 divided 2 and 55 divided by 3.


--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.


--Part � C:
--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.


--2. Find the details of employees whose commission is more than 25% of their salary


--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater than
--15000.


--4. Find employees whose total earnings (Salary + Commission) are at least double their salary.


-- String Functions:

--PART_A (String Functions):

--1. Find the length of following. (I) NULL (II) � hello � (III) Blank
select len(Null) as length_of_string
select len(' hello ') as length_of_string
select len('') as length_of_string

--2. Display your name in lower & upper case.
select LOWER('Mohit Sojitra')
select UPPER('Mohit Sojitra')

--3. Display first three characters of your name.
select SUBSTRING('Mohit Sojitra', 1, 3)

--4. Display 3rd to 10th character of your name.
select SUBSTRING('Mohit Sojitra', 3, 8)

--5. Write a query to convert �abc123efg� to �abcXYZefg� & �abcabcabc� to �ab5ab5ab5� using REPLACE.
select REPLACE('abc123efg', '123', 'XYZ')
select REPLACE('abcabcabc', 'c', '5')

--6. Write a query to display ASCII code for �a�,�A�,�z�,�Z�, 0, 9.
select ASCII('a')
select ASCII('A')
select ASCII('z')
select ASCII('Z')
select ASCII('0')
select ASCII('9')

--7. Write a query to display character based on number 97, 65,122,90,48,57.
select CHAR(97)
select CHAR(65)
select CHAR(122)
select CHAR(90)
select CHAR(48)
select CHAR(57)

--8. Write a query to remove spaces from left of a given string �hello world �.
select LTRIM('hello world ')

--9. Write a query to remove spaces from right of a given string � hello world �.
select RTRIM(' hello world')

--10. Write a query to display first 4 & Last 5 characters of �SQL Server�.
select LEFT('SQL Server', 4) as 'LEFT', RIGHT('SQL Server', 5) as 'RIGHT'

--11. Write a query to convert a string �1234.56� to number (Use cast and convert function).
select CAST(1234.56 as int)
select CONVERT(int, 1234.56)

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
select CAST(10.58 as int)
select CONVERT(int, 10.58)

--13. Put 10 space before your name using function.
select len(SPACE(10) + 'Mohit')
select SPACE(10) + 'Mohit'

--14. Combine two strings using + sign as well as CONCAT ().
select 'Mohit ' + 'Sojitra'
select CONCAT('Mohit ', 'Sojitra')

--15. Find reverse of �Darshan�.
select REVERSE('Darshan')

--16. Repeat your name 3 times
select REPLICATE('Mohit',3)

--Part � B: 
--Perform following queries on EMP_MASTER table.

--1. Find the length of EMP Name and City columns.

--2. Display EMP Name and City columns in lower & upper case.

--3. Display first three characters of EMP Name column.

--4. Display 3rd to 10th character of city column.

--5. Write a query to display first 4 & Last 5 characters of EMP Name column.

--Part � C:
--Perform following queries on EMP_MASTER table.

--1. Put 10 space before EMP Name using function.

--2. Combine EMP Name and city columns using + sign as well as CONCAT ().

--3. Combine all columns using + sign as well as CONCAT ().

--4. Combine the result as < EMP Name > Lives in <City>.

--5. Combine the result as �EMP no of < EMP Name> is <EmpNo> .

--6. Retrieve the names of all employee where the third character of the Name is a vowel.

--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that starts
--with 'R'.


--Date Functions:
--PART_A:

--Write a query to display the current date & time. Label the column Today_Date.
select CURRENT_TIMESTAMP as Today_Date
select GETDATE() as Today_Date

--Write a query to find new date after 365 day with reference to today.
select DATEADD(YEAR, 1, CURRENT_TIMESTAMP) as Year_After

--Display the current date in a format that appears as may 5 1994 12:00AM.
select CONVERT(varchar(50),GETDATE(), 100)

--Display the current date in a format that appears as 03 Jan 1995.
select CONVERT(varchar(50),GETDATE(), 106)

--Display the current date in a format that appears as Jan 04, 96.
select CONVERT(varchar(50),GETDATE(), 107)

--Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
select DATEDIFF(MONTH, '31-Dec-08', '31-Mar-09') as Total_Months

--Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
select DATEDIFF(HOUR, '25-Jan-12 7:00', '26-Jan-12 10:30') as Total_Hours

--Write a query to extract Day, Month, Year from given date 12-May-16.
select datepart(Day, '12-May-16') as Days, datepart(Month, '12-May-16') as Months, datepart(Year, '12-May-16') as Years

--Write a query that adds 5 years to current date.
select DATEADD(YEAR, 5, GETDATE()) as Five_Year_After

--Write a query to subtract 2 months from current date.
select Dateadd(MONTH, -2, GETDATE()) as two_months_before

--Extract month from current date using datename () and datepart () function.
select DATENAME(month, GETDATE()), DATEPART(month, GETDATE())

--Write a query to find out last date of current month.
select EOMONTH(GETDATE())

--Calculate your age in years and months.
select DATEDIFF(YEAR, '2005-03-23', getdate()) as years, DATEDIFF(MONTH, '2005-03-23', getdate()) as months ,
DATEDIFF(DAY, '2005-03-23', getdate()) as Day


--Part � B:
--Perform following queries on EMP_MASTER table.

--1. Write a query to find new date after 365 days with reference to JoiningDate.

--2. Write a query to find out total number of months between JoiningDate and 31-Mar-09.


--3. Write a query to find out total number of years between JoiningDate and 14-Sep-10.


--Part � C: 
--Perform following queries on EMP_MASTER table.

--1. Write a query to extract Day, Month, Year from JoiningDate.

--2. Write a query that adds 5 years to JoiningDate.

--3. Write a query to subtract 2 months from JoiningDate.

--4. Extract month from JoiningDate using datename () and datepart () function.

--5. Select employee who joined between the 1st and 15th of any month in any year.

--6. Find employee whose JoiningDate is the last day of any month.


--7. List employee whose JoiningDate is during a leap year.