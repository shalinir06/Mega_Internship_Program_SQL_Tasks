# create database  
create database mydb;
use mydb;
================================================================================================================================================================

# create customer table 
CREATE TABLE customer (
    cust_id INT,
    cust_name VARCHAR(50),
    date DATE CHECK (date BETWEEN '2023-01-01' AND '2023-06-30'),
    city VARCHAR(50),
    state VARCHAR(50),
    email_id VARCHAR(50),
    device VARCHAR(50),
    channel VARCHAR(20),
    in_time TIMESTAMP,
    out_time TIMESTAMP,
    CONSTRAINT check_time_variation CHECK (out_time >= in_time + INTERVAL '1' HOUR AND out_time <= in_time + INTERVAL '2' HOUR),
    primary key (cust_id,date)
    );
===============================================================================================================================================================

# shows the structure of the table    
desc customer;
===============================================================================================================================================================

# insert records in the customer table
INSERT INTO customer (cust_id, cust_name, date, city, state, email_id, device, channel, in_time, out_time)
VALUES
(7, 'Christopher Brown', '2023-02-08', 'Seattle', 'WA', 'brown@gmail.com', 'Laptop', 'YouTube', '2023-02-08 17:00:00', '2023-02-08 18:30:00'),
(3, 'Mark Johnson', '2023-04-16', 'Chicago', 'IL', 'mark.johnson@gmail.com', 'Mobile', 'Pinterest', '2023-04-16 14:34:00', '2023-04-16 16:09:00'),
(8, 'Emma Johnson', '2023-02-08', 'Dallas', 'TX', 'emma@gmail.com', 'Desktop', 'Twitter', '2023-02-08 16:15:00', '2023-02-08 17:45:00'),
(5, 'Michael', '2023-05-29', 'San Francisco', 'CA', 'michael@gmail.com', 'Laptop', 'YouTube', '2023-05-29 11:15:00', '2023-05-29 12:30:00'),
(1, 'John Doe', '2023-06-04', 'New York', 'NY', 'john.doe@gmail.com', 'Desktop', 'Pinterest', '2023-06-04 18:00:00', '2023-06-04 19:00:00'), 
(4, 'Emily Davis', '2023-06-01', 'Houston', 'TX', 'emily.davis@gmail.com', 'Tablet', 'Facebook', '2023-06-01 10:45:00', '2023-06-01 12:00:00'),
(7, 'Christopher Brown', '2023-04-30', 'Seattle', 'WA', 'brown@gmail.com', 'Mobile', 'Twitter', '2023-04-30 15:45:00', '2023-04-30 17:00:00'),
(9, 'Daniel Wilson', '2023-06-28', 'Boston', 'MA', 'daniel.wilson@gmail.com', 'Laptop', 'Pinterest', '2023-06-28 14:00:00', '2023-06-28 15:30:00'),
(1, 'John Doe', '2023-02-23', 'New York', 'NY', 'john.doe@gmail.com', 'Desktop', 'YouTube', '2023-02-23 15:30:00', '2023-02-23 17:15:00'), 
(6, 'Sarah Thompson', '2023-05-20', 'Miami', 'FL', 'sara@gmail.com', 'Mobile', 'Instagram', '2023-05-20 10:16:00', '2023-05-20 11:47:00'),
(10, 'Olivia Anderson', '2023-01-10', 'Seattle', 'WA', 'olivia@gmail.com', 'Laptop', 'Facebook', '2023-01-10 16:33:00', '2023-01-10 18:00:00'),
(2, 'Jane Smith', '2023-02-10', 'Los Angeles', 'CA', 'jane.smith@gmail.com', 'Tablet', 'Instagram', '2023-02-10 10:13:00', '2023-02-10 12:01:00'),
(10, 'Olivia Anderson', '2023-02-10', 'Seattle', 'WA', 'olivia@gmail.com', 'Mobile', 'Pinterest', '2023-02-10 10:30:00', '2023-02-10 12:00:00'),
(8, 'Emma Johnson', '2023-03-15', 'Dallas', 'TX', 'emma@gmail.com', 'Laptop', 'YouTube', '2023-03-15 12:15:00', '2023-03-15 13:30:00'),
(1, 'John Doe', '2023-03-05', 'New York', 'NY', 'john.doe@gmail.com', 'Mobile', 'Twitter', '2023-03-05 10:10:00', '2023-03-05 11:11:00'),
(3, 'Mark Johnson', '2023-01-30', 'Chicago', 'IL', 'mark.johnson@gmail.com', 'Desktop', 'Hathway', '2023-01-30 14:42:00', '2023-01-30 15:47:00'),
(4, 'Emily Davis', '2023-01-11', 'Houston', 'TX', 'emily.davis@gmail.com', 'Laptop', 'Pinterest', '2023-01-11 14:14:00', '2023-01-11 16:13:00'),
(1, 'John Doe', '2023-05-31', 'New York', 'NY', 'john.doe@gmail.com', 'Mobile', 'Instagram', '2023-05-31 12:59:00', '2023-05-31 14:59:00'), 
(6, 'Sarah Thompson', '2023-02-02', 'Miami', 'FL', 'sara@gmail.com', 'Tablet', 'Hathway', '2023-02-02 12:59:00', '2023-02-02 14:22:00'),
(2, 'Jane Smith', '2023-04-30', 'Los Angeles', 'CA', 'jane.smith@gmail.com', 'Mobile', 'Pinterest', '2023-04-30 16:05:00', '2023-04-30 18:02:00'),
(10, 'Olivia Anderson', '2023-03-15', 'Seattle', 'WA', 'olivia@gmail.com', 'desktop', 'YouTube', '2023-03-15 13:38:00', '2023-03-15 15:28:00'),
(3, 'Mark Johnson', '2023-06-20', 'Chicago', 'IL', 'mark.johnson@gmail.com', 'Laptop', 'Instagram', '2023-06-20 17:15:00', '2023-06-20 19:12:00'),
(10, 'Olivia Anderson', '2023-06-20', 'Seattle', 'WA', 'olivia@gmail.com', 'Mobile', 'Hathway', '2023-06-20 13:30:00', '2023-06-20 14:45:00'),
(1, 'John Doe', '2023-01-12', 'New York', 'NY', 'john.doe@gmail.com', 'Tablet', 'Facebook', '2023-01-12 08:45:00', '2023-01-12 10:15:00'),
(9, 'Daniel Wilson', '2023-02-05', 'Boston', 'MA', 'daniel.wilson@gmail.com', 'Mobile', 'Twitter', '2023-02-05 18:00:00', '2023-02-05 19:30:00'),
(5, 'Michael', '2023-06-18', 'San Francisco', 'CA', 'michael@gmail.com', 'Desktop', 'Facebook', '2023-06-18 20:15:00', '2023-06-18 21:21:00'),
(8, 'Emma Johnson', '2023-01-10', 'Dallas', 'TX', 'emma@gmail.com', 'Laptop', 'Instagram', '2023-01-10 13:00:00', '2023-01-10 14:30:00'),
(7, 'Christopher Brown', '2023-05-31', 'Seattle', 'WA', 'brown@gmail.com', 'Laptop', 'Facebook', '2023-05-31 11:45:00', '2023-05-31 13:00:00'),
(2, 'Jane Smith', '2023-02-28', 'Los Angeles', 'CA', 'jane.smith@gmail.com', 'Tablet', 'Hathway', '2023-02-28 17:59:00', '2023-02-28 19:48:00'),
(8, 'Emma Johnson', '2023-06-30', 'Dallas', 'TX', 'emma@gmail.com', 'Mobile', 'Facebook', '2023-06-30 09:45:00', '2023-06-30 11:15:00'),
(6, 'Sarah Thompson', '2023-04-15', 'Miami', 'FL', 'sara@gmail.com', 'Desktop', 'Facebook', '2023-04-15 15:00:00', '2023-04-15 16:01:00'),
(4, 'Emily Davis', '2023-03-15', 'Houston', 'TX', 'emily.davis@gmail.com', 'Laptop', 'YouTube', '2023-03-15 19:26:00', '2023-03-15 20:37:00'),
(7, 'Christopher Brown', '2023-03-15', 'Seattle', 'WA', 'brown@gmail.com', 'Tablet', 'Instagram', '2023-03-15 12:06:00', '2023-03-15 13:18:00'),
(5, 'Michael', '2023-02-11', 'San Francisco', 'CA', 'michael@gmail.com', 'Mobile', 'Hathway', '2023-02-11 16:55:00', '2023-02-11 18:05:00'),
(9, 'Daniel Wilson', '2023-03-10', 'Boston', 'MA', 'daniel.wilson@gmail.com', 'Laptop', 'Facebook', '2023-03-10 17:13:00', '2023-03-10 18:44:00'),
(4, 'Emily Davis', '2023-04-26', 'Houston', 'TX', 'emily.davis@gmail.com', 'Desktop', 'Twitter', '2023-04-26 19:58:00', '2023-04-26 21:00:00'),
(3, 'Mark Johnson', '2023-03-07', 'Chicago', 'IL', 'mark.johnson@gmail.com', 'Tablet', 'Facebook', '2023-03-07 12:00:00', '2023-03-07 13:30:00'),
(7, 'Christopher Brown', '2023-01-27', 'Seattle', 'WA', 'brown@gmail.com', 'Mobile', 'Pinterest', '2023-01-27 15:51:00', '2023-01-27 17:00:00'),
(5, 'Michael', '2023-01-04', 'San Francisco', 'CA', 'michael@gmail.com', 'Tablet', 'Instagram', '2023-01-04 09:30:00', '2023-01-04 10:45:00'),
(2, 'Jane Smith', '2023-05-05', 'Los Angeles', 'CA', 'jane.smith@gmail.com', 'Desktop', 'Facebook', '2023-05-05 13:15:00', '2023-05-05 14:45:00'),
(9, 'Daniel Wilson', '2023-04-20', 'Boston', 'MA', 'daniel.wilson@gmail.com', 'Tablet', 'Hathway', '2023-04-20 12:30:00', '2023-04-20 13:45:00'),
(6, 'Sarah Thompson', '2023-01-25', 'Miami', 'FL', 'sara@gmail.com', 'Laptop', 'Twitter', '2023-01-25 14:30:00', '2023-01-25 15:45:00'),
(3, 'Mark Johnson', '2023-05-13', 'Chicago', 'IL', 'mark.johnson@gmail.com', 'Tablet', 'YouTube', '2023-05-13 08:54:00', '2023-05-13 09:59:00'),
(6, 'Sarah Thompson', '2023-03-08', 'Miami', 'FL', 'sara@gmail.com', 'Desktop', 'YouTube', '2023-03-08 08:45:00', '2023-03-08 10:00:00'),
(4, 'Emily Davis', '2023-02-22', 'Houston', 'TX', 'emily.davis@gmail.com', 'Mobile', 'Instagram', '2023-02-22 09:50:00', '2023-02-22 11:10:00'),
(5, 'Michael', '2023-04-27', 'San Francisco', 'CA', 'michael@gmail.com', 'Laptop', 'Pinterest', '2023-04-27 12:45:00', '2023-04-27 14:15:00'),
(9, 'Daniel Wilson', '2023-05-30', 'Boston', 'MA', 'daniel.wilson@gmail.com', 'Tablet', 'Instagram', '2023-05-30 09:45:00', '2023-05-30 11:00:00'),
(2, 'Jane Smith', '2023-01-15', 'Los Angeles', 'CA', 'jane.smith@gmail.com', 'Desktop', 'YouTube', '2023-01-15 09:06:00', '2023-01-15 11:05:00'),
(10, 'Olivia Anderson', '2023-04-25', 'Seattle', 'WA', 'olivia@gmail.com', 'Tablet', 'Instagram', '2023-04-25 11:25:00', '2023-04-25 13:15:00'),
(8, 'Emma Johnson', '2023-05-22', 'Dallas', 'TX', 'emma@gmail.com', 'Mobile', 'Pinterest', '2023-05-22 11:30:00', '2023-05-22 12:45:00');
=================================================================================================================================================================

# selects all the field available in the customer table
select * from customer;
=================================================================================================================================================================

# time difference calculation (in_time and out_time)
select *, concat(timestampdiff(hour,in_time,out_time), 'hour', timestampdiff(minute,in_time,out_time) %60, 'minutes') as time_difference from customer; 
==================================================================================================================================================================

# create orders table
create table orders (
order_id int,
customer_id int,
order_date date,
product varchar(50), 
product_id varchar(10),
arrival_date date,
dispatch_date date,
sender_location varchar(50),
receiver_location varchar(50),
constraint chk_arrival_date check (arrival_date <= dispatch_date + interval '1' week),
constraint chk_dispatch_date check (dispatch_date >= order_date + interval '1' day and dispatch_date <= order_date + interval '2' day),
primary key(order_id,order_date),
foreign key (customer_id) references customer(cust_id)
);
==================================================================================================================================================================

# shows the structure of the table    
desc orders;
===============================================================================================================================================================

# insert records in the orders table
INSERT INTO orders (order_id,customer_id,order_date,product,product_id,arrival_date,dispatch_date,sender_location,receiver_location)
VALUES
(101,5,'2023-04-25','laptop','LT06','2023-04-30','2023-04-26','Houston,TX','San Francisco,CA'),  
(115,9,'2023-01-06','mouse','M05','2023-01-13','2023-01-07','Miami,FL','Boston,MA'),
(106,2,'2023-06-11','earphone','EP08','2023-06-19','2023-06-13','San Francisco,CA','Los Angeles,CA'),
(113,4,'2023-05-30','keyboard','KB08','2023-06-03','2023-05-31','Dallas,TX','Houston,TX'),
(111,2,'2023-03-28','tablet','T06','2023-03-31','2023-03-29','Boston,MA','Los Angeles,CA'),
(102,6,'2023-02-01','earphone','EP08','2023-02-09','2023-02-02','Chicago,IL','Miami,FL'),
(105,8,'2023-01-14','mouse','M05','2023-01-20','2023-01-16','Los Angeles,CA','Dallas,TX'),
(110,5,'2023-05-06','keyboard','KB08','2023-05-14','2023-05-08','New York,NY','San Francisco,CA'),
(103,4,'2023-04-23','laptop','LT06','2023-04-30','2023-04-24','Seattle,WA','Houston,TX'),
(107,9,'2023-01-19','earphone','EP08','2023-01-27','2023-01-21','Los Angeles,CA','Boston,MA'),
(114,6,'2023-02-28','tablet','T06','2023-03-05','2023-03-01','New York,NY','Miami,FL'),
(104,8,'2023-03-02','keyboard','KB08','2023-03-10','2023-03-03','Chicago,IL','Dallas,TX'),
(109,4,'2023-06-27','mouse','M05','2023-07-02','2023-06-29','Boston,MA','Houston,TX'),
(112,2,'2023-05-16','laptop','LT06','2023-05-23','2023-05-17','San Francisco,CA','Los Angeles,CA'),
(108,9,'2023-04-30','tablet','T06','2023-05-06','2023-05-01','Seattle,WA','Boston,MA');
=================================================================================================================================================================

# selects all the field available in the orders table
select * from orders;
=================================================================================================================================================================

DML_DDL_Interview_operations

# 1) How to insert multiple records in a table ?
use mydb
INSERT INTO orders (order_id,customer_id,order_date,product,product_id,arrival_date,dispatch_date,sender_location,receiver_location)
VALUES
(116,2,'2023-06-25','laptop','LT06','2023-06-30','2023-06-26','Seattle,WA','Los Angeles,CA'),  
(117,5,'2023-05-06','mouse','M05','2023-05-13','2023-05-07','Chicago,IL','San Francisco,CA'),
(120,8,'2023-02-21','tablet','T06','2023-03-02','2023-02-23','Boston,MA','Dallas,TX'),
(119,4,'2023-01-30','earphone','EP08','2023-02-03','2023-01-31','Miami,FL','Houston,TX'),
(118,6,'2023-04-12','keyboard','KB08','2023-04-17','2023-04-13','New York,NY','Miami,FL');
select * from orders;
=================================================================================================================================================================

# 2) How to add additional column in a table ?
alter table customer add column mobile_no varchar(15) check(length (mobile_no) = 10);
select * from customer;
desc customer;
=================================================================================================================================================================

# 3) How to change the constraint in the table ?
# a) DROP the constraint
alter table orders drop primary key ;
# b) add new constraint 
alter table orders add constraint pk_orders primary key (order_id);
desc orders;
=================================================================================================================================================================

# 4) how to alter the column name in a table ?
alter table customer rename column cust_name to customer_name;
desc customer;
=================================================================================================================================================================

# 5) how to change the table name ?
alter table orders rename to orders_1; 
select * from orders_1;
select * from orders;  
alter table orders_1 rename to orders;
=================================================================================================================================================================

# 6) how to change the particular value in a table ?
update customer set mobile_no = '9894199940' where customer_name = 'John Doe';
update customer set mobile_no = '+91 9994098941' where cust_id = 2;  # error check constraints violated.
update customer set mobile_no = '9994098941' where cust_id = 2; 
update customer set mobile_no = '8667295975' where city = 'chicago';
update customer set mobile_no = '9994095975' where state ='TX' ;
update customer set mobile_no = '9994098942' where cust_id = 5; 
update customer set mobile_no = '9894199941' where customer_name = 'Sarah Thompson'; 
update customer set mobile_no = '8667295976' where cust_id = 7; 
update customer set mobile_no = '9597586675' where state = 'MA'; 
update customer set mobile_no = '9402658491' where city = 'Seattle'; 
select customer_name,mobile_no from customer order by customer_name asc;
=================================================================================================================================================================

    