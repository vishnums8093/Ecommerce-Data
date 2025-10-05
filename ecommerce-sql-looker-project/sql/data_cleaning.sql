-- =====================================================
-- Data Cleaning
-- =====================================================

--The following SQL queries were used for cleaning the dataset, ensuring quality and consistency.

--1. List of Order Table

-- To check the number of rows

SELECT
   count(*)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders`;

-- Check for null values

SELECT
   countif (`Order ID`is null) AS order_id_null,
   countif (`Order Date` is null) AS order_date_null,
   countif (`CustomerName` is null) AS customer_name_null,
   countif (`State` is null) AS state_null,
   countif(`City` is null) AS city_null
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders`;

-- check for rows with all null values

SELECT
   count (*)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders`
WHERE
   `Order ID`is null AND
   `Order Date` is null AND
   `CustomerName` is null AND
   `State` is null AND
   `City` is null;

-- Create a clean table

CREATE OR REPLACE TABLE
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN` AS
SELECT 
   *
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders`
WHERE
   `Order ID` IS NOT NULL;

-- Preview all the rows in the cleaned table

SELECT
  *
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`;

-- Check for any null values in the cleaned table

SELECT
   count (*)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`
WHERE
   `Order ID`is null or
   `Order Date` is null or
   `CustomerName` is null or
   `State` is null or
   `City` is null;

-- Check for duplicates

SELECT
   `Order ID`,
   `Order Date`,
   CustomerName,
   State,
   City,
   COUNT(*) AS record_count
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`
GROUP BY
   `Order ID`,
   `Order Date`,
   CustomerName,
   State,
   City
HAVING
   record_count > 1
ORDER BY
   record_count DESC;

-- Standardize the column and create a new cleaned table

SELECT
   TRIM(upper(CustomerName))AS customer_name_clean,
   TRIM(upper(State)) AS state_clean,
   TRIM(upper(City)) AS city_clean
FROM 
 `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`;
CREATE OR REPLACE TABLE
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_FINAL` AS
SELECT
   TRIM(UPPER(CustomerName)) AS CustomerName,
   TRIM(UPPER(State)) AS State,
   TRIM(UPPER(City)) AS City,
   * EXCEPT (CustomerName, State, City)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`;

-- Check for any duplicates in the new table

SELECT
   TRIM(upper(CustomerName))AS customer_name_clean,
   TRIM(upper(State)) AS state_clean,
   TRIM(upper(City)) AS city_clean
FROM 
 `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`;
CREATE OR REPLACE TABLE
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_FINAL` AS
SELECT
   TRIM(UPPER(CustomerName)) AS CustomerName,
   TRIM(UPPER(State)) AS State,
   TRIM(UPPER(City)) AS City,
   * EXCEPT (CustomerName, State, City)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.list_of_orders_CLEAN`;

--2. Order Details Table

--Check for any null values in the columns

SELECT
   count(*)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.order_details`
WHERE
   `Order ID` is null or
   `Amount` is null or
   `Profit` is null or
   `Quantity` is null or
   `Category` is null or
   `Sub-Category` is null;

-- Check for duplicates

SELECT
   `Order ID`,
   `Amount`,
   `Profit`,
   `Quantity`,
   `Category`,
   `Sub-Category`,
   count(*) AS record_count
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.order_details`
GROUP BY
   `Order ID`,
   `Amount`,
   `Profit`,
   `Quantity`,
   `Category`,
   `Sub-Category`
HAVING
   record_count>1;

-- New table after cleaning

CREATE OR REPLACE TABLE
   `helpful-kingdom-469519-f5.e_commerce_data.order_details_final`
AS
SELECT
   TRIM(UPPER(Category)) AS category_CLEAN,
   TRIM(UPPER(`Sub-Category`)) AS sub_category_CLEAN,
   * EXCEPT (`Category`, `Sub-Category`)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.order_details`;




-- Check for duplicates in the new table

SELECT
   category_CLEAN,
   sub_category_CLEAN,
   `Order ID`,
   Amount,
   Profit,
   Quantity,
   COUNT(*) AS record_count
FROM 
 `helpful-kingdom-469519-f5.e_commerce_data.order_details_final`
GROUP BY
   category_CLEAN,
   sub_category_CLEAN,
   `Order ID`,
   Amount,
   Profit,
   Quantity
HAVING
   record_count > 1;
--3. Sales Target Table

-- Check for null values

SELECT
   count(*)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target`
WHERE
   `Month of Order Date` is null or
   `Category` is null or
   `Target` is null;

-- Check for duplicates

SELECT
   `Month of Order Date`,
   `Category`,
   `Target`, 
   count(*) AS record_count
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target`
GROUP BY
   `Month of Order Date`,
   `Category`,
   `Target`
HAVING
   record_count > 1;



--  Inspect the original values in the Month of Order Date column

SELECT
   DISTINCT `Month of Order Date`
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target`
   LIMIT 50;

-- To  convert a non-standard date string

SELECT
   parse_date('%b-%y',`Month of Order Date`) As order_month
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target`;

-- clean and standardize date column by converting a text string like "Jan-21" into string format like "2021-01".

SELECT
   FORMAT_DATE('%Y-%m',PARSE_DATE('%b-%y', `Month of Order Date`)) AS clean_order_month
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target`;

-- Create a new table with cleaned data

CREATE OR REPLACE TABLE
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target_final`
AS
SELECT
   TRIM(UPPER(Category)) AS category_final, 
   FORMAT_DATE('%Y-%m', PARSE_DATE('%b-%y', `Month of Order Date`)) AS clean_order_month,
   * EXCEPT (Category, `Month of Order Date`)
FROM
   `helpful-kingdom-469519-f5.e_commerce_data.sales_target`;

-- Check for duplicates in the new table

SELECT
   category_final,
   clean_order_month,
   `Target`,
   COUNT(*) AS record_count
FROM 
 `helpful-kingdom-469519-f5.e_commerce_data.sales_target_final`
GROUP BY
   category_final,
   clean_order_month,
   `Target`
HAVING
   record_count > 1;

