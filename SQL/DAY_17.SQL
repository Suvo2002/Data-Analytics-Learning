
-- Day 17: CASE Expression
-- PostgreSQL


-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    experience INT
);

-- Insert Sample Data
INSERT INTO employees VALUES
(1,'Rahul','IT',50000,2),
(2,'Ananya','HR',45000,1),
(3,'Sourav','IT',70000,5),
(4,'Priya','Finance',65000,4),
(5,'Riya','IT',80000,6),
(6,'Amit','HR',40000,1),
(7,'Arjun','Finance',55000,3);


-- Simple CASE


SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;





SELECT
    emp_name,
    department,
    CASE department
        WHEN 'IT' THEN 'Technology'
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'Finance' THEN 'Accounts'
        ELSE 'Other'
    END AS department_type
FROM employees;

-- ==========================================
-- CASE with Experience
-- ==========================================

SELECT
    emp_name,
    experience,
    CASE
        WHEN experience >= 5 THEN 'Senior'
        WHEN experience >= 2 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS experience_level
FROM employees;

-- ==========================================
-- CASE with ORDER BY
-- ==========================================

SELECT
    emp_name,
    department,
    salary
FROM employees
ORDER BY
CASE
    WHEN department = 'IT' THEN 1
    WHEN department = 'Finance' THEN 2
    ELSE 3
END;

-- ==========================================
-- CASE with Aggregate Function
-- ==========================================

SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN salary >= 60000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM employees
GROUP BY department;

-- ==========================================
-- Practice Queries
-- ==========================================

-- 1. Display employee bonus category
SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN '20% Bonus'
        WHEN salary >= 50000 THEN '10% Bonus'
        ELSE '5% Bonus'
    END AS bonus
FROM employees;

-- 2. Show whether salary is above average
SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >
            (SELECT AVG(salary) FROM employees)
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_status
FROM employees;

-- 3. Count employees by salary category
SELECT
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS total
FROM employees
GROUP BY salary_category;