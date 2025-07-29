--Lab 4 
--Perform SQL queries for Aggerate function and group by (without having) 

--Part  A:

create table emp(
   eid int,
   ename varchar(50),
   department varchar(50),
   salary int,
   joiningdate date,
   city varchar(50),
   gender varchar(50)
)

insert into emp values
(101,'rahul','admin',56000,'1990-01-01','rajkot','male'),
(102,'hardik','it',18000,'1990-09-25','ahmedabad','male'),
(103,'bhavin','hr',25000,'1991-05-14','baroda','male'),
(104,'bhoomi','admin',39000,'1991-02-08','rajkot','female'),
(105,'rohit','it',17000,'1990-07-23','jamnagar','male'),
(106,'priya','it',9000,'1990-08-18','ahmedabad','female'),
(107,'bhoomi','hr',34000,'1991-12-25','rajkot','female')

select * from emp

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
select max(salary) as [max],min(salary) as [min] from emp

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
select sum(salary) as [total_sal] , avg(salary) as [average_sal] from emp 

--3. Find total number of employees of EMPLOYEE table.
select count(*) as [Total_Emp] from emp 

--4. Find highest salary from Rajkot city.
select max(salary) from emp where city='rajkot'

--5. Give maximum salary from IT department.
select max(salary) from emp where department='it'

--6. Count employee whose joining date is after 8-feb-91.
select count(eid) from emp where joiningdate > '1991-02-08'

--7. Display average salary of Admin department.
select avg(salary) from emp where department='admin'

--8. Display total salary of HR department.
select sum(salary) from emp where department='hr'

--9. Count total number of cities of employee without duplication.
select count(distinct city) from emp
select city,count(eid) from emp group by city

--10. Count unique departments.
select count(distinct department) from emp 

--11. Give minimum salary of employee who belongs to Ahmedabad.
select min(salary) from emp where city='ahmedabad'

--12. Find city wise highest salary.
select city,max(salary) as[highest salary] from emp group by city

--13. Find department wise lowest salary.
select department,min(salary) as [lowest salary] from emp group by department

--14. Display city with the total number of employees belonging to each city.
select city,count(eid) as [total employees] from emp group by city

--15. Give total salary of each department of EMP table.
select department,sum(salary) as [total salary] from emp group by department

--16. Give average salary of each department of EMP table without displaying the respective department name.
select sum(salary) as [total salary] from emp group by department

--17. Count the number of employees for each department in every city.
select city,count(eid) as [City Total employess] from emp group by city

--18. Calculate the total salary distributed to male and female employees.
select gender,sum(salary) as [total salary] from emp group by gender

--19. Give city wise maximum and minimum salary of female employees.
select city,max(salary) as [max], min(salary) as [min] from emp where gender='female' group by city 

--20. Calculate department, city, and gender wise average salary.
select department,city,gender,avg(salary) from emp group by department,city,gender

--Part � B:
--1. Count the number of employees living in Rajkot.
select count(eid) as [rajkot employees] from emp where city='rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
select (max(salary) - min(salary)) as [Difference] from emp 
 
--3. Display the total number of employees hired before 1st January, 1991.
select count(eid) from emp where joiningdate > '1991-01-01'

--Part � C:

--1. Count the number of employees living in Rajkot or Baroda.
select city,count(eid) as [total employees] from emp where city='rajkot' or city='baroda' group by city

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
select count(eid) from emp where joiningdate > '1991-01-01' and department='it'

--3. Find the Joining Date wise Total Salaries.
select joiningdate,sum(salary) as [total salaries] from emp group by joiningdate 

--4. Find the Maximum salary department & city wise in which city name starts with �R�.
select department,city,max(salary) as [max] from emp where city like 'r%' group by department,city 











