-- Creating Tables
CREATE TABLE Department (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);

CREATE TABLE Student1 (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT FOREIGN KEY REFERENCES Department(DID)
);

CREATE TABLE Academic (
    Rno INT FOREIGN KEY REFERENCES Student1(Rno),
    SPI FLOAT,
    Bklog INT
);

-- Inserting Data
INSERT INTO Department VALUES (10, 'Computer'), (20, 'Electrical'), (30, 'Mechanical'), (40, 'Civil');
INSERT INTO Student1 VALUES (101, 'Raju', 'Rajkot', 10), (102, 'Amit', 'Ahmedabad', 20),
                           (103, 'Sanjay', 'Baroda', 40), (104, 'Neha', 'Rajkot', 20),
                           (105, 'Meera', 'Ahmedabad', 30), (106, 'Mahesh', 'Baroda', 10);
INSERT INTO Academic VALUES (101, 8.8, 0), (102, 9.2, 2), (103, 7.6, 1), 
                            (104, 8.2, 4), (105, 7.0, 2), (106, 8.9, 3);


--Part – A:
--1. Display details of students who are from computer department.
select * from Student1 where DID=(select DID from Department where did=10)

--2. Displays name of students whose SPI is more than 8.
select * from Student1  where Rno in(select rno from academic where spi>8)

--3. Display details of students of computer department who belongs to Rajkot city.
select*from Student1 where did=(select did from Department where did=10) and city='rajkot'

--4. Find total number of students of electrical department.
select count(*) from Student1 where did=(select did from Department where did=20)

--5. Display name of student who is having maximum SPI.
select name from Student1
where rno=(select rno from Academic where spi=(select max(spi) from Academic))

--6. Display details of students having more than 1 backlog.
select name from Student1
where Rno in (select rno from Academic where Bklog >1 )


--Part – B:


--1. Display name of students who are either from computer department or from mechanical department.
select*from Student1 where did in(select did from Department where did in(10,30))

--2. Display name of students who are in same department as 102 studying in.
select *from Student1 where did in(select did from Department where did=20)

--Part – C:


--1. Display name of students whose SPI is more than 9 and who is from electrical department.
select * from Student1  where Rno =(select rno from academic where spi>9) and did=20

--2. Display name of student who is having second highest SPI.
select *from Student1 
where rno=(select top 1 rno from Academic where SPI<(select max(spi) from Academic) order by rno desc)


--3. Display city names whose students SPI is 9.2
select name,city from Student1 where rno in(select rno from Academic where spi=9.2)

--4. Find the names of students who have more than the average number of backlogs across all students.
select*from Student1 where rno in(select rno from Academic where bklog>(select avg (Bklog) from Academic))

--5. Display the names of students who are in the same department as the student with the highest SPI.
select * from Student1 where did in(select did from Department where  DID=(select did from Student1 where Rno=(select Rno from Academic where spi=(select max(spi) from Academic))))



