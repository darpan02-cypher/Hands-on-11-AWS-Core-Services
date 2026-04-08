-- Athena SQL Queries for AWS Core Services Hands-on

-- Query 1: First 10 Records
SELECT * FROM your_table
LIMIT 10;

-- Query 2: Orders by Product Category
SELECT product_category, COUNT(*) AS order_count
FROM your_table
GROUP BY product_category
ORDER BY order_count DESC
LIMIT 10;

-- Query 3: Revenue and Quantity by Fulfilment Method
SELECT fulfilment_method,
       COUNT(*) AS total_orders,
       SUM(quantity) AS total_units_sold,
       SUM(revenue) AS total_revenue
FROM your_table
WHERE order_status NOT IN ('Cancelled', 'Pending')
GROUP BY fulfilment_method
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 4: Monthly Sales Trend
SELECT date_format(order_date, '%Y-%m') AS month,
       COUNT(*) AS total_orders,
       SUM(revenue) AS total_revenue
FROM your_table
WHERE order_status NOT IN ('Cancelled', 'Pending')
GROUP BY month
ORDER BY month ASC
LIMIT 10;

-- Query 5: Top 5 Best-Selling SKUs per Category
WITH ranked_skus AS (
  SELECT product_category,
         sku,
         SUM(revenue) AS total_revenue,
         SUM(quantity) AS total_units_sold,
         ROW_NUMBER() OVER (
           PARTITION BY product_category
           ORDER BY SUM(revenue) DESC
         ) AS rank
  FROM your_table
  WHERE order_status NOT IN ('Cancelled', 'Pending')
    AND quantity > 0
  GROUP BY product_category, sku
)
SELECT product_category, sku, total_revenue, total_units_sold, rank
FROM ranked_skus
WHERE rank <= 5
LIMIT 10;
