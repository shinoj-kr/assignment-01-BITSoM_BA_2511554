## Part 5 — Data Lakes & DuckDB
## .1 — Cross-Format Queries

-- Q1: List all customers along with the total number of orders they have placed

duckdb.query("""
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM 'datasets/customers.csv' c
LEFT JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC
""").show()


-- Q2: Find the top 3 customers by total order value

duckdb.query("""
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_value
FROM 'datasets/customers.csv' c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_value DESC
LIMIT 3
""").show()


-- Q3: List all products purchased by customers from Bangalore


duckdb.query("""
SELECT DISTINCT
    c.customer_id,
    c.name,
    p.product_name
FROM 'datasets/customers.csv' c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
JOIN 'datasets/products.parquet' p
    ON o.order_id = p.order_id
WHERE c.city = 'Bangalore'
ORDER BY c.name
""").show()


-- Q4: Join all three files to show: customer name, order date, product name, and quantity

duckdb.query("""
SELECT 
    c.name,
    o.order_date,
    p.product_name,
    p.quantity
FROM 'datasets/customers.csv' c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
JOIN 'datasets/products.parquet' p
    ON o.order_id = p.order_id
ORDER BY o.order_date DESC
""").show()


