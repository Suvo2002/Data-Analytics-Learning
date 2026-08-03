-- Day 2 SQL Practice

-- Display all employees
SELECT * FROM employees;

SELECT name, salary
FROM employees;


SELECT *
FROM employees
WHERE salary > 50000;


SELECT *
FROM employees
WHERE department = 'IT';


SELECT *
FROM employees
ORDER BY salary DESC;