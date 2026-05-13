CREATE DATABASE MYNTRA;

USE MYNTRA;

/*
===============================================================================
Myntra Data Analysis Project
Author: Shaipshi
Description: This project analyzes an e-commerce product dataset Myntra
			 to extract pricing, rating, and brand-based insights. 
Database: PostgreSQL / MySQL Compatible
===============================================================================
*/

-- ============================================================================
-- 1. EXPLORATORY DATA ANALYSIS (EDA)
-- ============================================================================

-- Q1. Find the most expensive product on Myntra.
SELECT * FROM products ORDER BY discounted_price DESC;

-- Q2. Find the least expensive product on Myntra.
SELECT * FROM products ORDER BY discounted_price ASC;

-- Q3. Find the top 5 most expensive products on Myntra.
SELECT  * FROM products ORDER BY discounted_price DESC LIMIT 5;

-- Q4. Find the top 5 products based on rating * rating_count.
SELECT product_name, rating, rating_count,
       ROUND(rating * rating_count) AS comb_rating
FROM products
ORDER BY comb_rating DESC LIMIT 5;

-- Q5. List tshirts ordered by combined rating.
SELECT* FROM products
WHERE product_tag = 'tshirts'
ORDER BY rating * rating_count DESC;

-- Q6. Find the second most expensive product.
SELECT product_name, rating, rating_count, discounted_price
FROM products
ORDER BY  discounted_price DESC LIMIT 1,1;

-- Q7. Find the second least expensive product.
SELECT  product_name, rating, rating_count, discounted_price
FROM products
ORDER BY discounted_price ASC LIMIT 1,1;

-- Q8. Find the 10th most expensive product.
SELECT  product_name, rating, rating_count, discounted_price
FROM products
ORDER BY discounted_price DESC LIMIT 9,1;

-- Q9. Find the worst-rated Nike product.
SELECT product_name, rating, rating_count,
       ROUND(rating * rating_count) AS comb_rating
FROM products
WHERE brand_tag = 'nike'
ORDER BY comb_rating ASC LIMIT 5;

-- Q10. Find the worst-rated Nike product where rating is not zero.
SELECT  product_name, rating, rating_count,
       ROUND(rating * rating_count) AS comb_rating
FROM products
WHERE brand_tag = 'nike' AND rating != 0
ORDER BY comb_rating ASC LIMIT 5;

-- Q11. Find the top 10 best-rated tshirts from Nike or Adidas.
SELECT product_name, rating, rating_count, brand_tag, discounted_price,
       ROUND(rating * rating_count) AS comb_rating
FROM products
WHERE brand_tag IN ('nike','adidas') AND product_tag = 'tshirts'
ORDER BY comb_rating DESC LIMIT 10;

-- Q12. Find the 10 worst-rated products with at least 100 ratings.
SELECT  product_name, rating, rating_count, brand_tag, product_tag,
       discounted_price, product_link
FROM products
WHERE rating_count > 100
ORDER BY rating ASC LIMIT 20;

-- Q13. Find the 10 worst-rated tshirts with at least 100 ratings.
SELECT product_name, rating, rating_count, brand_tag, discounted_price,
       product_link
FROM products
WHERE  product_tag = 'tshirts' AND rating_count > 100
ORDER BY rating ASC LIMIT 20;

-- Q14. Sort products alphabetically and show last 10.
SELECT * FROM products
ORDER BY  product_name ASC LIMIT 10;

-- Q15. List Nike & Adidas tshirts priced between 1000–1200 sorted by brand & price.
SELECT product_name, rating, rating_count, brand_tag, discounted_price
FROM products
WHERE brand_tag IN ('nike','adidas')
  AND product_tag = 'tshirts'
  AND discounted_price BETWEEN 1000 AND 1200
ORDER BY brand_tag ASC, discounted_price ASC;

-- Q16. List Nike & Adidas tshirts priced between 1000–2000 sorted by price & brand.
SELECT product_name, rating, rating_count, brand_tag, discounted_price
FROM products
WHERE brand_tag IN ('nike','adidas')
  AND product_tag = 'tshirts'
  AND discounted_price BETWEEN 1000 AND 2000
ORDER BY discounted_price ASC, brand_tag ASC;


/*
================================================================
END OF PROJECT
Insights:
1. Nike is the best-performing brand with highest combined
   ratings and strong premium pricing.
2. Adidas needs to grow by improving ratings and visibility
   in the competitive mid-range (₹1000-2000) segment.
3. Tshirts are the most analyzed category, confirming it is
   the highest-demand segment for both Nike and Adidas.
4. Zero-rated products damage brand credibility and must be
   removed or pushed for customer reviews immediately.
5. Mid-range price band (₹1000-2000) is the biggest
   opportunity for Adidas to capture budget-conscious buyers.
6. Recommendation: Adidas should focus on improving product
   quality and ratings in tshirts to close the gap with Nike.
================================================================
*/

 
