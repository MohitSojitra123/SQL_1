--LAB => 1
--Perform basic SQL commands like Create, Insert, Select


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

--5. Display loan details of all customers who belongs to �ANDHERI� branch from borrow table.
select * from borrow where bname='andheri'

--6. Give account no and amount of depositor, whose account no is equals to 106 from deposit table. 
select actno,amount from deposit where actno = 106

--7 Give name of borrowers having amount greater than 5000 from borrow table.
select cname  from borrow where amount > 5000

--8. Give name of customers who opened account after date '1-12-95' from deposit table. 
select cname from deposit where adate > '1995-12-01'

--9. Display name of customers whose account no is less than 105 from deposit table.
select cname from deposit where actno < 105

--10. Display name of customer who belongs to either �NAGPUR� or �DELHI� from customer table. (USE OR & IN)
select cname from customers where city='nagpur' or city='delhi'
select cname from customers where city in('nagpur','delhi') 

--11. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105
--from deposit table.
select cname from deposit where (amount > 4000 and actno < 105) 

--12. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table.
--(USE AND & BETWEEN)
select * from borrow where amount >= 3000 and amount <= 8000
select * from borrow where amount between 3000 and 8000 

--13. Find all depositors who do not belongs to �ANDHERI� branch from deposit table.
select * from deposit where  not bname='andhri'
select * from deposit where  bname!='andhri'

--14. Display Account No, Customer Name & Amount of such customers who belongs to �AJNI�, �KAROLBAGH� Or
--�M.G. ROAD� and Account No is less than 104 from deposit table.
select actno,cname,amount from deposit where (bname='ajni' or bname='karolbagh' or bname='M.G. ROAD') and actno < 104 
select actno,cname,amount from deposit where bname in('ajni','karolbagh','M.G. ROAD') and actno < 104

--15. Display all loan no, customer from borrow table does not belong to �VIRAR� or �AJNI� branch. (use NOT IN)
select * from borrow where  bname!='virar' and bname!='ajni'
select * from borrow where bname not in('virar','ajni')

--16. Display all the customer�s name other than �MINU� from deposit table (Use: NOT, <>, !=)
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

--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to �ANDHERI�
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





