USE Personal_Project
  select * from [Creating Sales Dashboard]
  --checking for null values
  select * from [Creating Sales Dashboard]
  where Date IS Null
  OR Region IS Null
  OR Product IS Null
  OR Sales_Amount IS Null
  OR Quantity_Sold IS Null
  OR Cost IS Null
  OR Profit IS Null
  OR Customer_ID IS Null
  OR Customer_Segment IS Null
  OR Sales_Channel IS Null
  OR Discount IS Null

  -- No Null Values


-- Checking for Duplicate values

SELECT Date, Region,Product, Sales_Amount, Quantity_Sold, Cost, Profit, Customer_Id, Customer_Segment, Sales_Channel, Discount, COUNT(*)
FROM [Creating Sales Dashboard]
GROUP BY Date, Region,Product, Sales_Amount, Quantity_Sold, Cost, Profit, Customer_Id, Customer_Segment, Sales_Channel, Discount
HAVING COUNT(*) > 1;

-- no duplicate values

Select Date from [Creating Sales Dashboard]

-- Aggregating sales by Day--

SELECT DAY(Date) AS order_day,
       SUM(Sales_Amount) AS total_sales,
       COUNT(Customer_ID) AS total_orders_bycustomer
FROM [Creating Sales Dashboard]
GROUP BY DAY(Date)
ORDER BY order_day;

--Aggregating sales by Region--

SELECT Region,
       SUM(Sales_Amount) AS total_sales
FROM [Creating Sales Dashboard]
GROUP BY Region
ORDER BY total_sales DESC;

--Aggregating sales by Product--

SELECT Product,
       SUM(Sales_Amount) AS total_sales
FROM [Creating Sales Dashboard]
GROUP BY Product
ORDER BY total_sales DESC;


--Aggregating sales customer ID, Customer_Segment, Sales_Channel--
SELECT Customer_ID,Customer_Segment, Sales_Channel,
       SUM(Sales_Amount) AS total_sales
FROM [Creating Sales Dashboard]
GROUP BY Customer_ID,Customer_Segment, Sales_Channel
ORDER BY total_sales DESC;

--Aggregating sales customer ID--
SELECT Customer_ID,
       SUM(Sales_Amount) AS total_sales
FROM [Creating Sales Dashboard]
GROUP BY Customer_ID
ORDER BY total_sales DESC;


--Aggregating sales Customer_Segment--
SELECT Customer_Segment,
       SUM(Sales_Amount) AS total_sales
FROM [Creating Sales Dashboard]
GROUP BY Customer_Segment
ORDER BY total_sales DESC;


--Aggregating sales Sales_Channel--
SELECT Sales_Channel,
       SUM(Sales_Amount) AS total_sales
FROM [Creating Sales Dashboard]
GROUP BY Sales_Channel
ORDER BY total_sales DESC;