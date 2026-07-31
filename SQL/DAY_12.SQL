-- ==========================================
-- Day 12: Window Functions
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
(5,'Riya','IT',70000),
(6,'Amit','HR',40000),
(7,'Arjun','Finance',55000),
(8,'Sneha','IT',80000);

-- ==========================================
-- ROW_NUMBER()
-- ==========================================

-- Assign row numbers based on salary
SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

-- ==========================================
-- RANK()
-- ==========================================

SELECT
    emp_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employees;

-- ==========================================
-- DENSE_RANK()
-- ==========================================

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
FROM employees;


-- PARTITION BY
-- ==========================================

SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;

-- ==========================================
-- Running Total
-- ==========================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(
        ORDER BY emp_id
    ) AS running_total
FROM employees;

-- ==========================================
-- Department Average
-- ==========================================

SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS dept_avg
FROM employees;

-- ==========================================
-- NTILE()
-- ==========================================

SELECT
    emp_name,
    salary,
    NTILE(4) OVER(
        ORDER BY salary DESC
    ) AS quartile
FROM employees;

-- ==========================================
-- Practice Queries
-- ==========================================

-- Top 3 highest-paid employees
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;

-- Highest salary employee in each department
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rn
    FROM employees
) t
WHERE rn = 1;

-- Second highest salary in the company
SELECT *
FROM (
    SELECT *,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS dr
    FROM employees
) t
WHERE dr = 2;