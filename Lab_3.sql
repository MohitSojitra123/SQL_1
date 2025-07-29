--Lab => 3
--Perform SQL queries for Like operator


--Part => A

create table student
(
 stuid int,
 firstname varchar(25),
 lastname varchar(25),
 website varchar(50),
 city varchar(25),
 address varchar(100)
)

insert into student values
(1011,'keyur','patel','techonthenet.com','rajkot','A-303 �Vasant Kunj�, Rajkot'),
(1022,'hardik','shah','digminecraft.com','ahmedabad','�Ram Krupa�, Raiya Road'),
(1033,'kajal','trivedi','bigactivitiess.com','baroda','raj bhavan plot, near garden'),
(1044,'bhoomi','gajera','checkyourmath.com','ahmedabad','�Jig�s Home�, Narol'),
(1055,'harmit','mital','@me.darshan.com','rajkot','b-55,raj residency'),
(1066,'ashok','jani',null,'baroda','a502,club house buliding');

select * from student 

--1. Display the name of students whose name starts with �k�
select * from student where firstname like 'k%'

--2. Display the name of students whose name consists of five characters.
select * from student where firstname like '_____'


--3. Retrieve the first name & last name of students whose city name ends with �a� & contains six characters 
select * from student where city like '_____%a'

--4. Display all the students whose last name ends with �tel�.
select * from student where lastname like '%tel'

--5. Display all the students whose first name starts with �ha� & ends with�t�.
select * from student where firstname like 'ha%' and firstname like '%t'

--6. Display all the students whose first name starts with �k� and third character is �y�.
select * from student where firstname like 'k%_y%'
select * from student where firstname like 'k_y%'

--7. Display the name of students having no website and name consists of five characters.
select * from student where website is null and firstname like '_____'

--8. Display all the students whose last name consist of �jer�.
select * from student where lastname like '%jer%'

--9. Display all the students whose city name starts with either �r� or �b�.
select * from student where city like 'r%' or city like 'b%'

--10. Display all the name students having websites.
select * from student where website is not null
select * from student where website like '%'

--11. Display all the students whose name starts from alphabet A to H
select * from student where firstname like '[a-h]%'

--12. Display all the students whose name�s second character is vowel.
select * from student where firstname like '_[aeiou]%'

--13. Display the name of students having no website and name consists of minimum five characters.
select * from student where website is null and firstname like '_____'

--14. Display all the students whose last name starts with �Pat�.
select * from student where lastname like 'pat%'

--15. Display all the students whose city name does not starts with �b�.
select * from student where city not like 'b%'

--16. Display all the students whose student ID ends with digit.
select * from student where stuid like '%[0-9]'

--17. Display all the students whose address does not contain any digit
select * from student where address not like '%[0-9]%'

--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 'math'
--or 'science'. Ensure that their city does not start with 'B'.
select * from student where firstname like 'b%' and lastname like '%a' and (website like '%math%' or website like '%science%')  and city not like 'b'

--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their website
--should be either null or contain 'com'.
select * from student where lastname like '%shah%' and city like '%d' and (website is null or website like '%com%')

--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must have
--a website containing '.com'.
select * from student where firstname like '[aeiou][aeiou]%' and city like 'r%' and website like '%.com%'

--Part => B

--1. Display all the students whose name�s second character is vowel and of and start with H.
select * from student where firstname  like 'h[aeiou]%' 

--2. Display all the students whose last name does not ends with �a�.
select * from student where lastname not like '%a'

--3. Display all the students whose first name starts with consonant
select * from student where firstname not like '[aeiou]%'

--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their website
--contains 'tech' or they live in a city starting with 'R'.
select * from student where firstname like 'k%' and lastname like '%tel' and (website like '%tech%' or city like 'r%')

--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They must
--have a website that ends with '.com' and their first name should not start with 'A'
select * from student where address like '%-%' and (city like 'r%' or city like 'b%') and website like '%.com' and firstname not like 'a%'

--Part => C

--1. Display all the students whose address contains single quote or double quote.
select * from student where address like '%''%' or address like '%"%';

--2. Find students whose city does not contain the letter 'S' and their address contains either single or double
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'
select * from student where city not like '%s%' and (address like '%''%' or address like '%"%') and lastname like 'p%' and website like '%on%'; 

--Like Operator Extra Query...

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Designation VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Employees (EmpID, FirstName, LastName, Email, Designation, Department) VALUES
(1, 'Aamir',    'Ross',     'aamir.ross@gmail.com',        'Sales Manager',         'Sales'),
(2, 'Anita',    'Sasson',   'anita123@outlook.com',        'HR Executive',          'HR'),
(3, 'Edwin',    'Gates',    'edwin.gates@yahoo.com',       'General Manager',       'Management'),
(4, 'Eva',      'Silva',    'eva.silva@yahoo.edu',         'IT-in-Charge',          'IT1'),
(5, 'Otto',     'Smith',    'otto.smith@abc.com',          'Support Staff',         'Support'),
(6, 'Aaron',    'Johnson',  'aaron.johnson@gmail.com',     'Finance Manager',       'Finance'),
(7, 'Eve',      'Essess',   'eve.essess@college.edu',      'Project-in-Charge',     'Research'),
(8, 'Steve',    'Mason',    'info42@yahoo.com',            'Operations Manager',    'Operations'),
(9, 'Anna',     'Hannah',   'anna.hannah@gmail.com',       'HR-in-Charge',          'HR2'),
(10,'John',     'Nash',     'john3@gmail.com',             'Technical Lead',        'Development'),
(11,'Jean',     'Clark',    'jean.clark@yahoo.com',        'Legal Advisor',         'Legal1'),
(12,'Aeon',     'Xenon',    'aeonxenon@edu.edu',           'CEO',                   'Admin'),
(13,'Ellen',    'Briggs',   'ellen.briggs@edu.com',        'Branch Manager',        'Marketing1'),
(14,'Jenna',    'Marks',    'jenna98@abc.net',             'Sales Executive',       'Sales2'),
(15,'Deed',     'Zzz',      'deed@domain.com',             'Guard-in-Charge',       'Security'),
(16,'Abba',     'Civic',    'abba.civic@gmail.com',        'Helper',                'Utility'),
(17,'Geoff',    'Hall',     'geoff.hall@gmail.com',        'Support Staff',         'Support3'),
(18,'Jeevan',   'Morris',   'jeevan.morris@yahoo.com',     'Deputy Manager',        'IT3'),
(19,'Reer',     'Rrrr',     'reer.rrr@xyz.edu',            'Chief-in-Charge',       'Strategy'),
(20,'Sally',    'Glass',    'info.sally@yahoo.com',        'Team Lead',             'Team1');

select * from Employees


-- 1 Employees whose first name starts with �A� and is 5 characters long
select * from Employees where FirstName like 'a____'

-- 2 Employees whose last name contains two consecutive 's'
select * from Employees where LastName like '%ss%'

-- 3 Employees whose email ends with 'gmail.com'
select * from Employees where email like '%gmail.com'

-- 4 Employees whose name starts and ends with a vowel
select * from Employees where FirstName like '[aeiou]%%[aeiou]'

-- 5 Employees whose email contains numbers
select * from Employees where Email like '%[0-9]%' 

-- 6 Employees whose name has 'a' as the second character
select * from Employees where FirstName like '_a%'

-- 7 Employees whose first name contains both 'a' and 'e'
select * from Employees where FirstName like '%a%' and FirstName like '%e%'

-- 8 Employees whose designation contains 'Manager' anywhere
select * from Employees where Designation like '%manager%'

-- 9 Employees whose first name ends with �son�
select * from Employees where FirstName like '%son'

-- 10 Employees whose name contains 3 or more vowels
select * from Employees where FirstName like '%[aeiou][aeiou][aeiou]%'

-- 11 Emails that start with any 3 letters followed by a number
select * from Employees where email like '%[a-z][a-z][a-z][0-9]%'

-- 12 Last name containing exactly 2 'a' characters
select * from Employees where LastName like '%a%a%'

-- 13 First name where 2nd and 4th characters are vowels
select * from Employees where FirstName like '_[aeiou]_[aeiou]%'

-- 14 Names that do not contain any vowels
select * from Employees where FirstName not like '%[aeiou]%'

-- 15 First name starts with �J� and has �n� somewhere after 3rd character
select * from Employees where FirstName like 'j_%n%'

-- 16 First name contains at least one uppercase letter
select * from Employees where FirstName like '%[a-z]%'

-- 17 Designation ending with �-in-Charge�
select * from Employees where Designation like '%-in-charge'

-- 18 First name has same letter at start and end
select * from Employees where RIGHT(FirstName,1) = LEFT(FirstName,1)

-- 19 Emails that contain '@' and end with '.edu'
select * from Employees where Email like '%@%' and Email like '%.edu'

-- 20 Department name includes digits
select * from Employees where Department like '%[0-9]%'

-- 21 First name contains two sets of double letters


-- 22 Emails that start with �info� and domain is yahoo
select * from Employees where Email like 'info%' and Email like '%yahoo%'

-- 23 Names that have a dash in them
select * from Employees where FirstName like '%-%'

-- 24 Emails that contain �.� before @
select * from Employees where Email like '%.%@%' 

-- 25 Employees whose name is palindrome (e.g. �Anna�)
select * from Employees where FirstName = REVERSE(FirstName)

