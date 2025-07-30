--Lab 7 
--Implement SQL Joins 


create table stu_info
(
  rno int,
  name varchar(50),
  branch varchar(50)
)

insert into stu_info values
(101,'Raju','CE'),
(102,'Amit','CE'),
(103,'Sanjay','ME'),
(104,'Neha','EC'),
(105,'Meera','EE'),
(106,'Mahesh','ME')

create table result
(
  rno int,
  spi decimal(3,1)
)

insert into result values
(101,8.8),
(102,9.2),
(103,7.6),
(104,8.2),
(105,7.0),
(107,8.9)


create table employee_master
(
   employeeno varchar(10),
   name varchar(50),
   managerNo varchar(10)
)

insert into employee_master values
('E01','Tarun',NULL),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Ahjana','E04')

--Part – A:

--1. Combine information from student and result table using cross join or Cartesian product.
select * from stu_info cross join result

--2. Perform inner join on Student and Result tables.
select * from stu_info s inner join result r on s.rno = r.rno 

--3. Perform the left outer join on Student and Result tables.
select * from stu_info s left join result r on s.rno = r.rno 

--4. Perform the right outer join on Student and Result tables.
select * from stu_info s right join result r on s.rno = r.rno

--5. Perform the full outer join on Student and Result tables.
select * from stu_info s full outer join result r on s.rno = r.rno

--6. Display Rno, Name, Branch and SPI of all students.
select s.rno,s.name,s.branch,r.spi from stu_info s left join result r on s.rno = r.rno

--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
select s.rno,s.name,s.branch,r.spi from stu_info s left join result r  on s.rno = r.rno where s.branch='CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
select s.rno,s.name,s.branch,r.spi from stu_info s left join result r on s.rno = r.rno where s.branch != 'EC'

--9. Display average result of each branch.
select s.branch, avg(r.spi) as avg_spi from stu_info s left join result r on s.rno = r.rno group by s.branch

--10. Display average result of CE and ME branch.
select s.branch , avg(r.spi) from stu_info s left join result r on s.rno = r.rno group by s.branch having s.branch in('CE','ME')

--11. Display Maximum and Minimum SPI of each branch.
select s.branch , max(r.spi) as [max] , min(r.spi) from stu_info s left join result r on s.rno = r.rno group by s.branch

--12. Display branch wise student’s count in descending order.
select s.branch,count(s.branch) from stu_info s group by s.branch order by count(s.branch) desc 
select s.branch,count(*) from stu_info s group by s.branch order by count(*) desc 

--Part – B:

--1. Display average result of each branch and sort them in ascending order by SPI.
select s.branch,avg(r.spi) from stu_info s left join result r on s.rno = r.rno group by s.branch order by avg(r.spi) asc

--2. Display highest SPI from each branch and sort them in descending order.
select s.branch , max(r.spi) from stu_info s left join result r on s.rno = r.rno group by s.branch order by max(r.spi) desc

--Part – C:


--1. Retrieve the names of employee along with their manager’s name from the Employee table.
select e1.name as Employee_Name,e2.name as Manager_Name from employee_master e1 inner join employee_master e2 on e1.employeeno = e2.managerNo 

--or

select
    E.Name AS Employee_Name,
    M.Name AS Manager_Name
from
    employee_master E
left join 
    employee_master M ON E.ManagerNo = M.EmployeeNo;












