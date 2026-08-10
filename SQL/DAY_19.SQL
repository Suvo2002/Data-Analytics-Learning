-- ==========================================
-- Day 19: String Functions
-- PostgreSQL
-- ==========================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(30),
    email VARCHAR(100)
);

INSERT INTO employees VALUES
(1, 'Rahul', 'Sharma', 'IT', 'rahul.sharma@gmail.com'),
(2, 'Ananya', 'Sen', 'HR', 'ananya.sen@gmail.com'),
(3, 'Sourav', 'Das', 'IT', 'sourav.das@yahoo.com'),
(4, 'Priya', 'Roy', 'Finance', 'priya.roy@gmail.com'),
(5, 'Riya', 'Chatterjee', 'IT', 'riya.c@gmail.com');

-- ==========================================
-- 1. UPPER()
-- Convert text to uppercase
-- ==========================================

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name
FROM employees;

-- ==========================================
-- 2. LOWER()
-- Convert text to lowercase
-- ==========================================

SELECT
    first_name,
    LOWER(first_name) AS lowercase_name
FROM employees;

-- ==========================================
-- 3. LENGTH()
-- Find number of characters
-- ==========================================

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;

-- ==========================================
-- 4. CONCAT()
-- Combine multiple strings
-- ==========================================

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- ==========================================
-- 5. CONCAT with other columns
-- ==========================================

SELECT
    CONCAT(first_name, ' works in ', department) AS employee_info
FROM employees;

-- ==========================================
-- 6. SUBSTRING()
-- Extract part of a string
-- ==========================================

SELECT
    first_name,
    SUBSTRING(first_name FROM 1 FOR 3) AS short_name
FROM employees;

-- ==========================================
-- 7. LEFT()
-- Get characters from the left
-- ==========================================

SELECT
    first_name,
    LEFT(first_name, 3) AS first_three
FROM employees;

-- ==========================================
-- 8. RIGHT()
-- Get characters from the right
-- ==========================================

SELECT
    first_name,
    RIGHT(first_name, 2) AS last_two
FROM employees;

-- ==========================================
-- 9. TRIM()
-- Remove spaces
-- ==========================================

SELECT
    TRIM('   Rahul   ') AS cleaned_name;

-- ==========================================
-- 10. REPLACE()
-- Replace part of a string
-- ==========================================

SELECT
    email,
    REPLACE(email, 'gmail.com', 'company.com') AS company_email
FROM employees;

-- ==========================================
-- 11. POSITION()
-- Find position of a character/string
-- ==========================================

SELECT
    email,
    POSITION('@' IN email) AS at_position
FROM employees;

-- ==========================================
-- 12. STRING CONCATENATION ||
-- ==========================================

SELECT
    first_name || ' ' || last_name AS full_name
FROM employees;

-- ==========================================
-- Practical Examples
-- ==========================================

-- Find employees whose first name has more than 5 characters
SELECT *
FROM employees
WHERE LENGTH(first_name) > 5;

-- Display names in uppercase
SELECT
    UPPER(first_name || ' ' || last_name) AS full_name
FROM employees;

-- Find Gmail users
SELECT *
FROM employees
WHERE email LIKE '%gmail.com';

-- Extract first 4 characters of each last name
SELECT
    last_name,
    LEFT(last_name, 4) AS short_last_name
FROM employees;

-- Create company-style email addresses
SELECT
    LOWER(first_name || '.' || last_name || '@company.com') AS company_email
FROM employees;

-- ==========================================
-- Practice Questions


-- 1. Display full name in uppercase
SELECT
    UPPER(first_name || ' ' || last_name) AS full_name
FROM employees;

-- 2. Find employees whose last name contains 'a'
SELECT *
FROM employees
WHERE LOWER(last_name) LIKE '%a%';

-- 3. Display the length of each employee's full name
SELECT
    first_name || ' ' || last_name AS full_name,
    LENGTH(first_name || ' ' || last_name) AS name_length
FROM employees;

-- 4. Replace Gmail with company email
SELECT
    first_name,
    REPLACE(email, 'gmail.com', 'company.com') AS new_email
FROM employees;

-- 5. Extract the first name from the email
SELECT
    email,
    SPLIT_PART(email, '@', 1) AS username
FROM employees;