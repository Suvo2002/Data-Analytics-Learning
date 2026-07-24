-- ==========================================
-- Day 5: Aggregate Functions
-- Topics:
-- COUNT(), SUM(), AVG(), MAX(), MIN()
-- ==========================================

-- Create Table
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    age INT
);

-- Insert Sample Data
INSERT INTO employees VALUES
(1,'Rahul','IT',50000,'Kolkata',24),
(2,'Priya','HR',35000,'Delhi',27),
(3,'Amit','Finance',42000,'Mumbai',30),
(4,'Sneha','IT',65000,'Kolkata',26),
(5,'Rohan','Sales',30000,'Pune',25),
(6,'Anjali','HR',38000,'Delhi',29),
(7,'Vikram','IT',70000,'Bangalore',31),
(8,'Neha','Finance',45000,'Mumbai',28),
(9,'Arjun','Sales',32000,'Kolkata',24),
(10,'Pooja','IT',60000,'Delhi',27);

-- ==========================================
-- COUNT()
-- ==========================================

-- Count all employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Count IT employees
SELECT COUNT(*) AS total_it_employees
FROM employees
WHERE department = 'IT';

-- ==========================================
-- SUM()
-- ==========================================

-- Total salary of all employees
SELECT SUM(salary) AS total_salary
FROM employees;

-- Total salary of IT employees
SELECT SUM(salary) AS total_it_salary
FROM employees
WHERE department = 'IT';

-- ==========================================
-- AVG()
-- ==========================================

-- Average salary
SELECT AVG(salary) AS average_salary
FROM employees;

-- Average age
SELECT AVG(age) AS average_age
FROM employees;

-- ==========================================
-- MAX()
-- ==========================================

-- Highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Oldest employee
SELECT MAX(age) AS oldest_age
FROM employees;

-- ==========================================
-- MIN()
-- ==========================================

-- Lowest salary
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- Youngest employee
SELECT MIN(age) AS youngest_age
FROM employees;

-- ==========================================
-- Aggregate Functions with WHERE
-- ==========================================

-- Highest salary in IT department
SELECT MAX(salary) AS highest_it_salary
FROM employees
WHERE department = 'IT';

-- Average salary in Kolkata
SELECT AVG(salary) AS average_salary_kolkata
FROM employees
WHERE city = 'Kolkata';



-- 1. Count employees from Delhi
SELECT COUNT(*) AS delhi_employees
FROM employees
WHERE city = 'Delhi';

-- 2. Count employees with salary > 40000
SELECT COUNT(*) AS employees_above_40000
FROM employees
WHERE salary > 40000;

-- 3. Total salary of Finance department
SELECT SUM(salary) AS finance_salary
FROM employees
WHERE department = 'Finance';

-- 4. Average salary of IT department
SELECT AVG(salary) AS average_it_salary
FROM employees
WHERE department = 'IT';

-- 5. Lowest salary in HR department
SELECT MIN(salary) AS lowest_hr_salary
FROM employees
WHERE department = 'HR';

