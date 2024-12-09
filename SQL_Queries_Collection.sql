SELECT * FROM customer.consumer_immersion;
SELECT Gender, Work_Mode From customer.consumer_immersion;
SELECT DISTINCT City From customer.consumer_immersion;
SELECT COUNT(DISTINCT City) FROM customer.consumer_immersion;
SELECT * FROM customer.consumer_immersion WHERE `Consumer ID` = 1;
SELECT * FROM customer.consumer_immersion WHERE `Consumer ID` > 33;
SELECT * FROM customer.consumer_immersion ORDER BY `Consumer ID`;
SELECT * FROM customer.consumer_immersion ORDER BY `Consumer ID` DESC;
SELECT * FROM customer.consumer_immersion ORDER BY City;
SELECT * FROM customer.consumer_immersion ORDER BY City DESC;
SELECT * FROM customer.consumer_immersion ORDER BY City, `No. of Children`;
SELECT * FROM customer.consumer_immersion ORDER BY City DESC, `No. of Children` ASC;
SELECT * FROM customer.consumer_immersion WHERE Gender = 'Male' AND `Consumer ID` < 10;
SELECT * FROM customer.consumer_immersion WHERE Gender = 'Male' AND `Consumer ID` < 10 AND Occupation = 'Student';
Select * From customer.consumer_immersion WHERE Gender = 'Male' AND (Occupation = 'Business' OR Occupation = 'Corporate');
Select COUNT(*) From customer.consumer_immersion WHERE Gender = 'Male' AND (Occupation = 'Business' OR Occupation = 'Corporate');
SELECT * FROM customer.consumer_immersion WHERE Occupation = 'Business' AND (City = 'Patiala' or City = 'Ludhiana' or City = 'Jalandar');
SELECT Count(*) FROM customer.consumer_immersion WHERE NOT City = 'Noida';
Select * FROM customer.consumer_immersion WHERE `Consumer ID` NOT BETWEEN 10 AND 35;
SELECT * FROM customer.consumer_immersion WHERE City NOT IN ('Noida', 'Gurugram', 'Delhi');
Select * FROM customer.consumer_immersion WHERE NOT `Consumer ID` > 30;
UPDATE customer.consumer_immersion SET City = 'Noida' WHERE `Consumer ID` = 1;
DELETE FROM customer.consumer_immersion WHERE `Consumer ID` = 1;
DROP TABLE customer.person;
SELECT * FROM customer.consumer_immersion WHERE `Consumer ID` < 33 LIMIT 5;
SELECT * FROM customer.consumer_immersion LIMIT 5;
Select Max(`No. of Children`) FROM customer.consumer_immersion;
Select Max(`Family Members`) AS 'Max Family' FROM customer.consumer_immersion;
Select City, Max(`Family Members`) AS 'Max Family' FROM customer.consumer_immersion GROUP BY City;
Select Count(*) FROM customer.consumer_immersion;
Select 	Gender, Count(*) FROM customer.consumer_immersion GROUP BY Gender;
Select Count(Distinct Occupation) FROM customer.consumer_immersion;
SELECT `Price of SmartPhone`,Count(`Price of Smartphone`) AS 'No. of Customers' FROM customer.consumer_immersion group by `Price of SmartPhone`;
SELECT SUM(`Consumer ID`) AS Sum FROM customer.consumer_immersion;
SELECT Age, AVG(`No. of Children`) FROM customer.consumer_immersion GROUP BY Age;
SELECT AVG(`No. of Children`) FROM customer.consumer_immersion;
SELECT Age,AVG(`No. of Children`) FROM customer.consumer_immersion WHERE `No. of Children` > (SELECT AVG(`No. of Children`) FROM customer.consumer_immersion) Group by Age;
SELECT * FROM customer.consumer_immersion WHERE City LIKE 'L%';
SELECT * FROM customer.consumer_immersion WHERE City LIKE '_udhi___';
SELECT * FROM customer.consumer_immersion WHERE City LIKE '%i%';
SELECT * FROM customer.consumer_immersion WHERE City LIKE 'L%' or City LIKE 'N%';
SELECT * FROM customer.consumer_immersion WHERE City LIKE 'P%___';
SELECT * FROM customer.consumer_immersion WHERE City REGEXP '^[LND]';
SELECT * FROM customer.consumer_immersion WHERE City REGEXP '^[a-n]';
SELECT * FROM customer.consumer_immersion WHERE City IN ('Noida', 'Delhi', 'Gurugram');
SELECT * FROM customer.consumer_immersion WHERE City NOT IN ('Noida', 'Delhi', 'Gurugram');
SELECT * FROM customer.consumer_immersion WHERE `Consumer ID` BETWEEN 10 AND 20;
SELECT * FROM customer.consumer_immersion WHERE `Consumer ID` NOT BETWEEN 10 AND 20;
SELECT * FROM customer.consumer_immersion WHERE `Consumer ID` BETWEEN 10 AND 20 AND `No. of Children` in (2,3,4,5);
SELECT `Consumer ID` AS ID, Gender AS Sex FROM customer.consumer_immersion;
SELECT Count(`Consumer ID`) AS ID, Gender AS Sex FROM customer.consumer_immersion GROUP BY Sex;
SELECT `Consumer ID` AS ID, Gender AS `Sex in the City` FROM customer.consumer_immersion;
SELECT CONCAT(Education, ', ', Occupation) AS eduopp FROM customer.consumer_immersion;
Drop table customer.customer_info;
Drop table customer.student;
Use customer;
Create Table Customers (CustomerID int, CustomerName varchar(255), ContactName varchar(255), Address varchar(255), City varchar(255), PostalCode int, Country varchar(255));
Insert into customer.customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) Values ('1', 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209','Germany');
Insert into customer.customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) Values ('2', 'Ana Trujillo Emparedados y helados','Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico');
Insert into customer.customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) Values ('3', 'Antonio Moreno Taquería','Antonio Moreno', 'Mataderos 2312','México D.F.',	'05023','Mexico');

Create Table Orders (OrderID int NOT NULL UNIQUE, CustomerID int, EmployeeID int, OrderDate Date, ShipperID int);
Insert into customer.Orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) Values ('10308','2','7','1996-09-18','3');
Insert into customer.Orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) Values ('10309','37','3','1996-09-19','1');
Insert into customer.Orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) Values ('10310','77','8','1996-09-20','2');

SELECT Orders.OrderID, Customers.CustomerID, Customers.CustomerName, Orders.OrderDate FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
SELECT * FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
SELECT Customers.*, Orders.* FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID UNION SELECT Customers.*, Orders.* FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT A.CustomerID, A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City FROM Customers A, Customers B WHERE A.CustomerID <> B.CustomerID AND A.City = B.City ORDER BY A.City;
SELECT CustomerID FROM Customers UNION SELECT CustomerID FROM Orders ORDER BY CustomerID;
SELECT CustomerID FROM Customers WHERE City = 'Berlin' UNION SELECT CustomerID FROM Orders WHERE EmployeeID = '8' ORDER BY CustomerID;
Select * from Customers;
Select * from Orders;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) < 5 ORDER BY COUNT(CustomerID) DESC;

CREATE TABLE consumer_data AS SELECT * FROM customer.consumer_immersion;
Select * from consumer_data;

CREATE DATABASE Aryan;
SHOW DATABASES;
DROP DATABASE Aryan;
truncate table Orders;
Alter table Customers DROP Column Address;
ALTER TABLE Orders RENAME COLUMN OrderDate to Order_Date;
ALTER TABLE Orders MODIFY COLUMN Order_Date date;
ALTER TABLE Orders ADD DOB date;
ALTER TABLE Orders MODIFY COLUMN DOB year;

Create Table Ordersss (OrderID int NOT NULL UNIQUE PRIMARY KEY, CustomerID int, EmployeeID int, OrderDate Date, ShipperID int);
DROP TABLE Ordersss;
ALTER TABLE Ordersss DROP PRIMARY KEY;
USE customer;
ALTER TABLE Ordersss ADD CONSTRAINT PK PRIMARY KEY (OrderID, CustomerID);
ALTER TABLE Ordersss Drop CONSTRAINT PK;

SELECT * FROM Customers;
SELECT * FROM Orders;
ALTER TABLE Customers ADD PRIMARY KEY (CustomerID);
ALTER TABLE Orders ADD FOREIGN KEY (CustomerID) references Customers(CustomerID);
ALTER TABLE Customers ALTER Country SET DEFAULT 'India';

SELECT * FROM Orders WHERE OrderDate='1996-09-18'




-- Q1 (subquery)


Create TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

delete from events;

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

DELETE FROM EVENTS WHERE ID=12;
Select * From events;

select GOLD AS PLAYER_NAME,COUNT(*) AS NO_OF_MEDALS
FROM events
WHERE GOLD NOT IN (SELECT SILVER FROM EVENTS UNION ALL SELECT BRONZE FROM EVENTS)
GROUP BY GOLD;

-- OR (group by having cte)

with cte as (
select gold as player_name, 'gold' as medal_type from events
union all select silver, 'silver' as medal_type from events
union all select bronze, 'bronze' as medal_type from events)
select player_name,count(*) as no_of_gold_medals
from cte
group by player_name
having count(distinct medal_type)=1 and max(medal_type)='gold'




-- Q2

/*
create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
*/

/* create table holidays (
holiday_date date,
reason varchar(100)
);
delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');
*/

select *
,datediff(resolved_date,create_date) as actual_days
,datediff(resolved_date,create_date) - 2*Floor(datediff(resolved_date,create_date) / 7) - no_of_holidays
as business_days
from 
(select ticket_id,create_date,resolved_date,count(holiday_date) as no_of_holidays
from tickets
left join holidays on holiday_date between create_date and resolved_date
group by ticket_id,create_date,resolved_date) A



-- Q3 (write a sql to find the total number of people present inside the hospital-

use customer;

create table hospital ( emp_id int
, action varchar(10)
, time datetime);

insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');

select * from hospital;

with cte as (
select emp_id
, max(case when action='in' then time end) as intime
, max(case when action='out' then time end) as outtime
from hospital
group by emp_id)
select * from cte
where intime > outtime or outtime is null

-- or

select * from hospital;

with intime as
(select emp_id, max(time) as latest_in_time
from hospital
where action= 'in'
group by emp_id
),
outtime as
(select emp_id, max(time) as latest_out_time
from hospital
where action = 'out'
group by emp_id
)
select * from
intime
join outtime on intime.emp_id=outtime.emp_id;
where latest_in_time > latest_out_time OR latest_out_time is null;

-- Or

with latest_time as
(select emp_id, max(time) as max_latest_time from hospital group by emp_id)
, latest_in_time as (select emp_id, max(time) as max_in_time from hospital
where action='in'
group by emp_id)
select *
from latest_time lt
inner join latest_in_time lit on lt.emp_id=lit.emp_id and max_latest_time=max_in_time



-- Q Joins

-- total 9683, return 3101, non return 6582
select * from superstore_orders;
select * from returnss;
select 9683 - 800;

select city,sum(Sales) from superstore_orders ou inner join returns ru on ou.Order_ID=ru.Order_ID
group by city;

select ou.order_id,ru.order_id,ou.sales from superstore_orders ou left join returnss ru on ou.Order_ID=ru.Order_ID;
select ou.order_id,ru.order_id,ou.sales from superstore_orders ou left join returnss ru on ou.Order_ID=ru.Order_ID where ru.Order_ID IS NULL;

insert into returnss values('Yes','Dummy');
select ou.order_id,ru.order_id,ou.sales from superstore_orders ou right join returnss ru on ou.Order_ID=ru.Order_ID;

-- select ou.order_id,ru.order_id,ou.sales from orders_unique ou full outer join returnss ru on ou.Order_ID=ru.Order_ID;

-- select ou.order_id,ru.order_id,ou.sales from orders_unique ou full outer join returnss ru on ou.Order_ID=ru.Order_ID;

select coalesce(ou.order_id,ru.order_id) as order_id final, ou.order_id,ru.order_id,ou.sales
from superstore_orders ou
Full Outer join returns 






-- Q 

Select tweet_id
from Tweets
Where length(content) > 15






-- Q

create table t1 (id1 varchar(1000));
create table t2 (id2 varchar(1000));
insert into t1 values(null);
insert into t2 values(null);
select * from t1;
select * from t2;

select * from t1
inner join t2 on t1.id1 = t2.id2;

select * from t1
left join t2 on t1.id1=t2.id2;

select * from t1
right join t2 on t1.id1=t2.id2;

SELECT *
FROM t1
LEFT JOIN t2 ON t1.id1 = t2.id2

UNION ALL

SELECT *
FROM t1
RIGHT JOIN t2 ON t1.id1 = t2.id2;



-- Q

Select customer_id,count(Visits.visit_id) as count_no_trans
from  Visits left join Transactions on Transactions.visit_id = Visits.visit_id
where transaction_id is null
group by customer_id



-- Q

SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;



-- Q

select a1.machine_id
, ROUND(AVG(a2.timestamp - a1.timestamp),3) as processing_time
from Activity a1
join Activity a2
on a1.process_id=a2.process_id
and a1.machine_id=a2.machine_id
and a1.timestamp<a2.timestamp
group by a1.machine_id;



-- Q

Select name,bonus
from Employee
left join Bonus on Employee.empId = Bonus.empId
where bonus <1000 or bonus is null




-- Q 

select s.student_id, s.student_name, sub.subject_name , count(e.student_id) as attended_exams 
from students s
cross join subjects sub
left join examinations e ON s.student_id = e.student_id and sub.subject_name = e.subject_name
group by 1,2,3
order by 1,3



-- Q


select name
from Employee
where id in (SELECT managerId
FROM Employee
GROUP BY managerId
HAVING COUNT(managerId) > 4);



-- Q

use customer
create table exams (student_id int, subject varchar(20), marks int);
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);
select * from exams

select student_id
from exams
where subject in ('Chemistry','Physics')
group by student_id
having count(distinct subject)=2 and count(distinct marks)=1;




-- Q

use customer;
select * from person;
select * from friend;
ALTER TABLE person RENAME COLUMN ï»¿PersonID to PersonID;
ALTER TABLE friend RENAME COLUMN ï»¿PersonID to PersonID;

with score_details as (
select f.personid,sum(p.score) as total_friend_score,count(*) as no_of_friends from friend f
inner join person p on f.friendid = p.personid
group by f.personid
having sum(p.score) > 100
)
select s.*,p.name as person_name
from person p
inner join score_details s on p.personid = s.personid




-- Q

create table employees
(emp_id int,
emp_name varchar(100),
department_id int,
salary int,
manager_id int);

insert into employees 
values 
(1,'Ankit',100,10000,4),
(2,'Mohit',100,15000,5),
(3,'Vikas',100,10000,4),
(4,'Rohit',100,5000,2),
(5,'Mudit',200,12000,6),
(6,'Agam',200,12000,2),
(7,'Sanjay',200,9000,2),
(8,'Ashish',200,5000,2)

select * from employees;

-- Where clause goes to each row. Applies filter row by row to each row. Used to filter rows before any grouping or aggregation is done.
Select * from employees where salary > 10000

-- Having clause is applied when finding aggregated values. Used to filter groups after the GROUP BY clause has been applied.
Select distinct(department_id)
from employees
group by department_id
having avg(salary) > 9500

select department_id, avg(salary) as avg_salary from employees
where salary>10000
group by department_id
having avg(salary)>12000



-- Q

use customer
create table customersname (customer_name varchar(30))
insert into customersname values ('Ankit Bansal')
,('Vishal Pratap Singh')
,('Michael'); 

WITH cte AS (
    SELECT *,
           LENGTH(customer_name) - LENGTH(REPLACE(customer_name, ' ', '')) AS no_of_spaces,
           INSTR(customer_name, ' ') AS first_space_position,
           CASE 
               WHEN INSTR(SUBSTRING(customer_name, INSTR(customer_name, ' ') + 1), ' ') > 0 THEN 
                   INSTR(customer_name, ' ') + INSTR(SUBSTRING(customer_name, INSTR(customer_name, ' ') + 1), ' ')
               ELSE NULL
           END AS second_space_position
    FROM customersname
)
SELECT *,
       CASE 
           WHEN no_of_spaces = 0 THEN customer_name
           ELSE LEFT(customer_name, first_space_position - 1)
       END AS first_name,
       CASE 
           WHEN no_of_spaces <= 1 THEN NULL
           ELSE SUBSTRING(customer_name, first_space_position + 1, second_space_position - first_space_position - 1)
       END AS middle_name,
       CASE 
           WHEN no_of_spaces = 0 THEN NULL
           WHEN no_of_spaces = 1 THEN SUBSTRING(customer_name, first_space_position + 1, LENGTH(customer_name) - first_space_position)
           WHEN no_of_spaces = 2 THEN SUBSTRING(customer_name, second_space_position + 1, LENGTH(customer_name) - second_space_position)
       END AS last_name
FROM cte;





use customer;

-- Creating the customers table
CREATE TABLE customerss (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Creating the products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

-- Creating the orders table
CREATE TABLE orderss (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customerss(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting data into customers table
INSERT INTO customerss (first_name, last_name, email, city) VALUES
('John', 'Doe', 'john.doe@example.com', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', 'Los Angeles'),
('Emily', 'Jones', 'emily.jones@example.com', 'Chicago'),
('Michael', 'Brown', 'michael.brown@example.com', 'Houston'),
('Sarah', 'Davis', 'sarah.davis@example.com', 'Philadelphia');

-- Inserting data into products table
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 699.99, 100),
('Blender', 'Home Appliances', 89.99, 30),
('Table Lamp', 'Home Decor', 49.99, 75),
('Office Chair', 'Furniture', 149.99, 40);

-- Inserting data into orders table
INSERT INTO orderss (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-01-15', 1),
(1, 2, '2024-02-20', 2),
(2, 3, '2024-03-05', 1),
(3, 4, '2024-04-10', 3),
(4, 5, '2024-05-25', 1),
(5, 2, '2024-06-30', 1),
(1, 3, '2024-07-15', 2),
(2, 1, '2024-08-10', 1),
(3, 5, '2024-09-20', 1),
(4, 4, '2024-10-05', 1),
(5, 1, '2024-11-10', 1);

select first_name,last_name, sum(price*quantity) as spent
from customerss as c
join orderss o on c.customer_id = o.customer_id
join products p on p.product_id = o.product_id
where year(order_date) = '2024'
group by first_name,last_name
order by spent desc
limit 5;

select product_name, sum(o.quantity) as q
from products p 
join orderss o on p.product_id = o.product_id
group by p.product_name
order by q desc
limit 1


select first_name, last_name, count(DISTINCT p.category) As category_count
from customerss as c
join orderss as o on c.customer_id = o.customer_Id
join products p on p.product_id = o.product_id
group by first_name, last_name
having count(DISTINCT p.category) >3


select avg(o.quantity)
from orderss o
join products p on o.product_id = p.product_id
where category = 'Electronics';

SELECT c.first_name, c.last_name
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.category = 'Clothing'
);
