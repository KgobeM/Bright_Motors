---Revenue sales by make and model---

SELECT
      make,
      model,
SUM(sellingprice) AS total_revenue,
FROM bright.sales.cars
GROUP BY make, model
ORDER BY total_revenue DESC;

---Sales Distribution by Year and Fuel Type---
 
SELECT 
    saledate,
    transmission,
    SUM(mmr) AS units_sold,
    SUM(mmr * sellingprice) AS revenue
FROM bright.sales.cars
GROUP BY saledate, transmission
ORDER BY saledate, transmission;

---Regional Performance City or Province---

SELECT 
    state,
    SUM(mmr) AS units_sold,
    SUM(mmr* sellingprice) AS total_revenue
FROM bright.sales.cars
GROUP BY state
ORDER BY total_revenue DESC;

---Average Selling Price Trends Over Time---

SELECT
    AVG(sellingprice) AS avg_price
FROM bright.sales.cars
GROUP BY saledate
ORDER BY saledate;

---Calculate Profit Margin & Categorize Performance Tier---

SELECT
    make,
    model,
    sellingprice,
    ROUND((sellingprice) / sellingprice, 4) AS profit_margin,

    CASE
        WHEN (sellingprice) / sellingprice >= 75000 THEN 'High Margin'
        WHEN (sellingprice) / sellingprice >= 50000 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS margin_tier
FROM bright.sales.cars;

---Group by Month---


SELECT (SaleDate) AS DayOfWeek,
       SUM(mmr) AS total_revenue
FROM bright.sales.cars
GROUP BY (SaleDate);
