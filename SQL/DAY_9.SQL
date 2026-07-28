-- ==========================================
-- Day 9: SELF JOIN & CROSS JOIN
-- PostgreSQL
-- ==========================================

-- Create Employee Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    department VARCHAR(30)
);

-- Insert Data
INSERT INTO employees VALUES
(1, 'Rahul', NULL, 'Management'),
(2, 'Ananya', 1, 'HR'),
(3, 'Sourav', 1, 'IT'),
(4, 'Priya', 3, 'IT'),
(5, 'Riya', 3, 'IT'),
(6, 'Amit', 2, 'HR');

-- ==========================================
-- SELF JOIN
-- ==========================================

-- 1. Show employee and manager name
SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- 2. Employees working under Rahul
SELECT
    e.emp_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Rahul';

-- 3. Employees with no manager
SELECT emp_name
FROM employees
WHERE manager_id IS NULL;

-- 4. Employee, Department and Manager
SELECT
    e.emp_name,
    e.department,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


-- CROSS JOIN


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

INSERT INTO projects VALUES
(101, 'CRM'),
(102, 'ERP'),
(103, 'AI Portal');

-- 5. Every employee with every project
SELECT
    e.emp_name,
    p.project_name
FROM employees e
CROSS JOIN projects p;

-- 6. Count total combinations
SELECT COUNT(*) AS total_combinations
FROM employees
CROSS JOIN projects;





SELECT
    e.emp_name,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


SELECT
    e.emp_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Sourav';

-- Every employee with every project
SELECT
    e.emp_name,
    p.project_name
FROM employees e
CROSS JOIN projects p;