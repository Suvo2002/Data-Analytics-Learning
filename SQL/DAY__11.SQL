-- ==========================================
-- Day 11: Common Table Expressions (CTE)
-- PostgreSQL
-- ==========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

-- Insert Data
INSERT INTO employees VALUES
(1,'Rahul','IT',50000),
(2,'Ananya','HR',45000),
(3,'Sourav','IT',70000),
(4,'Priya','Finance',65000),
(5,'Riya','IT',80000),
(6,'Amit','HR',40000),
(7,'Arjun','Finance',55000);

-- ==========================================
-- Basic CTE
-- ==========================================

WITH emp_cte AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)
SELECT *
FROM emp_cte;

-- ==========================================
-- CTE with Aggregate Function
-- ==========================================

WITH dept_salary AS (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_salary;

-- ==========================================
-- CTE with JOIN
-- ==========================================

WITH dept_salary AS (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.emp_name,
       e.department,
       e.salary,
       d.avg_salary
FROM employees e
JOIN dept_salary d
ON e.department = d.department;

-- ==========================================
-- Employees earning above department average
-- ==========================================

WITH dept_avg AS (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.emp_name,
       e.department,
       e.salary
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;


-- Multiple CTEs


WITH
high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
),
it_employees AS (
    SELECT *
    FROM high_salary
    WHERE department = 'IT'
)
SELECT *
FROM it_employees;

-- ==========================================
-- Practice Queries
-- ==========================================

-- 1. Employees earning more than 55000
WITH emp AS (
    SELECT *
    FROM employees
    WHERE salary > 55000
)
SELECT *
FROM emp;

-- 2. Department-wise maximum salary
WITH max_salary AS (
    SELECT department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM max_salary;

-- 3. Employees earning the maximum salary in each department
WITH max_salary AS (
    SELECT department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department
)
SELECT e.*
FROM employees e
JOIN max_salary m
ON e.department = m.department
AND e.salary = m.highest_salary;