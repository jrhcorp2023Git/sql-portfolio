-- practice.sql: small sales/finance practice database (SQLite)
-- All data is made-up sample data.
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
  region_id   INTEGER PRIMARY KEY,
  region_name TEXT NOT NULL
);

CREATE TABLE customers (
  customer_id   INTEGER PRIMARY KEY,
  customer_name TEXT NOT NULL,
  region_id     INTEGER REFERENCES regions(region_id),
  segment       TEXT,          -- Retail, Corporate, Nonprofit
  signup_date   TEXT           -- YYYY-MM-DD
);

CREATE TABLE products (
  product_id   INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  category     TEXT,
  unit_price   REAL
);

CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  order_date  TEXT,            -- YYYY-MM-DD
  status      TEXT             -- Shipped, Pending, Cancelled
);

CREATE TABLE order_items (
  order_id   INTEGER REFERENCES orders(order_id),
  product_id INTEGER REFERENCES products(product_id),
  quantity   INTEGER,
  discount   REAL              -- 0.10 = 10% off
);

INSERT INTO regions VALUES (1,'Northeast'),(2,'Midwest'),(3,'South'),(4,'West');

INSERT INTO customers VALUES
 (1,'Allegheny Supply',1,'Corporate','2024-01-15'),
 (2,'Three Rivers Cafe',1,'Retail','2024-03-02'),
 (3,'Lakeside Food Bank',2,'Nonprofit','2024-02-20'),
 (4,'Prairie Analytics',2,'Corporate','2024-06-11'),
 (5,'Gulf Coast Goods',3,'Retail','2024-04-05'),
 (6,'Peach State Partners',3,'Corporate','2024-08-19'),
 (7,'Mesa Market',4,'Retail','2024-05-23'),
 (8,'Pacific Literacy Fund',4,'Nonprofit','2024-09-30'),
 (9,'Keystone Ledger Co',1,'Corporate','2025-01-07'),
 (10,'Riverbend Books',NULL,'Retail','2025-02-14');

INSERT INTO products VALUES
 (1,'Laptop Stand','Office',45.00),
 (2,'Wireless Mouse','Office',25.00),
 (3,'Monitor 27in','Electronics',289.99),
 (4,'USB-C Dock','Electronics',149.50),
 (5,'Desk Chair','Furniture',219.00),
 (6,'Standing Desk','Furniture',499.00),
 (7,'Notebook Pack','Supplies',12.50),
 (8,'Printer Paper Case','Supplies',39.95),
 (9,'Noise-Cancel Headset','Electronics',179.00),
 (10,'Filing Cabinet','Furniture',NULL);

INSERT INTO orders VALUES
 (101,1,'2025-01-05','Shipped'),
 (102,2,'2025-01-12','Shipped'),
 (103,3,'2025-01-20','Shipped'),
 (104,4,'2025-02-03','Shipped'),
 (105,1,'2025-02-14','Cancelled'),
 (106,5,'2025-02-28','Shipped'),
 (107,6,'2025-03-10','Shipped'),
 (108,7,'2025-03-15','Pending'),
 (109,8,'2025-03-22','Shipped'),
 (110,9,'2025-04-01','Shipped'),
 (111,1,'2025-04-18','Shipped'),
 (112,4,'2025-05-02','Shipped'),
 (113,2,'2025-05-20','Pending'),
 (114,6,'2025-06-09','Shipped'),
 (115,3,'2025-06-30','Shipped'),
 (116,NULL,'2025-07-04','Shipped');

INSERT INTO order_items VALUES
 (101,3,2,0.00),(101,4,2,0.05),
 (102,7,10,0.00),(102,2,1,0.00),
 (103,8,5,0.10),
 (104,6,1,0.00),(104,5,2,0.10),
 (105,9,3,0.00),
 (106,1,4,0.00),(106,7,6,0.00),
 (107,3,3,0.05),(107,9,3,0.05),
 (108,2,2,0.00),
 (109,8,8,0.15),(109,7,20,0.15),
 (110,4,1,0.00),(110,3,1,0.00),
 (111,5,4,0.10),(111,6,2,0.10),
 (112,9,2,0.00),
 (113,1,1,0.00),
 (114,6,1,0.05),(114,2,5,0.05),
 (115,8,10,0.20),
 (116,7,3,0.00);
