--Lab 5
--Perform SQL queries for Group by with having and Order by

--Part A

create table sales_data
(
    region varchar(50),
    product varchar(50),
    sales_amount int,
    year int
)

insert into sales_data values
('North America','Watch',1500,2023),
('Europe','Mobile',1200,2023),
('Asia','Watch',1800,2023),
('North America','TV',900,2024),
('Europe','Watch',2000,2024),
('Asia','Mobile',1000,2024),
('North America','Mobile',1600,2023),
('Europe','TV',1500,2023),
('Asia','TV',1100,2024),
('North America','Watch',1700,2024)

select * from sales_data

--Part – A:

--1. Display Total Sales Amount by Region.
select region,sum(sales_amount) from sales_data group by region

--2. Display Average Sales Amount by Product
select product,avg(sales_amount) from sales_data group by product

--3. Display Maximum Sales Amount by Year
select year , max(sales_amount) from sales_data group by year

--4. Display Minimum Sales Amount by Region and Year
select region,year,min(sales_amount) from sales_data group by region,year

--5. Count of Products Sold by Region
select region,count(*) from sales_data group by region

--6. Display Sales Amount by Year and Product
--select sales_amount,year,product from sales_data group by sales_amount,year,product

--7. Display Regions with Total Sales Greater Than 5000
select region,sum(sales_amount) from sales_data group by region having sum(sales_amount) > 5000

--8. Display Products with Average Sales Less Than 10000
select product,avg(sales_amount) from sales_data group by product having avg(sales_amount) < 10000

--9. Display Years with Maximum Sales Exceeding 500
select year,max(sales_amount) from sales_data group by year having max(sales_amount) > 500 

--10. Display Regions with at Least 3 Distinct Produc   ts Sold.
select region,count(distinct product) from sales_data group by region having count(distinct product) >= 3

--11. Display Years with Minimum Sales Less Than 1000
select year,min(sales_amount) from sales_data group by year having min(sales_amount) < 1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
select region,sum(sales_amount) from sales_data where year='2023' group by region order by sum(sales_amount) asc

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
select region,year,sum(sales_amount) from sales_data where product='mobile'group by region,year 

--14. Find the Product with the Highest Sales Across All Regions in 2023.
select product,sum(sales_amount) from sales_data where year='2023' group by product

--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.
select  region,sum(sales_amount) from sales_data where product='tv' and year='2023' group by region having sum(sales_amount) > 1000

--Part – B:

--1. Display Count of Orders by Year and Region, Sorted by Year and Region
select year,region,count(*) from sales_data group by year,region order by year asc, region asc

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
select region,max(sales_amount) from sales_data group by region having max(sales_amount) > 1000 order by region asc

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending
select year,sum(sales_amount) from sales_data group by year  having sum(sales_amount) < 10000 order by year desc

--4. Display Top 3 Regions by Total Sales Amount in Year 2024
select top 3 region,sum(sales_amount) from sales_data where year='2024'  group by region order by sum(sales_amount) desc

--5. Find the Year with the Lowest Total Sales Across All Regions.
select top 1 year,sum(sales_amount) from sales_data group by year order by sum(sales_amount) asc

select * from sales_data

--Part – C:

--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
select product,avg(sales_amount) from sales_data  group by product having avg(sales_amount) between 1000 and 2000 order by product asc

--2. Display Years with More Than 1 Orders from Each Region
select  year,region,count(*) as order_count from sales_data group by year,region having count(*) > 1

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
select region,avg(sales_amount) from sales_data where year='2023' group by region having avg(sales_amount) > 1500 order by avg(sales_amount) desc

--4. Find out region wise duplicate product.
select region,product,count(*) from sales_data group by region,product having count(*) > 1

--5. Find out year wise duplicate product.
select year,product,count(*) from sales_data group by year,product having count(*) > 1  


















