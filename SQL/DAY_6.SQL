
-- Day 6: GROUP BY & HAVING
-- PostgreSQL


-- Create Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary DECIMAL(10,2)
);


INSERT INTO employees VALUES
(1,'Rahul','IT','Kolkata',50000),
(2,'Ananya','HR','Delhi',45000),
(3,'Sourav','IT','Mumbai',70000),
(4,'Priya','Finance','Kolkata',65000),
(5,'Amit','HR','Delhi',40000),
(6,'Riya','IT','Bangalore',80000),
(7,'Arjun','Finance','Chennai',55000),
(8,'Neha','HR','Delhi',48000),
(9,'Rohan','IT','Mumbai',60000);

-- 1. Count employees in each department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 2. Average salary of each department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 3. Highest salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 4. Total salary paid by each department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 5. Count employees in each city
SELECT city, COUNT(*) AS total
FROM employees
GROUP BY city;

-- ========== HAVING ==========

-- Departments with more than 2 employees
SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- Departments whose average salary is above 55000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

-- Cities having more than one employee
SELECT city, COUNT(*) AS total
FROM employees
GROUP BY city
HAVING COUNT(*) > 1;

-- Departments whose total salary is above 150000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 150000;