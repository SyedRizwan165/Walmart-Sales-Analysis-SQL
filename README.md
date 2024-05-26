# Walmart Sales Data Analysis

## About

This project aims to analyze Walmart sales data to identify the top-performing branches and products, examine sales trends across different product categories, and understand customer behavior. The goal is to derive insights that can help improve and optimize sales strategies. The dataset used for this analysis was sourced from https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting

## Aim Of The Project

The primary aim of this project is to gain insights into Walmart's sales data to understand the various factors that influence sales across different branches.

## Data Information

The dataset was sourced from the Kaggle Walmart Sales Forecasting Competition. It includes sales transactions from three different Walmart branches, located in Mandalay, Yangon, and Naypyitaw. The dataset comprises 17 columns and 1,000 rows.

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |

### Analysis Category

1. Product Analysis

> Analyze the data to understand the different product lines, identify the top-performing product lines, and determine which product lines need improvement.

2. Sales Analysis

> Examine sales trends to evaluate the effectiveness of various sales strategies and identify necessary modifications to increase sales.

3. Customer Analysis

> Investigate customer segments, purchase trends, and the profitability of each segment to gain insights into customer behavior.

## Approach Used

1. **Data Wrangling:** This initial step involves inspecting the data to detect and address NULL and missing values using appropriate replacement methods.

> 1. Create a database.
> 2. Create tables and insert the data.
> 3. Select columns with null values. Since we set NOT NULL for each field while creating the tables, there are no null values in our database.

2. **Feature Engineering:** This step generates new columns from existing data.

> 1. Add a column named time_of_day to categorize sales into Morning, Afternoon, and Evening, helping to determine which part of the day sees the most sales.
> 2. Add a column named day_name to extract the day of the week (Mon, Tue, Wed, Thu, Fri) for each transaction, helping to identify the busiest day for each branch.
> 3. Add a column named month_name to extract the month (Jan, Feb, Mar) for each transaction, helping to identify the month with the highest sales and profit.

3. **Exploratory Data Analysis (EDA):** Conduct exploratory data analysis to address the project's objectives and answer key questions.

3. **Key Insights:**

### Generic Insights

1. The data consist of 3 cities.
2. A, B and C are the different branches.

### Product Insights

1. There are 6 unique product lines.
2. The most common payment method is found to be 'Cash'.
3. Electronic accessories has the highest selling quantity of 961. 
4. In terms of revenue by month, January has the highest revenue of 116291.8 along with the highest COGS.
5. In terms of product line, Food & Beverages has the largest revenue of 56144.8.
6. Naypyitaw has the largest revenue.
7. Home & Lifestyle has the largest VAT.
8. The product line with the bad remarks are Food and Beverages & Fashion accessories. 
9. Branch A sold more products than the average prodcuts sold.
10. Females are most commonly interested in Fashion accessories & Food and beverages

### Sales Insights

1. Evening time of the day experiences higher amount of sales.
2. Members brings more revenue than the normal customer.
3. Naypyitaw city has the largest VAT percentage
4. Members pays the most in VAT

### Customer Insights

1. There are 2 types of customer; Member and Normal Customer.
2. There are 3 payment method i.e. Cash, Ewallet and Credit cards.
3. Members buys the most as compare to normal customers.
4. Branch A has more Male customers where as branch C has more Female customers.
5. Branch A & C have comparitively higher ratings than branch B
6.  Monday, Tuesday and Friday are the top best days for good ratings even these days doesnot have the highest sales.
7. For branch A, Friday has the highest rating 
   For branch B, Monday has the highest rating 
   For branch C, Saturday has the highest rating
"# walmart-sales-analysis" 
"# walmart-sales-analysis" 
# walmart-sales-analysis
