# Week 1: SELECT and Filtering

Queries written by John Hughes in DB Browser for SQLite against the practice sales database in `data/practice.sql`. All data is made up. Results below were produced by running each query against that database.

## Warm-up: row count per table

```sql
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;
```

| table_name | row_count |
|---|---|
| customers | 10 |
| products | 10 |
| orders | 16 |
| order_items | 25 |

_4 row(s)_

## Exercise 1: Corporate customers, sorted by name

```sql
SELECT customer_name, segment FROM customers
WHERE segment = 'Corporate' ORDER BY customer_name;
```

| customer_name | segment |
|---|---|
| Allegheny Supply | Corporate |
| Keystone Ledger Co | Corporate |
| Peach State Partners | Corporate |
| Prairie Analytics | Corporate |

_4 row(s)_

## Exercise 2: Products priced over $150, most to least expensive

```sql
SELECT product_name, category, unit_price FROM products
WHERE unit_price > '150.00' ORDER BY unit_price DESC;
```

| product_name | category | unit_price |
|---|---|---|
| Standing Desk | Furniture | 499.0 |
| Monitor 27in | Electronics | 289.99 |
| Desk Chair | Furniture | 219.0 |
| Noise-Cancel Headset | Electronics | 179.0 |

_4 row(s)_

## Exercise 3: Orders placed in March 2025

```sql
SELECT order_id, order_date, status FROM orders
WHERE order_date BETWEEN '2025-03-01' and '2025-03-31' ORDER BY order_date ASC;
```

| order_id | order_date | status |
|---|---|---|
| 107 | 2025-03-10 | Shipped |
| 108 | 2025-03-15 | Pending |
| 109 | 2025-03-22 | Shipped |

_3 row(s)_

## Exercise 4: Pending or Cancelled orders

```sql
SELECT order_id, order_date, status FROM orders
WHERE status = 'Pending' or status = 'Cancelled' ORDER BY order_date ASC;
```

| order_id | order_date | status |
|---|---|---|
| 105 | 2025-02-14 | Cancelled |
| 108 | 2025-03-15 | Pending |
| 113 | 2025-05-20 | Pending |

_3 row(s)_

## Exercise 5: Customers with no region

```sql
SELECT customer_id, customer_name, region_id FROM customers
WHERE region_id IS NULL  ORDER BY customer_id ASC;
```

| customer_id | customer_name | region_id |
|---|---|---|
| 10 | Riverbend Books | NULL |

_1 row(s)_

## Exercise 6: Products with "Desk" in the name

```sql
SELECT product_id, product_name, category FROM products
WHERE product_name like '%desk%' ORDER BY product_id ASC;
```

| product_id | product_name | category |
|---|---|---|
| 5 | Desk Chair | Furniture |
| 6 | Standing Desk | Furniture |

_2 row(s)_

## Exercise 7: Three most expensive products

```sql
SELECT product_name, category, unit_price FROM products
ORDER BY unit_price DESC LIMIT 3;
```

| product_name | category | unit_price |
|---|---|---|
| Standing Desk | Furniture | 499.0 |
| Monitor 27in | Electronics | 289.99 |
| Desk Chair | Furniture | 219.0 |

_3 row(s)_

## Exercise 8: Each product category once, alphabetical

```sql
SELECT DISTINCT category FROM products ORDER by category;
```

| category |
|---|
| Electronics |
| Furniture |
| Office |
| Supplies |

_4 row(s)_

## Exercise 9: Electronics prices with 7% tax

```sql
SELECT product_name, unit_price, round(unit_price * 1.07, 2) as tax_amount FROM products
where category = 'Electronics';
```

| product_name | unit_price | tax_amount |
|---|---|---|
| Monitor 27in | 289.99 | 310.29 |
| USB-C Dock | 149.5 | 159.97 |
| Noise-Cancel Headset | 179.0 | 191.53 |

_3 row(s)_

## Exercise 10 (trap): Products priced other than $45, including unknown prices

```sql
SELECT product_name, unit_price, round(unit_price * 1.07, 2) as tax_amount FROM products
where unit_price <> 45.0 or unit_price is NULL;
```

| product_name | unit_price | tax_amount |
|---|---|---|
| Wireless Mouse | 25.0 | 26.75 |
| Monitor 27in | 289.99 | 310.29 |
| USB-C Dock | 149.5 | 159.97 |
| Desk Chair | 219.0 | 234.33 |
| Standing Desk | 499.0 | 533.93 |
| Notebook Pack | 12.5 | 13.38 |
| Printer Paper Case | 39.95 | 42.75 |
| Noise-Cancel Headset | 179.0 | 191.53 |
| Filing Cabinet | NULL | NULL |

_9 row(s)_
