use mydb;

CREATE TABLE employees (
  id INT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  job_title VARCHAR(100),
  department_id INT,
salary DECIMAL(10, 2),
hired_date DATE
);

INSERT INTO employees VALUES (1, 'John', 'Doe', 'john.doe@gmail.com', 'Software Engineer', 1, 50000, '2022-01-01');
INSERT INTO employees VALUES (2, 'Jane', 'Smith', 'jane.smith@gmail.com', 'Data Scientist', 2, 60000, '2022-02-01');
INSERT INTO employees VALUES (3, 'Bob', 'Johnson', 'bob.johnson@gmail.com', 'Product Manager', 1, 70000, '2022-03-01');
INSERT INTO employees VALUES (4, 'Alice', 'Williams', 'alice.williams@gmail.com', 'Software Engineer', 2,80000, '2022-04-01');
INSERT INTO employees VALUES (5, 'Charlie', 'Brown', 'charlie.brown@gmail.com', 'UX Designer', 3,  60000, '2022-05-01');
INSERT INTO employees VALUES (6, 'Emma', 'Davis', 'emma.davis@gmail.com', 'Data Analyst', 3, 70000, '2022-06-01');

CREATE TABLE departments (
  id INT PRIMARY KEY,
  department_name VARCHAR(100),
  manager_id INT,
  location VARCHAR(100),
  budget DECIMAL(10, 2),
  created_at TIMESTAMP
); 

INSERT INTO departments VALUES (1, 'Software Development', 3, 'Seattle', 120000.00, '2023-01-01 00:00:00');
INSERT INTO departments VALUES (2, 'Data Science', 2, 'San Francisco', 130000.00, '2023-02-01 00:00:00');
INSERT INTO departments VALUES (3, 'Design', 5, 'New York', 80000.00, '2023-03-01 00:00:00');

select * from employees;
select * from departments;

-- get a list of employees and the department they belong to
select a.*, b.* from employees a join departments b
on a.department_id = b.id;

-- find all the employees who work in the same location as john doe
select a.*, b.* from employees a join departments b
on a.department_id = b.id where location = 'seattle';

-- find all the departments that don't have any employees.

-- list the employees along with their managers. Assume that a department's manager is also an employee within the deoartment.

-- Find the departments with more than 2 employees.
SELECT d.id, d.department_name, count(e.id) as count
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.id
HAVING COUNT(e.id) >= 2;
 
-- find the department with highest budget and list all its employees.
  select first_name, last_name, d.id, department_name, budget, job_title
  from employees e join departments d on e.department_id = d.id
  where budget= (select max(budget) from departments);
  
-- for each department, find the employee who has hired most recently. Assume that the employees table has a hired_date column 

-- partition by
-- for each department, find the employee with the highest salary.
select * from 
(select id, department_id,salary,job_title,
row_number() over(partition by department_id order by salary desc) as rank1
from employees) a 
where rank1 = 1;

/* find the average salary for each department and list 
all employees who earn more than their department's average salary.*/
select id, department_id, salary, avg_salary from
(select id, department_id, salary,
avg(salary) over (partition by department_id) as avg_salary
from employees) a 
where salary > avg_salary;

-- for each department, rank employees based on their hire dates (newest to oldest).
select department_id, first_name, last_name, hired_date,department_name,
rank () over (partition by department_id order by hired_date desc) as rank_hired_date
from employees e
JOIN departments d on e.department_id = d.id;

-- calculate the cummulative salary in each department, ordered by hiredate.
select d.id, d.department_name, salary, hired_date,
sum(salary) over(partition by d.id order by hired_date ) as cm_sum
from employees e 
join departments d on e.department_id=d.id;

select * from sales_purchase_data; 
-- group by
-- calculate the total quantity of products sold for each product_id
select sum(quantity),product_id from sales_purchase_data group by product_id;

-- calculate the total revenue for each customer
select sum(profit), customer_name from sales_purchase_data group by 2;

-- get the maximum quantity ordered in a single order for each product
select max(distinct quantity), product_id from sales_purchase_data group by product_id;


-- get the number of orders placed by each customer
select count(order_id), customer_name from sales_purchase_data group by customer_name;

-- calculate the total revenue for each day
select sum(profit), order_date from sales_purchase_data group by order_date;

-- calculate the total revenue for each product each day
select sum(profit), product_id, order_date from sales_purchase_data group by product_id, order_date;

-- partition by
-- find the cummulative sum of quantity for each product, ordered by date
select sum(quantity) over (partition by product_id order by order_date) total_quantity, product_id  from sales_purchase_data;
-- calculate the average price for each customer_id, considering only the top 3 most expensive orders
select customer_id, avg(sales) over(partition by customer_id order by customer_id ) as avg_price from sales_purchase_data limit 3;

-- find the difference in quantity for each product between consecutive orders
-- determine the rank of each order for each customer based on the quantity, in descending order
select order_id, quantity, rank() over(partition by order_id order by quantity desc) as rank_order from sales_purchase_data;

-- find the running total(cumulative sum) of the price for each customer, sorted by order_date 
select customer_id,order_date,sales, sum(sales) over(partition by order_date order by order_date desc) running_total from sales_purchase_data;


SELECT customer_id,
        order_date,
        sales,
        SUM(sales) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM sales_purchase_data;

select d.id, d.department_name, salary, hired_date,
sum(salary) over(partition by d.id order by hired_date ) as cm_sum
from employees e 
join departments d on e.department_id=d.id;




CREATE TABLE insurance_data (
    pid INT,
    tiv_2015 FLOAT,
    tiv_2016 FLOAT,
    lat FLOAT,
    lon FLOAT
);
INSERT INTO insurance_data (pid, tiv_2015, tiv_2016, lat, lon)
VALUES
    (1, 10, 5, 10, 10),
    (2, 20, 20, 20, 20),
    (3, 10, 30, 20, 20),
    (4, 10, 40, 40, 40);
    
/*Write an SQL query to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city like any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.*/
select distinct lat, round(sum(tiv_2016),2)
from insurance_data; 

WITH unique_locations AS (
    SELECT DISTINCT lat, lon
    FROM insurance_data
)
SELECT
    COUNT(*) AS num_unique_tiv_2016
FROM insurance_data
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM insurance_data
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) NOT IN (
    SELECT lat, lon
    FROM unique_locations
);

CREATE TABLE visits_data (
    id INT,
    visit_date DATE,
    people INT
);
INSERT INTO visits_data (id, visit_date, people)
VALUES
    (1, '2017-01-01', 10),
    (2, '2017-01-02', 109),
    (3, '2017-01-03', 150),
    (4, '2017-01-04', 99),
    (5, '2017-01-05', 145),
    (6, '2017-01-06', 1455),
    (7, '2017-01-07', 199),
    (8, '2017-01-09', 188);
    select * from visits_data;
    /*Write an SQL query to report the fraction of players that 
    logged in again on the day after the day they first logged in, 
    rounded to 2 decimal places. 
    In other words, you need to count the number of players that 
    logged in for at least two consecutive days starting from their 
    first login date, then divide that number by the total number of 
    players.*/
    
    SELECT
    round(COUNT(DISTINCT id) / COUNT(*), 2) AS fraction
FROM visits_data
WHERE visit_date IN (
    SELECT id
    FROM visits_data
    GROUP BY id
    HAVING COUNT(*) >= 2
); -- error in the statement will explain in next class

CREATE TABLE Orderss (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE
);

INSERT INTO Orderss (OrderID, CustomerID, OrderDate)
VALUES
    (1, 101, '2023-07-15'),
    (2, 102, '2023-07-14'),
    (3, 101, '2023-07-12'),
    (4, 103, '2023-07-10'),
    (5, 102, '2023-07-11'),
    (6, 101, '2023-07-09'),
    (7, 104, '2023-07-08');

 CREATE TABLE customers (
   cust_id INT,
    name varchar(20),
    country varchar(20)
);   
INSERT INTO customers (cust_id, name, country)
VALUES   
	(101,'john','India'),
    (102, ' sang', 'China'),
    (103, 'bob', 'UK'),
    (104,'Alice', 'canada');

/*Consider a database with two tables: ""Orders"" and ""Customers."" 
The ""Orders"" table contains information
about customer orders, and the ""Customers"" table contains customer 
details. 
Write a SQL query to find
the latest order date for each customer, 
along with their names and countries. If a customer has not
placed any orders, the query should still display their name and 
country with a NULL value for the order date*/

select c.name, c.country, 
MAX(o.OrderDate) over (partition by c.cust_id)AS latest_order_date
FROM customers c
LEFT JOIN orderss o ON c.cust_id = o.CustomerID;