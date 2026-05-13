# MYNTRA-SQL-Analysis
SQL analysis of Myntra's product catalog uncovering  pricing trends, brand performance and rating insights  across Nike and Adidas using MySQL.

🛍️ Myntra Product Data Analysis (SQL + Excel)

📌 Project Overview

This project performs end-to-end data analysis on Myntra product data using SQL and Excel.

The objective is to simulate a real-world data analyst workflow by:

Cleaning and preparing data in Excel

Analyzing data using SQL

Creating insights and visualizations using Excel

💡 Business Problem


E-commerce platforms like Myntra manage thousands of products across different brands and categories.

Key business questions:

Q1.Which products are most and least expensive?

Q2.Which products are most popular?

Q3.How do brands like Nike and Adidas perform?

Q4.What price range dominates the market?

This project answers these using data-driven analysis.

🎯 Objectives :
1.Identify pricing trends (high vs low)

2.Analyze product popularity using ratings

3.Compare brand performance

4.Segment products based on price range

5.Generate actionable insights

🛠️ Tools & Technologies :
SQL (MySQL) → Data querying & analysis
Excel → Data cleaning, pivot tables & visualization
GitHub → Project hosting

🔄 Project Workflow:
Data Cleaning (Excel)

Removed inconsistencies

Formatted columns

Prepared structured dataset

Data Analysis (SQL):
Filtering, sorting, ranking
Aggregations and calculations
Visualization (Excel)

📂 Project Files
myntra.sql → SQL queries
products.csv → Dataset
excel_analysis.xlsx → Excel cleaning 

🔍 SQL Analysis : 

🔹 Top 5 Most Expensive Products
SELECT * FROM products 

ORDER BY marked_price DESC 

LIMIT 5;

🔹 Most Popular Products (Weighted Score)

SELECT product_name, rating, rating_count, 

       (rating * rating_count) AS popularity_score
FROM products

ORDER BY popularity_score DESC

LIMIT 5;

🔹 Worst Rated Nike Products

SELECT product_name, rating

FROM products

WHERE brand_tag = 'Nike' AND rating != 0

ORDER BY rating ASC;

🔹 Mid-Range Products (₹1000–₹2000)

SELECT product_name, brand_tag, marked_price

FROM products

WHERE marked_price BETWEEN 1000 AND 2000;

📊 Excel Analysis : 

Excel was used to enhance analysis through cleaning and visualization.

🔧 Tasks Performed:

Data cleaning & formatting

Price distribution analysis

Brand-wise comparison

📈 Key Insights:
1.Most products fall in the ₹1000–₹2000 range

2.Nike and Adidas dominate the t-shirt category

3.Products with higher rating_count are more reliable

4. High price ≠ high rating

📊 SQL Output

SQL Output

📊 Key Insights

1.Mid-range products dominate the market

2.Brand reputation plays a key role in ratings

3.Popularity should be measured using rating × rating_count

4.Expensive products are not always highly rated

🚀 How to Run
Create database:

CREATE DATABASE myntra;

USE myntra;

Import dataset (products.csv)

Run queries from:

myntra.sql


👩‍💻 Author

Shaipshi Aspiring Data Analyst

Skills: SQL | Excel | Python | Power BI

🔗 Add your links:


GitHub - https://github.com/shaipshiverya

LinkedIn - https://www.linkedin.com/in/shaipshi-verya-1b918a162/
