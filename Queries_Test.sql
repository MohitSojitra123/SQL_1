create table students
(
  studentid int ,
  name varchar(50),
  age int,
  city varchar(50)
)

create table courses
(
   courseid int,
   coursename varchar(50),
   duration int
)

create table enrollments
(
   enrollmentid int ,
   studentid int,
   courseid int
)

insert into students values(1,'anil','21','mumbai');

insert into courses values
(101,'data science',6),
(102,'web development',4)

insert into enrollments values(1001,1,101)

--select all records from students...
select * from students

--select names and cities of students above age 20
select name,city from students where age > 20

--select names of students whose age is more than 20 and less than 30 using between
select name from students where age between 20 and 30

--select names and cities of students from rajkot and baroda city
select name , city from students where city in('rajkot','baroda')

--select names of student whose age is more than 20 and less than 30 and city is either baroda or surat
select name from students where (age > 20 and age < 30) and city in('baroda','surat')

--select names of students whose age is more than 20 and less than 30 and city is either baroda or surat and studentid is between 101 and 110
select name from students where (age > 20 and age < 30) and city in('baroda','surat') and studentid between 101 and 110

--select all students in alphabetical order.
select name from students order by name asc

--update city of student with id = 1 to pune
update students set city='pune' where studentid=1;


--Increase Duration of all courses by 1 month.
update courses set duration=(duration+1) 
select * from courses

--change course name from 'web development' to 'full stack web'.
update courses set coursename='full stack web' where  coursename='web development'

--delete student with id = 1
delete from students where studentid=1

--delete courses where duration is less than 5 months
delete from courses where duration < 5

--delete enrollment record with id=1001
delete from enrollments where enrollmentid=1001

--remove all data from students table using truncate
truncate table students

--remove all data from course table using delete
delete from courses

--drop the table enrollments
drop table enrollments

--drop the courses table
drop table courses

--add a new column gender to student
alter table students add gender varchar(50)

--modify data type of age to int
alter table students alter column age int

--rename column city to location
sp_rename 'students.city' 'location'

--drop the column gender from students
alter table students drop column gender