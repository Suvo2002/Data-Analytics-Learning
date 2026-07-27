-- ==========================================
-- Day 8: LEFT JOIN, RIGHT JOIN & FULL OUTER JOIN
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
(5, 'Riya', 'Chennai'),
(6, 'Amit', 'Pune');      -- No orders

-- Insert Orders
INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000),
(102, 2, 'Mobile', 20000),
(103, 1, 'Keyboard', 1500),
(104, 3, 'Monitor', 12000),
(105, 5, 'Mouse', 800),
(106, 8, 'Printer', 9000); -- Customer does not exist

-- ==========================================
-- LEFT JOIN
-- ==========================================

-- Show all customers and their orders
SELECT c.customer_name,
       o.product,
       o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Customers without any orders
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ==========================================
-- RIGHT JOIN
-- ==========================================

-- Show all orders and matching customers
SELECT c.customer_name,
       o.product,
       o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Orders with no matching customer
SELECT o.order_id,
       o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- ==========================================
-- FULL OUTER JOIN
-- ==========================================

-- Show every customer and every order
SELECT c.customer_name,
       o.product,
       o.amount
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;

-- Rows with no matching record
SELECT c.customer_name,
       o.product
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
   OR o.customer_id IS NULL;

-- ==========================================
-- Practice Queries
-- ==========================================

-- 1. List all customers and purchased products
SELECT c.customer_name,
       o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 2. Find customers who never placed an order
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 3. Find orders without a valid customer
SELECT o.order_id,
       o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 4. Display all matched and unmatched records
SELECT *
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;