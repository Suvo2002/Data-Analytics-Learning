-- ==========================================
-- Day 13: SQL Views
-- PostgreSQL
-- ==========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30)
);

-- Insert Data
INSERT INTO employees VALUES
(1,'Rahul','IT',50000,'Kolkata'),
(2,'Ananya','HR',45000,'Delhi'),
(3,'Sourav','IT',70000,'Mumbai'),
(4,'Priya','Finance',65000,'Kolkata'),
(5,'Riya','IT',80000,'Bangalore'),
(6,'Amit','HR',40000,'Delhi'),
(7,'Arjun','Finance',55000,'Chennai');

-- ==========================================
-- Create a Simple View
-- ==========================================

CREATE VIEW employee_details AS
SELECT emp_id,
       emp_name,
       department,
       salary
FROM employees;

-- Display the View
SELECT * FROM employee_details;

-- ==========================================
-- View with Condition
-- ==========================================

CREATE VIEW high_salary_employees AS
SELECT emp_name,
       department,
       salary
FROM employees
WHERE salary > 60000;

SELECT * FROM high_salary_employees;

-- ==========================================
-- View with Aggregate Function
-- ==========================================

CREATE VIEW department_summary AS
SELECT department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

SELECT * FROM department_summary;

-- ==========================================
-- Replace a View
-- ==========================================

CREATE OR REPLACE VIEW employee_details AS
SELECT emp_id,
    emp_name,
    department,
    salary,
    city
FROM employees;

SELECT * FROM employee_details;

-- ==========================================
-- Drop a View
-- ==========================================

DROP VIEW high_salary_employees;


-- Practice Queries


-- 1. Create a view for IT employees
CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';

SELECT * FROM it_employees;

-- 2. Create a view for employees from Kolkata
CREATE VIEW kolkata_employees AS
SELECT emp_name,
    department
FROM employees
WHERE city = 'Kolkata';

SELECT * FROM kolkata_employees;

-- 3. Create a department salary summary view
CREATE VIEW dept_salary_summary AS
SELECT department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;

SELECT * FROM dept_salary_summary;