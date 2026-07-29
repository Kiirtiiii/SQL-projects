-- ========================================================================================================
-- Database and table setup
-- ========================================================================================================
CREATE DATABASE amazon;
USE amazon;
-- Create Table
 CREATE TABLE sales(
 order_id VARCHAR(50) PRIMARY KEY,
 date_ DATE,
 product VARCHAR(50),
 category VARCHAR(50), 
 price INT,
 quantity INT,
 total_sales INT,
 customer_name VARCHAR(60),
 location VARCHAR(70),
 payment VARCHAR(70),
 status_ VARCHAR(50)
 );
-- Data imported from CSV
-- =============================================================================================================
-- Data Exploration
-- ==============================================================================================================
SELECT * FROM sales;
SELECT DISTINCT category FROM sales; 
SELECT DISTINCT location FROM sales;
SELECT * FROM sales WHERE category = 'Electronics';
SELECT category, AVG(price) AS avg_price FROM sales GROUP BY category;
SELECT date_, SUM(total_sales) AS revenue FROM sales GROUP BY date_ ORDER BY date_;
-- =====================================================================================================================
-- Product Analysis
-- =======================================================================================================================
SELECT product, AVG(price) AS average_price FROM sales GROUP BY product;
SELECT product, SUM(total_sales) AS revenue FROM sales WHERE category = 'Electronics' GROUP BY product;
SELECT product, SUM(total_sales) AS revenue FROM sales GROUP BY product HAVING revenue > 1000 ORDER BY revenue DESC;
 -- =======================================================================
 -- Sales Analysis 
 -- =======================================================================
SELECT SUM(total_sales) AS total_revenue FROM sales;
SELECT category, SUM(total_sales) AS revenue FROM sales GROUP BY category ORDER BY revenue DESC;
SELECT product, SUM(total_sales) AS revenue FROM sales GROUP BY product ORDER BY revenue DESC;
SELECT category, product, SUM(total_sales) AS revenue FROM sales GROUP BY category, product ORDER BY category, revenue DESC; 
-- order by shows values in ascending by default when nothing is mentioned
-- =============================================================================================================================
-- Top Products
-- =============================================================================================================================
SELECT category, product, SUM(total_sales) AS revenue FROM sales GROUP BY category, product ORDER BY revenue DESC LIMIT 10 ;
SELECT DISTINCT product, price FROM sales ORDER BY price DESC LIMIT 2;
SELECT DISTINCT product, price FROM sales ORDER BY price ASC LIMIT 2;
-- SHOWS 2 MOST EXPENSIVE AND CHEAPEST PRODUCTS FROM OUR DATASET, USED DISTINCT TO REPETITIVE VALUES.
-- ================================================================================================================================
-- Payment Analysis 
-- ==================================================================================================================================
SELECT payment, COUNT(order_id) AS orders FROM sales GROUP BY payment ORDER BY orders DESC; 
SELECT payment, SUM(total_sales) AS revenue FROM sales GROUP BY payment ORDER BY revenue DESC;
-- revenue by payment method in descending order. 
-- ============================================================================================================================
--  Completed vs Pending orders
-- ================================================================================================================
SELECT status_, COUNT(order_id) AS orders FROM sales GROUP BY status_ ORDER BY orders DESC;
-- shows status of orders and no. of orders in each phase. 
SELECT category, status_, COUNT(order_id) AS orders FROM sales GROUP BY category, status_ ORDER BY orders DESC;
-- shows status of orders and no. of orders in each phase. with category
SELECT category, status_, COUNT(order_id) AS orders FROM sales WHERE status_ = 'pending' GROUP BY category ORDER BY orders DESC LIMIT 10;
-- shows top 10 pending orders with categories.
-- ==========================================================================================================================================
-- quantity analysis
-- ============================================================================================================================================
SELECT category, SUM(quantity) AS quantity_sold FROM sales GROUP BY category;
SELECT category, SUM(quantity) AS quantity_sold FROM sales GROUP BY category ORDER BY quantity_sold DESC LIMIT 2;
-- SHOWS TOP 2 MOST SOLD CATEGORIES. 2 because there are only 5 categories in this dataset.
SELECT category, product, SUM(quantity) AS quantity_sold FROM sales GROUP BY category ,product ;
-- shows  total quantity sold for each product.
SELECT product, SUM(quantity) AS quantity_sold FROM sales GROUP BY product ORDER BY quantity_sold desc;
-- shows top selling products and there quantity.
SELECT product, AVG(quantity) AS avg_quantity FROM sales GROUP BY product;
-- AVERAGE QUANTITY ORDERED

