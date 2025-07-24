--LAB => 1
--Part => A

create table deposit(
   actno int,
   cname varchar(50),
   bname varchar(50),
   amount decimal (8,2),
   adate datetime
)

insert into deposit values
(101,'anil','vrce',1000.00,'1995-03-01'),
(102,'sunil','ajni',5000.00,'1996-01-04'),
(103,'mehul','karolbagh',3500.00,'1995-11-17'),
(104,'madhuri','chandi',1200.00,'1995-12-17'),
(105,'pramod','m.g. road',3000.00,'1996-03-27'),
(106,'sandip','andheri',2000.00,'1996-03-31'),
(107,'shivani','virar',1000.00,'1995-09-05'),
(108,'kranti','nehru place',5000.00,'1995-07-02'),
(109,'minu','powal',7000.00,'1995-08-10')

create table branch
(
  bname varchar(50),
  city varchar(50)
)

insert into branch values
('vrce','nagpur'),
('ajni','nagpur'),
('karolbagh','delhi'),
('chandi','delhi'),
('dharampeth','nagpur'),
('m.g. road','banglore'),
('andheri','bombay'),
('virar','bombay'),
('nehru place','delhi'),
('powai','bombay')

create table customers
(
  cname varchar(50),
  city varchar(50)
)

insert into customers values 
('anil','calcutta'),
('sunil','delhi'),
('mehul','baroda'),
('mandar','patna'),
('madhuri','nagpur'),
('pramod','nagpur'),
('sandip','surat'),
('shivani','bombay'),
('kranti','bombay'),
('naren','bombay')


create table borrow
(
   loanno int,
   cname varchar(50),
   bname varchar(50),
   amount decimal(8,2)
)

insert into borrow values
(201,'anil','vrce',1000.00),
(206,'mehul','ajni',5000.00),
(311,'sunil','dharampeth',3000.00),
(321,'madhuri','andheri',2000.00),
(375,'pramod','virar',8000.00),
(481,'kranti','nehru place',3000.00)

--Select Operation
--Part - A :-

--1. Retrieve all data from table DEPOSIT. 
select * from deposit

--2. Retrieve all data from table BORROW
select * from borrow 

--3. Display Account No, Customer Name & Amount from DEPOSIT.
select actno,cname,amount from deposit

--4. Display Loan No, Amount from BORROW.
select loanno,amount from borrow

--5. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
select * from borrow where bname='andheri'

--6. Give account no and amount of depositor, whose account no is equals to 106 from deposit table. 
select actno,amount from deposit where actno = 106

--7 Give name of borrowers having amount greater than 5000 from borrow table.
select cname  from borrow where amount > 5000

--8. Give name of customers who opened account after date '1-12-95' from deposit table. 
select cname from deposit where adate > '1995-12-01'

--9. Display name of customers whose account no is less than 105 from deposit table.
select cname from deposit where actno < 105

--10. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (USE OR & IN)
select cname from customers where city='nagpur' or city='delhi'
select cname from customers where city in('nagpur','delhi') 

--11. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105
--from deposit table.
select cname from deposit where (amount > 4000 and actno < 105) 

--12. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table.
--(USE AND & BETWEEN)
select * from borrow where amount >= 3000 and amount <= 8000
select * from borrow where amount between 3000 and 8000 

--13. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
select * from deposit where  not bname='andhri'
select * from deposit where  bname!='andhri'

--14. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or
--‘M.G. ROAD’ and Account No is less than 104 from deposit table.
select actno,cname,amount from deposit where (bname='ajni' or bname='karolbagh' or bname='M.G. ROAD') and actno < 104 
select actno,cname,amount from deposit where bname in('ajni','karolbagh','M.G. ROAD') and actno < 104

--15. Display all loan no, customer from borrow table does not belong to ‘VIRAR’ or ‘AJNI’ branch. (use NOT IN)
select * from borrow where  bname!='virar' and bname!='ajni'
select * from borrow where bname not in('virar','ajni')

--16. Display all the customer’s name other than ‘MINU’ from deposit table (Use: NOT, <>, !=)
select * from customers where cname!='minu'
select * from customers where cname<>'minu'
select * from customers where not cname='minu'

--17. Display customer name from deposit table whose branch name is not available. (NULL)
select cname from deposit where bname is null

--18. Retrieve all unique branches using DISTINCT. (Use Branch Table)
select distinct bname from branch 

--19. Retrieve first 50% record from borrow table
select top 50 percent * from borrow 
select * from borrow

--20. Retrieve first five account number from deposit table.
select top 5 actno from deposit
select * from deposit

--Part => B

--1. Display all the details of first five customers from deposit table.
select top 5 * from deposit

--2. Display all the details of first three depositors from deposit table whose amount is greater than 1000.
select top 3 * from deposit where amount > 1000

--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’
--from borrow table
select top 5 loanno,cname from borrow where  bname!='ANDHERI'  

--4. Select all details with account numbers not in the range 105 to 109 in deposit table.
select * from deposit where actno not between 105 and 109

--5. Select all records from BORROW where the amount is greater than 1000 and less than or equal to 7000, and
--the loan number is between 250 and 600

select * from borrow where (amount > 1000 and amount <= 7000)  and (loanno between 250 and  600)

--Part => C

--1. Display all the detail of customer who deposited more than 5000 without using * from deposit table.
select * from deposit where amount > 5000

--2. Retrieve all unique customer names with city. (Use Customer table)
select distinct cname , city from customers

--3. Retrieve records from the BORROW table where the loan amount is greater than 3000 and the loan number
--is not a multiple of 3.
select * from borrow  where amount > 3000 and (loanno%3!=0)

--4. Retrieve records from the DEPOSIT table where amount is greater than 2000 also account number is
--between 100 and 110 and date is after '1-MAR-1995' or before '27-MAR-1996'
select * from deposit where (amount > 2000) and (actno between 100 and 110) and (adate > '1995-03-01' or adate < '1996-03-27')
select * from deposit where amount > 2000 and (actno BETWEEN 100 AND 110) and (adate BETWEEN '1995-03-01' and '1996-03-27')


--5. Retrieve all odd/even value loan number from Borrow table
select * from borrow where loanno % 2 != 0
select * from borrow where loanno % 2 = 0
select * from borrow 

--LAB => 2
--Part - A

--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)

update deposit set amount=5000.00 where amount = 3000.00

--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 
update borrow set bname='c.g.road' where cname='anil'

--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)
update deposit set actno=111 , amount=5000.00 where cname='sandip'

--4. Update amount of KRANTI to 7000. (Use Deposit Table)
update deposit set amount=7000 where cname='kranti'

--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
update branch set bname='andheri west' where bname='andheri'

--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table)
update deposit set bname='nehru palace' where cname='mehul'

--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table)
update deposit set amount = 5000.00 where actno between 103 and 107

--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table)
update deposit set adate='1995-04-01' where cname='anil';

--9. Update the amount of MINU to 10000. (Use Deposit Table)
update deposit set amount=10000.00 where cname='minu';

--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)
update deposit set amount=5000.00 , adate='1996-04-01' where cname='pramod'

--Part => B

--1. Give 10% Increment in Loan Amount. (Use Borrow Table)
update borrow set amount=(amount+(amount*10/100))

--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table)
update deposit set amount=(amount+(amount*20/100))

--3. Increase Amount by 1000 in all the account. (Use Deposit Table)
update deposit set amount=(amount+1000) 

--4. Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the customer
--name is ‘MEHUL’ and the loan number is even.
update borrow set amount=7000 , bname='central' where cname='mehul' and (loanno%2 = 0)

--5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in ‘VRCE’
--and with an account number less than 105.
update deposit set adate='2022-05-15' , amount=2500.00 where actno < 105 and bname='vrce'

--Part => C

--1. Update amount of loan no 321 to NULL. (Use Borrow Table)
select * from deposit
select * from borrow
select * from branch
update borrow set amount=null where loanno=321;

--2. Update branch name of KRANTI to NULL (Use Borrow Table)
update borrow set bname=null where cname='kranti' 

--3. Display the name of borrowers whose Loan number is NULL. (Use Borrow Table)
select * from borrow where loanno is null

--4. Display the Borrowers whose having branch. (Use Borrow Table)
select * from borrow where bname is not null

--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. (Use
--Borrow Table)
update borrow set amount=5000.00 , bname='vrce' , cname='darshan' where loanno=481

--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less than
--2000.
update deposit set adate='2021-01-01' where amount < 2000

--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 110.
update deposit set adate=null , bname='andheri'where actno=110 

--Part => A
select * from deposit

--1. Add two more columns City VARCHAR (20) and Pincode INT
alter table deposit add city varchar(20) , pincode int

--2. Add column state VARCHAR(20).
alter table deposit add state varchar(20)

--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
alter table deposit alter column cname varchar(35)

--4. Change the data type DECIMAL to INT in amount Column.
alter table deposit alter column amount int

--5. Delete Column City from the DEPOSIT table.
alter table deposit drop column city

--6. Rename Column ActNo to ANO.
sp_rename 'Deposit_detail.actno', 'ano'
select * from deposit_detail

--7. Change name of table DEPOSIT to DEPOSIT_DETAIL
sp_rename  'deposit','deposit_detail'

--Part => B

--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
sp_rename 'deposit_detail.adate' , 'Deposit_detail'

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
alter table deposit_detail  drop column deposit_detail  

--3. Rename Column CNAME to CustomerName.
sp_rename 'deposit_detail.cname' , 'customername'

--4. Add Column country.
alter table deposit_detail add country varchar(50)


--Part => C

create table student_detail(
 enrollment_No varchar(20),
 name varchar(25),
 cpi decimal(5,2),
 birthdate datetime
)

select * from student_detail

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
alter table student_detail add city varchar(20) not null , backlog int null

--2. Add column department VARCHAR (20) Not Null.
alter table student_detail add department varchar(20)

--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
alter table student_detail alter column name varchar(25)

--4. Change the data type DECIMAL to INT in CPI Column.
alter table student_detail alter column cpi int

--5. Delete Column City from the student_detail table.
alter table student_detail drop column city

--6. Rename Column Enrollment_No to ENO.
sp_rename 'student_detail.enrollment_no' , 'eno'

--7. Change name of table student_detail to STUDENT_MASTER.
sp_rename 'student_detail' , 'student_master'

--Part => A 

select * from deposit_detail

--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000. 
delete from deposit_detail where amount <=4000

--2. Delete all the accounts CHANDI BRANCH.
delete from deposit_detail where bname='chandi'

--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105
delete from deposit_detail where ano >102 and ano < 105

--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’
delete from deposit_detail where bname = 'ajni' or bname = 'powai' 

--5. Delete all the accounts whose account number is NULL.
delete from deposit_detail where ano is null

--6. Delete all the remaining records using Delete command.
delete from deposit_detail;

--7. Delete all the records of Deposit_Detail table. (Use Truncate)
truncate table deposit_detail;

--8. Remove Deposit_Detail table. (Use Drop)
drop table deposit_detail;

--Part => B
create table employee_master
(
 empno int,
 empname varchar(25),
 joinngdate datetime,
 salary decimal(8,2),
 city varchar(20)
)

insert into employee_master values
(101,'keyur','2002-01-05',12000.00,'rajkot'),
(102,'hardik','2004-02-15',14000.00,'ahmedabad'),
(103,'kajal','2006-03-14',15000.00,'baroda'),
(104,'bhoomi','2005-06-23',12500.00,'ahmedabad'),
(105,'harmit','2004-02-15',14000.00,'rajkot'),
(106,'mitesh','2001-09-25',5000.00,'jamnagar'),
(107,'meera',null,7000.00,'morbi'),
(108,'krishn','2003-02-06',10000.00,null)

--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000. 
delete employee_master where salary >= 14000

--2. Delete all the Employees who belongs to ‘RAJKOT’ city.
delete employee_master where city='rajkot'

--3. Delete all the Employees who joined after 1-1-2007.
delete employee_master where joinngdate>'2007-01-01'

--4. Delete the records of Employees whose joining date is null and Name is not null.
delete employee_master where joinngdate is null and empname is not null

--5. Delete the records of Employees whose salary is 50% of 20000.
delete employee_master where salary=((20000*50)/100)
delete employee_master where salary= 20000 * 0.5

--6. Delete the records of Employees whose City Name is not empty.
delete employee_master where city is not null

--7. Delete all the records of Employee_MASTER table. (Use Truncate)
truncate table employee_master

--8. Remove Employee_MASTER table. (Use Drop)
drop table employee_master

--Lab => 3
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
(1011,'keyur','patel','techonthenet.com','rajkot','A-303 ‘Vasant Kunj’, Rajkot'),
(1022,'hardik','shah','digminecraft.com','ahmedabad','“Ram Krupa”, Raiya Road'),
(1033,'kajal','trivedi','bigactivitiess.com','baroda','raj bhavan plot, near garden'),
(1044,'bhoomi','gajera','checkyourmath.com','ahmedabad','“Jig’s Home”, Narol'),
(1055,'harmit','mital','@me.darshan.com','rajkot','b-55,raj residency'),
(1066,'ashok','jani',null,'baroda','a502,club house buliding');

select * from student 

--1. Display the name of students whose name starts with ‘k’
select * from student where firstname like 'k%'

--2. Display the name of students whose name consists of five characters.
select * from student where firstname like '_____'


--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters 
select * from student where city like '_____%a'

--4. Display all the students whose last name ends with ‘tel’.
select * from student where lastname like '%tel'

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
select * from student where firstname like 'ha%' and firstname like '%t'

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
select * from student where firstname like 'k%_y%'
select * from student where firstname like 'k_y%'

--7. Display the name of students having no website and name consists of five characters.
select * from student where website is null and firstname like '_____'

--8. Display all the students whose last name consist of ‘jer’.
select * from student where lastname like '%jer%'

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
select * from student where city like 'r%' or city like 'b%'

--10. Display all the name students having websites.
select * from student where website is not null
select * from student where website like '%'

--11. Display all the students whose name starts from alphabet A to H
select * from student where firstname like '[a-h]%'

--12. Display all the students whose name’s second character is vowel.
select * from student where firstname like '_[aeiou]%'

--13. Display the name of students having no website and name consists of minimum five characters.
select * from student where website is null and firstname like '_____'

--14. Display all the students whose last name starts with ‘Pat’.
select * from student where lastname like 'pat%'

--15. Display all the students whose city name does not starts with ‘b’.
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

--1. Display all the students whose name’s second character is vowel and of and start with H.
select * from student where firstname  like 'h[aeiou]%' 

--2. Display all the students whose last name does not ends with ‘a’.
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


--Lab => 4
--Part => A


