
# Create Database
CREATE DATABASE WalmartSales;

# Create Table
CREATE TABLE sales(
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_prct  FLOAT(11, 9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- ==================== Feature Engineering =============================

-- Data cleaning
SELECT
	*
FROM sales;

-- Add the time of day column
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- Add the name of the day column
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
UPDATE sales
SET day_name = DAYNAME(date);

-- Add the month name column
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);
UPDATE sales
SET month_name = MONTHNAME(date);

-- ======================= Generic Question ==========================

-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM sales;
# The data consists 3 cities

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM sales;

-- ========================== Product Analysis ========================

-- How many unique product lines does the data have?
SELECT
	COUNT(DISTINCT product_line)
FROM sales;
# There are 6 unique product lines

-- What is the most common payment method? 
SELECT
    payment,
    COUNT(payment) AS count
FROM sales
GROUP BY payment
ORDER BY count DESC;
# The most common payment method is Cash

-- What is the most selling product line?
SELECT
	SUM(quantity) as quantity,
    product_line
FROM sales
GROUP BY product_line
ORDER BY quantity DESC;
# Electronic accessories has the highest selling quantity of 961.

-- What is the total revenue by month?
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue DESC;
# January has the highest revenue of 116291.8

-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs DESC;
# January has the highest COGS. 

-- What product line has the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
# Food & Beverages has the largest revenue of 56144.8

-- What is the city with the largest revenue?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue DESC;
# Naypyitaw has the largest revenue

-- What product line has the largest VAT?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;
# Home & Lifestyle has the largest VAT

-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales

SELECT 
	AVG(quantity) AS avg_quantity
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 5.4995 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;
# Food and Beverages & Fashion accessories has the bad remark

-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);
# branch A sold more products than the average products sold.

-- What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_count
FROM sales
GROUP BY gender, product_line
ORDER BY total_count DESC;
# Females are most commonly interested in Fashion accessories & Food and beverages

-- What is the average rating of each product line
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- ========================== Sales Analysis ==========================

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
    day_name,
	COUNT(*) AS total_sales
FROM sales
#WHERE day_name = "Sunday"
GROUP BY day_name, time_of_day
ORDER BY day_name DESC;
# Evening time of the day experiences higher amount of sales.

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
	SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;
# Members brings more revenue

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;
# Naypyitaw has the largest VAT percentage

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax DESC;
# Members pays the most in VAT.

-- ==================== Customers Analysis =============================

-- How many unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM sales;
# There are 2 types of customer

-- How many unique payment methods does the data have?
SELECT
	DISTINCT payment
FROM sales;
# There are 3 payment method i.e. Cash, Ewallet and Credit cards.

-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;
# Approximately both of the types of customer are same.

-- Which customer type buys the most?
SELECT
	customer_type,
    COUNT(*) AS number_of_customers 
FROM sales
GROUP BY customer_type;
# Members buys the most as compare to normal customers.

-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_count
FROM sales
GROUP BY gender
ORDER BY gender_count DESC;
# Both Male and Female are same number of customers.

-- What is the gender distribution per branch?
SELECT
    branch,
	gender,
	COUNT(*) as gender_count
FROM sales
GROUP BY gender, branch
ORDER BY branch, gender_count DESC;
# Branch A has more More customers where as branch C has more Female customers. 

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;
#Time of the day doesnot effect the rating. 

-- Which time of the day do customers give most ratings per branch?
SELECT
    branch,
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day, branch
ORDER BY avg_rating DESC;
#Branch A & C have comparitively higher ratings than branch B. 

-- Which day of the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;
# Monday, Tuesday and Friday are the top best days for good ratings
# lets see how many sales are made on these days
SELECT
    day_name,
	COUNT(*) AS total_sales
FROM sales
GROUP BY day_name 
ORDER BY total_sales;
# Even these days doesnot have the highest sales, they still have the best rating. 

-- Which day of the week has the best average ratings per branch?
SELECT 
    branch,
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name, branch
ORDER BY avg_rating DESC;
# For branch A, Friday has the highest rating 
# For branch B, Monday has the highest rating 
# For branch C, Saturday has the highest rating
-- ==================================================================================

