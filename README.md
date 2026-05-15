# MYNTRA-SQL-Analysis
SQL analysis of Myntra's product catalog uncovering  pricing trends, brand performance and rating insights  across Nike and Adidas using MySQL.

---

## 📂 Files in This Repo
| File | Description |
|------|-------------|
| `PROJECT1SQL.sql` | All 16 SQL queries with comments |
| `products.csv` | Raw Myntra product dataset |

---

## 🛠️ Tech Stack
| Tool | Purpose |
|------|---------|
| MySQL | Querying & Analysis |
| Excel | Data Cleaning & Visualization |
| GitHub | Version Control |

---

## 🔄 Project Phases

### 💰 Phase 1 — Price Intelligence

#### 🏷️ Most & Least Expensive Products
```sql
-- Most Expensive
SELECT * FROM products
ORDER BY discounted_price DESC;

-- Least Expensive
SELECT * FROM products
ORDER BY discounted_price ASC;

-- Top 5 Most Expensive
SELECT * FROM products
ORDER BY discounted_price DESC LIMIT 5;
```

#### 🎯 Offset Queries — Specific Rankings
```sql
-- 2nd Most Expensive
SELECT product_name, rating,
rating_count, discounted_price
FROM products
ORDER BY discounted_price DESC LIMIT 1,1;

-- 2nd Least Expensive
SELECT product_name, rating,
rating_count, discounted_price
FROM products
ORDER BY discounted_price ASC LIMIT 1,1;

-- 10th Most Expensive
SELECT product_name, rating,
rating_count, discounted_price
FROM products
ORDER BY discounted_price DESC LIMIT 9,1;
```

---

### ⭐ Phase 2 — Rating Intelligence

#### 🔥 Weighted Popularity Score
```sql
-- Top 5 Products by Combined Rating
SELECT product_name, rating, rating_count,
    ROUND(rating * rating_count) AS comb_rating
FROM products
ORDER BY comb_rating DESC LIMIT 5;
```

#### 👟 Worst Rated Nike Products
```sql
-- Including zero ratings
SELECT product_name, rating, rating_count,
    ROUND(rating * rating_count) AS comb_rating
FROM products
WHERE brand_tag = 'nike'
ORDER BY comb_rating ASC LIMIT 5;

-- Excluding zero ratings (cleaner analysis)
SELECT product_name, rating, rating_count,
    ROUND(rating * rating_count) AS comb_rating
FROM products
WHERE brand_tag = 'nike'
AND rating != 0
ORDER BY comb_rating ASC LIMIT 5;
```

---

### 👕 Phase 3 — Category Deep Dive (Tshirts)

#### 🏆 Top 10 Best Rated Nike & Adidas Tshirts
```sql
SELECT product_name, rating, rating_count,
    brand_tag, discounted_price,
    ROUND(rating * rating_count) AS comb_rating
FROM products
WHERE brand_tag IN ('nike','adidas')
AND product_tag = 'tshirts'
ORDER BY comb_rating DESC LIMIT 10;
```

#### 📉 Worst Rated Tshirts (Min 100 Reviews)
```sql
SELECT product_name, rating, rating_count,
    brand_tag, discounted_price, product_link
FROM products
WHERE product_tag = 'tshirts'
AND rating_count > 100
ORDER BY rating ASC LIMIT 20;
```

#### 🔤 Alphabetical Sort — Last 10 Products
```sql
SELECT * FROM products
ORDER BY product_name ASC LIMIT 10;
```

---

### 💸 Phase 4 — Price Segmentation

#### 🎯 Mid Range Products ₹1000–₹1200
```sql
SELECT product_name, rating,
    rating_count, brand_tag, discounted_price
FROM products
WHERE brand_tag IN ('nike','adidas')
    AND product_tag = 'tshirts'
    AND discounted_price BETWEEN 1000 AND 1200
ORDER BY brand_tag ASC,
         discounted_price ASC;
```

#### 📊 Wider Range ₹1000–₹2000
```sql
SELECT product_name, rating,
    rating_count, brand_tag, discounted_price
FROM products
WHERE brand_tag IN ('nike','adidas')
    AND product_tag = 'tshirts'
    AND discounted_price BETWEEN 1000 AND 2000
ORDER BY discounted_price ASC,
         brand_tag ASC;
```

---

## 💡 Key Business Insights

> 👟 **Nike** = Best performing brand with highest
>    combined ratings & premium pricing power
>
> 📈 **Adidas** = Needs to grow in mid-range
>    segment (₹1000–₹2000) to compete with Nike
>
> 👕 **Tshirts** = Most competitive & analyzed
>    category on Myntra
>
> ⭐ **rating × rating_count** = Better popularity
>    metric than raw rating alone
>
> 💰 **High price ≠ High rating** — Premium
>    products don't always satisfy customers
>
> 🚀 **Recommendation: Adidas should improve
>    product quality in tshirt segment** to
>    close the gap with Nike

---

## 🧠 SQL Concepts Used
| Concept | Used For |
|---------|---------|
| `ORDER BY + LIMIT` | Price Rankings |
| `LIMIT x,1` | Offset-based Ranking |
| `ROUND()` | Weighted Rating Score |
| `WHERE + AND` | Multi-condition Filtering |
| `IN ()` | Multi-brand Filtering |
| `BETWEEN` | Price Range Segmentation |
| `!=` | Excluding Zero Ratings |

---

## 🚀 How to Run
```sql
-- Step 1: Create Database
CREATE DATABASE myntra;
USE myntra;

-- Step 2: Import products.csv

-- Step 3: Run PROJECT1SQL.sql
```

---

## 🔮 Future Scope
- 📊 Power BI Dashboard for brand comparison
- 🐍 Python (Pandas) for deeper EDA
- 🤖 ML-based product recommendation system
- 📈 Price elasticity analysis

---

## 👩‍💻 About Me
**Shaipshi** — Aspiring Data Analyst
`SQL` `Python` `Power BI` `Excel`

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/shaipshi-verya-1b918a162/)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/shaipshiverya)
