-- Week 1: SELECT and filtering (SQLite)
-- Database: data/practice.sql (made-up sample sales data)

-- Warm-up: row count per table
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;

-- Exercise 1: Corporate customers, sorted by name
SELECT customer_name, segment FROM customers
WHERE segment = 'Corporate' ORDER BY customer_name;

-- Exercise 2: Products priced over $150, most to least expensive
SELECT product_name, category, unit_price FROM products
WHERE unit_price > '150.00' ORDER BY unit_price DESC;

-- Exercise 3: Orders placed in March 2025
SELECT order_id, order_date, status FROM orders
WHERE order_date BETWEEN '2025-03-01' and '2025-03-31' ORDER BY order_date ASC;

-- Exercise 4: Pending or Cancelled orders
SELECT order_id, order_date, status FROM orders
WHERE status = 'Pending' or status = 'Cancelled' ORDER BY order_date ASC;

-- Exercise 5: Customers with no region
SELECT customer_id, customer_name, region_id FROM customers
WHERE region_id IS NULL  ORDER BY customer_id ASC;

-- Exercise 6: Products with "Desk" in the name
SELECT product_id, product_name, category FROM products
WHERE product_name like '%desk%' ORDER BY product_id ASC;

-- Exercise 7: Three most expensive products
SELECT product_name, category, unit_price FROM products
ORDER BY unit_price DESC LIMIT 3;

-- Exercise 8: Each product category once, alphabetical
SELECT DISTINCT category FROM products ORDER by category;

-- Exercise 9: Electronics prices with 7% tax
SELECT product_name, unit_price, round(unit_price * 1.07, 2) as tax_amount FROM products
where category = 'Electronics';

-- Exercise 10 (trap): Products priced other than $45, including unknown prices
SELECT product_name, unit_price, round(unit_price * 1.07, 2) as tax_amount FROM products
where unit_price <> 45.0 or unit_price is NULL;
