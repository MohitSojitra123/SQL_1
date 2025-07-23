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


--7. Change name of table DEPOSIT to DEPOSIT_DETAIL



--Part => B

--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.

--3. Rename Column CNAME to CustomerName.

--4. Add Column country.

--Part => C

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).

--2. Add column department VARCHAR (20) Not Null.

--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).

--4. Change the data type DECIMAL to INT in CPI Column.

--5. Delete Column City from the student_detail table.

--6. Rename Column Enrollment_No to ENO.

--7. Change name of table student_detail to STUDENT_MASTER.

--Part => A 

-- 















