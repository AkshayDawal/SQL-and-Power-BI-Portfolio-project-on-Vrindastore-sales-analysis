--Overview of Vrindastore sales dataset
-- Total no of orders
SELECT
COUNT(order_id) as total_orders
FROM orders;

-- Total sales
SELECT 
SUM(sales) as total_sales
FROM orders;

-- Total quantity of product sold
SELECT
SUM(quantity) as total_quantity_sold
FROM orders;

--Average profit
SELECT
AVG(profit) as Avg_profit
FROM orders;

--Average Discount
SELECT
AVG(discount) as avg_discount
FROM orders

--Total no of products
SELECT
COUNT(DISTINCT product_name) as no_of_products
FROM orders;

-- Total no of categories
SELECT
COUNT(DISTINCT category) as no_of_category
FROM orders;

--Total no of sub-category
SELECT
COUNT(DISTINCT sub_category)as no_of_sub_category
FROM orders;

--Total years
SELECT 
COUNT(DISTINCT year) as total_years
FROM orders;

--Total countries
SELECT 
COUNT(DISTINCT country) as total_countries
FROM orders;

--Sales performance analysis
SELECT
product_name,
category,
SUM(sales) as Toatl_sales,
SUM(quantity) as Total_quantity_sold
FROM orders
GROUP BY product_name, category
ORDER BY SUM(sales) DESC
LIMIT <= 10;

--sales over year --
SELECT 
year,
SUM(sales) as Total_sales
FROM orders
GROUP BY year
ORDER BY SUM(sales) DESC;

-- customer segmentation --
SELECT
segment,
COUNT(DISTINCT customer_name) as Toatl_customers,
SUM(sales) as Total_sales
FROM orders
GROUP BY segment
ORDER BY SUM(sales) DESC;

-- Shipping and order management --
SELECT
ship_mode,
AVG(shipping_cost) as Avg_shipping_cost,
AVG(profit) as Avg_profit
FROM orders
GROUP BY ship_mode
ORDER BY AVG(profit);

--order processing time analysis
SELECT 
ship_mode, 
AVG(DATE_PART('day', ship_date::timestamp - order_date::timestamp)) as avg_time_gap
FROM orders
GROUP BY ship_mode;

-- profibility and cost analysis 
SELECT
product_name,
category,
sub_category,
AVG(profit) as Avg_profit,
AVG(discount) as Avg_dicount
FROM orders
GROUP BY 
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC;

-- Global sales and quantity product overview 
SELECT
country,
SUM(sales) as Total_sales,
SUM(quantity)  as Total_quantity
FROM orders
GROUP BY country
ORDER BY SUM(sales) DESC;

-- state level category 
SELECT 
product_name,
category,
SUM(quantity) as Total_quantity_sold
FROM orders
GROUP BY 
product_name,
category
ORDER BY SUM(quantity) DESC;

-- Regional subcategory analysis 
SELECT
region,
sub_category,
SUM(quantity) as Total_quantity_sold
FROM orders
GROUP BY region,
sub_category
ORDER BY SUM(quantity) DESC;