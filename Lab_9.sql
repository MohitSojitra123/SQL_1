CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

INSERT INTO Author (AuthorID, AuthorName, Country) VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'Arundhati Roy', 'India'),
(3, 'Amish Tripathi', 'India'),
(4, 'Ruskin Bond', 'India'),
(5, 'Jhumpa Lahiri', 'India'),
(6, 'Paulo Coelho', 'Brazil'),
(7, 'Sudha Murty', 'India');

CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL
);

INSERT INTO Publisher (PublisherID, PublisherName, City) VALUES
(1, 'Rupa Publications', 'New Delhi'),
(2, 'Penguin India', 'Gurugram'),
(3, 'HarperCollins India', 'Noida'),
(4, 'Aleph Book Company', 'New Delhi');

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
	AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    PublicationYear INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

INSERT INTO Book (BookID, Title, AuthorID, PublisherID, Price, PublicationYear) VALUES
(101, 'Five Point Someone', 1, 1, 250.00, 2004),
(102, 'The God of Small Things', 2, 2, 350.00, 1997),
(103, 'Immortals of Meluha', 3, 3, 300.00, 2010),
(104, 'The Blue Umbrella', 4, 1, 180.00, 1980),
(105, 'The Lowland', 5, 2, 400.00, 2013),
(106, 'Revolution 2020', 1, 1, 275.00, 2011),
(107, 'Sita: Warrior of Mithila', 3, 3, 320.00, 2017),
(108, 'The Room on the Roof', 4, 4, 200.00, 1956);


--Part � A:
--1. List all books with their authors.
select b.Title,a.AuthorName from Author a inner join Book b on a.AuthorID=b.AuthorID

--2. List all books with their publishers. 
select b.Title,p.PublisherName from book b inner join Publisher p on p.PublisherID = b.PublisherID

--3. List all books with their authors and publishers. 
select b.Title,a.AuthorName,p.PublisherName from Book b inner join  Author a on b.AuthorID = a.AuthorID inner join Publisher p on p.PublisherID = b.PublisherID 

--4. List all books published after 2010 with their authors and publisher and price. 
select b.Title,a.AuthorName,p.PublisherName,b.Price from Book b inner join  Author a on b.AuthorID = a.AuthorID inner join Publisher p on p.PublisherID = b.PublisherID  where b.PublicationYear > 2010 

--5. List all authors and the number of books they have written. 
select a.AuthorName,count(b.BookID) from Book b inner join Author a on b.AuthorID = a.AuthorID group by a.AuthorName

--6. List all publishers and the total price of books they have published. 
select p.PublisherName,p.PublisherID,sum(b.Price) from Publisher p inner join Book b on p.PublisherID=b.PublisherID group by p.PublisherID,PublisherName

--7. List authors who have not written any books. 
select a.AuthorName from Author a left join book b on  a.AuthorID = b.AuthorID where b.BookID is null

--8. Display total number of Books and Average Price of every Author. 
select a.AuthorName,COUNT(b.BookID),sum(b.Price) from book b inner join Author a on b.AuthorID = a.AuthorID group by a.AuthorName

--9. Lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 
SELECT p.PublisherName,COUNT(b.BookID) AS TotalBooks
FROM Publisher p JOIN Book b ON p.PublisherID = b.PublisherID
GROUP BY p.PublisherName ORDER BY TotalBooks DESC;



--10. Display number of books published each year. 
select b.Title,b.PublicationYear from book b inner join Publisher p on b.PublisherID=p.PublisherID group by b.Title,b.PublicationYear

--Part � B: 
--1. List the publishers whose total book prices exceed 500, ordered by the total price. 
SELECT p.PublisherName,SUM(b.Price) AS TotalPrice FROM Publisher p JOIN  Book b ON p.PublisherID = b.PublisherID GROUP BY 
p.PublisherName HAVING SUM(b.Price) > 500 ORDER BY TotalPrice DESC;

--2. List most expensive book for each author, sort it with the highest price. 
SELECT a.AuthorName,b.Title,b.Price FROM Author a JOIN Book b ON a.AuthorID = b.AuthorID
WHERE b.Price = (SELECT MAX(b2.Price) FROM Book b2 WHERE b2.AuthorID = a.AuthorID)
ORDER BY b.Price DESC;

--Part � C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 

-- 1. Country Table
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL UNIQUE
);

-- 2. State Table
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT NOT NULL,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

-- 3. District Table
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT NOT NULL,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

-- 4. City_info Table
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT NOT NULL,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

-- 5. Dept_info Table
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL UNIQUE
);

-- 6. Emp_info Table
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT NOT NULL,
    Cid INT NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);


--2. Insert 5 records in each table.
-- 1. Country (Cid, Cname)
INSERT INTO Country VALUES 
(1, 'India'),
(2, 'USA'),
(3, 'Brazil'),
(4, 'Australia'),
(5, 'Canada');

-- 2. State (Sid, Sname, Cid)
INSERT INTO State VALUES
(101, 'Gujarat', 1),
(102, 'Maharashtra', 1),
(103, 'California', 2),
(104, 'New South Wales', 4),
(105, 'Ontario', 5);

-- 3. District (Did, Dname, Sid)
INSERT INTO District VALUES
(201, 'Ahmedabad', 101),
(202, 'Mumbai', 102),
(203, 'Los Angeles', 103),
(204, 'Sydney', 104),
(205, 'Toronto', 105);

-- 4. City_info (Cid, Cname, Did)
INSERT INTO City_info VALUES
(301, 'Ahmedabad City', 201),
(302, 'Mumbai City', 202),
(303, 'LA Downtown', 203),
(304, 'Sydney City', 204),
(305, 'Toronto City', 205);

-- 5. Dept_info (Did, Dname)
INSERT INTO Dept_info VALUES
(401, 'IT'),
(402, 'HR'),
(403, 'Finance'),
(404, 'Marketing'),
(405, 'Operations');

-- 6. Emp_info (Eid, Ename, Did, Cid, Salary, Experience)
INSERT INTO Emp_info VALUES
(501, 'Mohit Patel', 401, 301, 50000.00, 5),
(502, 'Amit Sharma', 402, 302, 45000.00, 3),
(503, 'John Smith', 403, 303, 70000.00, 8),
(504, 'Sarah Lee', 404, 304, 65000.00, 6),
(505, 'David Miller', 405, 305, 60000.00, 4);


--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees

SELECT 
    e.Ename AS EmployeeName,
    dpt.Dname AS DepartmentName,
    e.Salary,
    e.Experience,
    c.Cname AS City,
    dist.Dname AS District,
    st.Sname AS State,
    ctr.Cname AS Country
FROM Emp_info e JOIN Dept_info dpt ON e.Did = dpt.Did JOIN City_info c ON e.Cid = c.Cid
JOIN District dist ON c.Did = dist.Did JOIN State st ON dist.Sid = st.Sid JOIN  Country ctr ON st.Cid = ctr.Cid;
