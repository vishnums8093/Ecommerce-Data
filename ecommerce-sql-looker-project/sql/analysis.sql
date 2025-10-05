-- =====================================================
-- Data Analysis
-- =====================================================

-- 1. Sales Trend

--Create a view or derived table with month-year

CREATE OR REPLACE TABLE 
 `helpful-kingdom-469519-f5.e_commerce_data.list_of_order_finalwithmonth` 
AS
SELECT
   *,
   FORMAT_DATE('%Y-%m', DATE(`Order Date`)) AS order_month
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_FINAL`;

-- calculate total sales per month

SELECT
   o.order_month,
   SUM(od.Amount) AS total_sales
FROM 
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_order_finalwithmonth` AS o
JOIN
   `helpful-kingdom-469519-f5.e_commerce_data.order_details_final` 
AS 
   od
ON 
   o.`Order ID` = od.`Order ID`
GROUP BY 
   o.order_month
ORDER BY 
   o.order_month;
--2. Target Performance

-- Calculating actual sales and montly target

SELECT
   t3.clean_order_month,
   t3.category_final,
   SUM(t2.Amount) AS Actual_Sales,
   t3.Target AS Monthly_Target,
   (SUM(t2.Amount) - t3.Target) AS Performance_Delta,
   SAFE_DIVIDE(SUM(t2.Amount), t3.Target)  AS Target_Attainment_Ratio
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_order_finalwithmonth` AS t1
INNER JOIN
   `helpful-kingdom-469519-f5.e_commerce_data.order_details_final` AS t2
ON 
   t1.`Order ID` = t2.`Order ID`
INNER JOIN
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target_final` 
AS 
   t3
ON 
   t2.category_CLEAN = t3.category_final
AND 
   t1.order_month = t3.clean_order_month
GROUP BY
   t3.clean_order_month,
   t3.category_final,
   t3.Target
ORDER BY
   t3.clean_order_month,
   t3.category_final;
-- Calculate Total Sales, Profit, and Margin by Category and Sub-Category

SELECT
   category_CLEAN,
   sub_category_CLEAN,
   SUM(Amount) AS Total_Sales,
   SUM(Profit) AS Total_Profit,
   SAFE_DIVIDE(SUM(Profit), SUM(Amount)) AS Profit_Margin_Ratio
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.order_details_final`
GROUP BY
   category_CLEAN,
   sub_category_CLEAN
ORDER BY
   Total_Profit DESC,
   Total_Sales DESC;
--4. Top Customers

-- Identify Most Valuable Customers by Total Profit and Sales

SELECT
   t1.CustomerName, 
   SUM(t2.Amount) AS Customer_Total_Sales,
   SUM(t2.Profit) AS Customer_Total_Profit, 
   COUNT(t1.`Order ID`) AS Total_Orders_Placed
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_FINAL` AS t1
INNER JOIN
   `helpful-kingdom-469519-f5.e_commerce_data.order_details_final` 
AS 
   t2
ON
   t1.`Order ID` = t2.`Order ID`
GROUP BY
   t1.CustomerName 
ORDER BY
   Customer_Total_Profit DESC,
   Customer_Total_Sales DESC;
--5. Geographic Sales

-- Calculate Sales, Profit, and Orders by Geographic Location (City/State)

SELECT
   t1.State,
   t1.City,
   SUM(t2.Amount) AS Total_Sales,
   SUM(t2.Profit) AS Total_Profit,
   COUNT(t1.`Order ID`) AS Total_Orders
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_order_finalwithmonth` 
AS 
   t1
INNER JOIN
   `helpful-kingdom-469519-f5.e_commerce_data.order_details_final` 
AS 
   t2
ON
   t1.`Order ID` = t2.`Order ID`
GROUP BY
   t1.State,
   t1.City
ORDER BY
   Total_Sales DESC;
