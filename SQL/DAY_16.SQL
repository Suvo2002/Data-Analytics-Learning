-- ==========================================
-- Day 16: SQL Indexes
-- PostgreSQL
-- ==========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO employees VALUES
(1,'Rahul','IT','Kolkata',50000),
(2,'Ananya','HR','Delhi',45000),
(3,'Sourav','IT','Mumbai',70000),
(4,'Priya','Finance','Kolkata',65000),
(5,'Riya','IT','Bangalore',80000),
(6,'Amit','HR','Delhi',40000),
(7,'Arjun','Finance','Chennai',55000);

-- ==========================================
-- Create a Single-Column Index
-- ==========================================

CREATE INDEX idx_department
ON employees(department);

-- Query using the index
SELECT *
FROM employees
WHERE department = 'IT';

-- ==========================================
-- Create an Index on Salary
-- ==========================================

CREATE INDEX idx_salary
ON employees(salary);

SELECT *
FROM employees
WHERE salary > 60000;

-- ==========================================
-- Create a Composite Index
-- ==========================================

CREATE INDEX idx_dept_city
ON employees(department, city);

SELECT *
FROM employees
WHERE department = 'IT'
AND city = 'Mumbai';


-- List All Indexes


SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'employees';

-- ==========================================
-- Drop an Index
-- ==========================================

DROP INDEX idx_salary;

-- ==========================================
-- Practice Queries


-- 1. Find employees in HR
SELECT *
FROM employees
WHERE department = 'HR';

-- 2. Find employees from Kolkata
SELECT *
FROM employees
WHERE city = 'Kolkata';

-- 3. Find employees with salary greater than 50000
SELECT *
FROM employees
WHERE salary > 50000;

-- 4. Find IT employees in Bangalore
SELECT *
FROM employees
WHERE department = 'IT'
AND city = 'Bangalore';





EXPLAIN
SELECT *
FROM employees
WHERE department = 'IT';