CREATE DATABASE sales;

USE sales;

DROP TABLE sales;

CREATE TABLE sales(
    id INT,
    order_id VARCHAR(255),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(255),
    customer_id VARCHAR(255),
    customer_name VARCHAR(255),
    sales_agent_id INT,
    country VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code INT,
    region VARCHAR(255),
    product_id VARCHAR(255),
    category VARCHAR(255),
    sub_category VARCHAR(255),
    product_name VARCHAR(255),
    sales VARCHAR(255),
    quantity INT
);

-- Use some sql editor to upload the csv file into the table.
-- I used Heidisql. You google and see what works the best for you and use that.

SELECT *
FROM sales;

-- finding category with most sales
SELECT category, SUM(sales)
FROM sales
GROUP BY category
ORDER BY SUM(sales) DESC;

-- sub_category that produces highest sales with technology as category 
SELECT SUB_category, SUM(sales)
FROM sales
WHERE category='Technology'
GROUP BY SUB_category
ORDER BY SUM(sales) DESC;

-- sub_category that produces highest sales with furniture as category 
SELECT SUB_category, SUM(sales)
FROM sales
WHERE category='Furniture'
GROUP BY SUB_category
ORDER BY SUM(sales) DESC;

-- sub_category that produces highest sales with office supplies as category 
SELECT SUB_category, SUM(sales)
FROM sales
WHERE category='Office Supplies'
GROUP BY SUB_category
ORDER BY SUM(sales) DESC;

-- region wise sales
SELECT region, SUM(sales)
FROM sales
GROUP BY region
ORDER BY SUM(sales) DESC;

-- state-wise sales
SELECT state, SUM(sales)
FROM sales
GROUP BY state
ORDER BY SUM(sales) DESC;

-- city-wise sales
SELECT city, SUM(sales)
FROM sales
GROUP BY city
ORDER BY SUM(sales) DESC;

-- most common shipping mode
SELECT ship_mode, COUNT(ship_mode)
FROM sales
GROUP BY ship_mode
ORDER BY COUNT(ship_mode) DESC;

-- top 10 customers who gave most sales
SELECT customer_name, SUM(sales)
FROM sales
GROUP BY customer_name
ORDER BY SUM(sales) DESC
LIMIT 10;

-- sales agent with most sales
SELECT sales_agent_id, SUM(sales)
FROM sales
GROUP BY sales_agent_id
ORDER BY SUM(sales) DESC
LIMIT 10;

-- most sold products category-wise
SELECT category, SUM(quantity)
FROM sales
GROUP BY category
ORDER BY SUM(quantity) DESC;

-- most sold products sub_category-wise where category is 'Office Supplies'
SELECT sub_category, SUM(quantity)
FROM sales
WHERE category='Office Supplies'
GROUP BY sub_category
ORDER BY SUM(quantity) DESC;

-- most sold products sub_category-wise where category is 'Furniture'
SELECT sub_category, SUM(quantity)
FROM sales
WHERE category='Furniture'
GROUP BY sub_category
ORDER BY SUM(quantity) DESC;

-- most sold products sub_category-wise where category is 'Technology'
SELECT sub_category, SUM(quantity)
FROM sales
WHERE category='Technology'
GROUP BY sub_category
ORDER BY SUM(quantity) DESC;

-- sales done month-wise
SELECT MONTH(order_date), SUM(sales)
FROM sales
WHERE YEAR(order_date)=2019
GROUP BY MONTH(order_date)
ORDER BY SUM(sales) DESC;

-- sales done year-wise
SELECT YEAR(order_date), SUM(sales)
FROM sales
GROUP BY YEAR(order_date)
ORDER BY SUM(sales) DESC;