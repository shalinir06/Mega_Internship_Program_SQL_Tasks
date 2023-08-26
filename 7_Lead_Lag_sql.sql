-- 12) Lead and lag
-- for the dataset created in the lead and lag session complete the following:
/* a) Run and execute the code shared and add an additional column profit_status 
if the change in percentage is positive it should be profit else loss*/
SELECT
  order_Date,
  sales_amount,
  LAG(sales_amount) OVER (ORDER BY order_Date) AS PreviousDaySales,
  lead(sales_amount) OVER (ORDER BY order_Date) AS NextDaySales,
  ((sales_amount)- (lag(sales_amount) OVER (ORDER BY order_Date)))
  /
  LAG(sales_amount) OVER (ORDER BY order_Date)*100 as change_percentage,
CASE
    WHEN ((sales_amount)- (lag(sales_amount) OVER (ORDER BY order_Date)))
  /
  LAG(sales_amount) OVER (ORDER BY order_Date)*100 > 0 THEN 'profit'
ELSE 'Loss'
END AS profit_status 