-- ==========================================
-- Day 7: INNER JOIN
-- PostgreSQL
-- ==========================================

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

-- Insert Customers
INSERT INTO customers VALUES
(1, 'Rahul', 'Kolkata'),
(2, 'Ananya', 'Delhi'),
(3, 'Sourav', 'Mumbai'),
(4, 'Priya', 'Bangalore'),
(5, 'Riya', 'Chennai');

-- Insert Orders
INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000),
(102, 2, 'Mobile', 20000),
(103, 1, 'Keyboard', 1500),
(104, 3, 'Monitor', 12000),
(105, 5, 'Mouse', 800);

-- INNER JOIN Examples


-- 1. Show customer name with product purchased
SELECT c.customer_name, o.product
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 2. Show customer name, city and amount
SELECT c.customer_name,
    c.city,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 3. Show all order details with customer information
SELECT *
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 4. Show orders above 10000
SELECT c.customer_name,
    o.product,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 10000;

-- 5. Sort by highest order amount
SELECT c.customer_name,
    o.product,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- 6. Total purchase amount of each customer
SELECT c.customer_name,
    SUM(o.amount) AS total_purchase
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 7. Customers whose total purchase is above 30000
SELECT c.customer_name,
    SUM(o.amount) AS total_purchase
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 30000;