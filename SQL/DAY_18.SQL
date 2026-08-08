-- ==========================================
-- Day 18: UNION, UNION ALL, INTERSECT, EXCEPT
-- PostgreSQL
-- ==========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30)
);

-- Insert Data
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 'Kolkata'),
(2, 'Ananya', 'HR', 'Delhi'),
(3, 'Sourav', 'IT', 'Mumbai'),
(4, 'Priya', 'Finance', 'Kolkata'),
(5, 'Riya', 'IT', 'Bangalore');

-- Create Former Employees Table
CREATE TABLE former_employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30)
);

INSERT INTO former_employees VALUES
(6, 'Amit', 'HR', 'Delhi'),
(7, 'Arjun', 'Finance', 'Chennai'),
(3, 'Sourav', 'IT', 'Mumbai'),
(8, 'Neha', 'HR', 'Kolkata');

-- ==========================================
-- UNION
-- Removes duplicate rows
-- ==========================================

SELECT emp_name, department
FROM employees

UNION

SELECT emp_name, department
FROM former_employees;

-- ==========================================
-- UNION ALL
-- Keeps duplicate rows
-- ==========================================

SELECT emp_name, department
FROM employees

UNION ALL

SELECT emp_name, department
FROM former_employees;

-- ==========================================
-- INTERSECT
-- Returns common rows
-- ==========================================

SELECT emp_name, department
FROM employees

INTERSECT

SELECT emp_name, department
FROM former_employees;

-- ==========================================
-- EXCEPT
-- Returns rows from first query
-- that are NOT present in second query
-- ==========================================

SELECT emp_name, department
FROM employees

EXCEPT

SELECT emp_name, department
FROM former_employees;

-- ==========================================
-- UNION with WHERE
-- ==========================================

SELECT emp_name, city
FROM employees
WHERE city = 'Kolkata'

UNION

SELECT emp_name, city
FROM former_employees
WHERE city = 'Kolkata';


-- UNION with ORDER BY


SELECT emp_name, department
FROM employees

UNION

SELECT emp_name, department
FROM former_employees

ORDER BY emp_name;




-- 1. Display all current and former employee names
SELECT emp_name
FROM employees

UNION

SELECT emp_name
FROM former_employees;

-- 2. Display all employees including duplicates
SELECT emp_name
FROM employees

UNION ALL

SELECT emp_name
FROM former_employees;

-- 3. Find employees who appear in both tables
SELECT emp_name
FROM employees

INTERSECT

SELECT emp_name
FROM former_employees;

-- 4. Find current employees who are not in former employees
SELECT emp_name
FROM employees

EXCEPT

SELECT emp_name
FROM former_employees;