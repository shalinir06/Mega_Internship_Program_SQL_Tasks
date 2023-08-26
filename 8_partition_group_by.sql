-- Group by

-- select the database:
use mydb;
=======================================================================================================================================================
-- to know the tables that exist in this database:
show tables;
=======================================================================================================================================================

-- create a table as orders:
Drop table if exists orders;
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  price DECIMAL(10,2));
=======================================================================================================================================================

-- insert values into the orders table:
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, price)
VALUES 
(1021, 101, 7711, '2023-07-01', 2, 50),
(1022, 101, 7712, '2023-07-02', 1, 100),
(1023, 102, 7711, '2023-07-01', 1, 50),
(1024, 103, 7713, '2023-07-01', 5, 20),
(1025, 104, 7712, '2023-07-02', 2, 100),
(1026, 101, 7711, '2023-07-03', 3, 50);
=======================================================================================================================================================

-- to view all the columns in the orders table:
select * from orders;
=======================================================================================================================================================
			
-- 1) Calculate the total quantity of products sold for each product_id:
select  product_id, sum(quantity) "total_qty" from orders group by 1;				
=======================================================================================================================================================

-- 2) Calculate the total revenue for each customer:
select customer_id, sum(price) total_revenue from orders group by 1;
=======================================================================================================================================================

-- 3) Get the maximum quantity ordered in a single order for each product:
select product_id, max(quantity) max_qty from orders group by 1;	
=======================================================================================================================================================
			
-- 4) Get the number of orders placed by each customer:
select customer_id, count(order_id) as no_of_orders from orders group by customer_id;
=======================================================================================================================================================

-- 5) Calculate the total revenue for each day:
select order_date, sum(price) total_revenue from orders group by 1;
=======================================================================================================================================================
						
-- 6) Calculate the total revenue for each product each day:
select product_id, order_date, sum(price) total_revenue from orders group by 1,2;
=======================================================================================================================================================

-- Partition by:

-- 1) Find the cumulative sum (running total) of quantity for each product, ordered by date:
select  product_id, order_date, quantity,
sum(quantity) over (partition  by product_id order by order_date) as cum_qty
from orders;
=======================================================================================================================================================

-- 2) Calculate the average price for each customer_id, considering only the top 3 most expensive orders:
select customer_id, price, avg(price) over (partition by customer_id) as avg_price, dense_rank() over (order by price desc) "top 3"
from mydb.orders where 'top 3' <= 3 ;
=======================================================================================================================================================

-- 3) Find the difference in quantity for each product between consecutive orders:	
select quantity, lead(quantity) over( order by order_id) cons_orders, (quantity - lead(quantity) over( order by order_id)) as difference 
from mydb.orders; 
=======================================================================================================================================================
				
-- 4) Determine the rank of each order for each customer based on the quantity, in descending order:	
select *, rank() over( partition by  order_id, customer_id order by quantity desc) 'rank' from mydb.orders;
=======================================================================================================================================================
				
-- 5) Find the running total (cumulative sum) of the price for each customer, sorted by order_date:
select customer_id, order_date, price, sum(price) over (partition by customer_id order by order_date) 'cum_price' from mydb.orders;
=======================================================================================================================================================
