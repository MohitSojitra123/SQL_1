--LAB => 2
--Perform SQL queries for Update, Alter, Rename, Delete, Truncate, Drop


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
--name is �MEHUL� and the loan number is even.
update borrow set amount=7000 , bname='central' where cname='mehul' and (loanno%2 = 0)

--5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in �VRCE�
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

--7. Update the Deposit table and set the date to NULL & Branch name to �ANDHERI whose Account No is 110.
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
sp_rename 'Deposit_detail.actno',�'ano'
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

--4. Delete all the accounts whose branch is �AJNI� or �POWAI�
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

--2. Delete all the Employees who belongs to �RAJKOT� city.
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
