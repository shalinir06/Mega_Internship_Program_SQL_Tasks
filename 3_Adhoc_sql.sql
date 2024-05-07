use mydb;
show tables;
select * from sales_purchase_data_updated;

-- 1) to 4) select column from derived table by following the given rules
select 
Row_ID, 
Customer_Name, 
substring(Customer_ID,4,5) as Customer_Id,
substring(Order_ID,4,11) as Order_Id,
Order_Date, 
Month(Order_Date) as Order_Month, 
Year(Order_Date) as Order_Year,
Country, 
State, 
City, 
Region, 
Ship_Mode, 
concat(Region,'_',Country,'_', City,'_', State) as Location_Info   
from sales_purchase_data_updated;

select * from sales_purchase_data_updated;
select count(*) from sales_purchase_data_updated;
==================================================================================================================================================

select * from sales_purchase_data;

-- 5) creating new table from the derived table and following the given patterns
DROP TABLE IF EXISTS Sales_Order_Info;
CREATE TABLE Sales_Order_Info AS
SELECT
	substring(Product_ID,8,8) as Product_Id,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    round(Sales/quantity,2) as Per_Quantity_Price,
    CASE
    WHEN sales > 1000 THEN 'Super'
    WHEN sales > 400  and sales <1000  THEN 'Average'
ELSE 'Low'
END AS Super_Type,
    Discount,
    Profit,
    profit < 0 as loss
FROM sales_purchase_data;

select * from Sales_Order_Info limit 10;
select profit, loss from Sales_Order_Info where loss = 1;
select sales, super_type from Sales_Order_Info where super_type = 'low';
select sales, super_type from Sales_Order_Info where sales > 1000;
select profit, loss from Sales_Order_Info where loss = 1;
select count(Sales) from Sales_Order_Info where Sales > 400 and Sales < 1000;
==================================================================================================================================================
-- 6) Count of distinct order_ids in  sales_purchase_data_updated table	
select count(distinct Order_Id) as No_Of_Unique_order_id from sales_purchase_data_updated;

-- 7) Count of Unique product names in Sales_order_info	
select count(distinct Product_Name) as No_Of_Unique_Product_Name from Sales_Order_Info;

-- 8) Count of distinct Segments in sales_purchase_data_updated table	
select count(distinct Segment) as No_Of_Unique_Segment from sales_purchase_data_updated;

-- 9) Recent order date in  sales_purchase_data_updated table
select max(order_date) as Recent_Order_Date from sales_purchase_data_updated;

-- 10)Old order date in sales_purchase_data_updated table
select min(order_date) as Oldest_Order_Date from sales_purchase_data_updated;

-- 11) Customer info of all the columns for the maximum order date
select * from sales_purchase_data_updated where order_date = '2023-06-30';
								(Or)
select * from sales_purchase_data_updated where Order_Date = (select MAX(Order_Date) from sales_purchase_data_updated);

-- 12) No .of Unique Customers from Texas and New york
select 
    count(distinct case when State = 'Texas'then Customer_Id end) as no_of_cust_texas,
    count(distinct case when State = 'New York' then Customer_Id end) as no_of_cust_NY
from Sales_purchase_data_updated;
								(or)
select count(distinct e1.Customer_id) as No_Of_cus_texas, count(distinct e2.Customer_id) as No_Of_cus_New_York 
 from sales_purchase_data_updated e1 join sales_purchase_data_updated e2 on e1.state = 'Texas' and e2.state = 'New York';
==================================================================================================================================================






