-- ==========================================
-- Day 20: Date & Time Functions
-- PostgreSQL
-- ==========================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 50000, '2022-03-15'),
(2, 'Ananya', 'HR', 45000, '2023-06-20'),
(3, 'Sourav', 'IT', 70000, '2020-01-10'),
(4, 'Priya', 'Finance', 65000, '2021-08-25'),
(5, 'Riya', 'IT', 80000, '2019-11-05'),
(6, 'Amit', 'HR', 40000, '2024-02-12');

-- ==========================================
-- 1. CURRENT_DATE
-- ==========================================

SELECT CURRENT_DATE AS today;

-- ==========================================
-- 2. CURRENT_TIMESTAMP
-- ==========================================

SELECT CURRENT_TIMESTAMP AS current_datetime;

-- ==========================================
-- 3. Extract YEAR
-- ==========================================

SELECT
    emp_name,
    hire_date,
    EXTRACT(YEAR FROM hire_date) AS hire_year
FROM employees;

-- ==========================================
-- 4. Extract MONTH
-- ==========================================

SELECT
    emp_name,
    hire_date,
    EXTRACT(MONTH FROM hire_date) AS hire_month
FROM employees;

-- ==========================================
-- 5. Extract DAY
-- ==========================================

SELECT
    emp_name,
    hire_date,
    EXTRACT(DAY FROM hire_date) AS hire_day
FROM employees;

-- ==========================================
-- 6. AGE()
-- Calculate experience from hire date
-- ==========================================

SELECT
    emp_name,
    hire_date,
    AGE(CURRENT_DATE, hire_date) AS experience
FROM employees;

-- ==========================================
-- 7. Employees hired after 2022
-- ==========================================

SELECT *
FROM employees
WHERE hire_date > '2022-01-01';

-- ==========================================
-- 8. Employees hired in 2020
-- ==========================================

SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2020;

-- ==========================================
-- 9. Employees hired between two dates
-- ==========================================

SELECT *
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';


-- 10. Add days to a date


SELECT
    emp_name,
    hire_date,
    hire_date + INTERVAL '30 days' AS after_30_days
FROM employees;

-- ==========================================
-- 11. Date Difference
-- ==========================================

SELECT
    emp_name,
    CURRENT_DATE - hire_date AS days_worked
FROM employees;


-- 12. Group employees by hiring year


SELECT
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    COUNT(*) AS total_employees
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;




-- 1. Find employees hired before 2021
SELECT *
FROM employees
WHERE hire_date < '2021-01-01';

-- 2. Find employees hired in 2023
SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2023;

-- 3. Find employees with more than 3 years of experience
SELECT
    emp_name,
    hire_date,
    AGE(CURRENT_DATE, hire_date) AS experience
FROM employees
WHERE AGE(CURRENT_DATE, hire_date) > INTERVAL '3 years';

-- 4. Count employees hired in each month
SELECT
    EXTRACT(MONTH FROM hire_date) AS hire_month,
    COUNT(*) AS total_employees
FROM employees
GROUP BY EXTRACT(MONTH FROM hire_date)
ORDER BY hire_month;

-- 5. Find the earliest hired employee
SELECT *
FROM employees
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM employees
);