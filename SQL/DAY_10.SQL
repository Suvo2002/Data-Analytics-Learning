-- ==========================================
-- Day 10: SQL Subqueries
-- PostgreSQL
-- ==========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);


INSERT INTO employees VALUES
(1,'Rahul','IT',50000),
(2,'Ananya','HR',45000),
(3,'Sourav','IT',70000),
(4,'Priya','Finance',65000),
(5,'Riya','IT',80000),
(6,'Amit','HR',40000),
(7,'Arjun','Finance',55000);




-- 1. Employee with the highest salary
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 2. Employee with the lowest salary
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- ==========================================
-- Multi Row Subqueries
-- ==========================================

-- 3. Employees whose salary is above the average salary
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 4. Employees working in departments where salary is above 60000
SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 60000
);

-- ==========================================
-- Correlated Subquery
-- ==========================================

-- 5. Employees earning more than their department average
SELECT *
FROM employees e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- ==========================================
-- EXISTS
-- ==========================================

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50)
);

INSERT INTO projects VALUES
(101,1,'CRM'),
(102,3,'ERP'),
(103,5,'AI Portal');

-- 6. Employees who have projects
SELECT *
FROM employees e
WHERE EXISTS
(
    SELECT 1
    FROM projects p
    WHERE p.emp_id = e.emp_id
);

-- ==========================================
-- NOT EXISTS
-- ==========================================

-- 7. Employees without any project
SELECT *
FROM employees e
WHERE NOT EXISTS
(
    SELECT 1
    FROM projects p
    WHERE p.emp_id = e.emp_id
);

-- ==========================================
-- Practice Queries
-- ==========================================

-- Employees earning above average salary
SELECT emp_name, salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

-- Highest-paid employee in IT
SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'IT'
);

-- Departments having at least one employee with salary above 60000
SELECT DISTINCT department
FROM employees
WHERE department IN
(
    SELECT department
    FROM employees
    WHERE salary > 60000
);