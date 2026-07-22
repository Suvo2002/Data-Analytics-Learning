-- Create Database
CREATE DATABASE CompanyDB;

-- Use Database
USE CompanyDB;

-- Create Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT,
    City VARCHAR(30)
);

-- Insert Data
INSERT INTO Employees VALUES
(1, 'Rahul', 'IT', 60000, 25, 'Kolkata'),
(2, 'Priya', 'HR', 45000, 28, 'Delhi'),
(3, 'Amit', 'Finance', 70000, 32, 'Mumbai'),
(4, 'Sneha', 'IT', 80000, 30, 'Kolkata'),
(5, 'Rohan', 'Sales', 40000, 24, 'Pune'),
(6, 'Neha', 'HR', 50000, 27, 'Delhi'),
(7, 'Arjun', 'IT', 75000, 29, 'Bangalore');

-- 1. Display all employees
SELECT * FROM Employees;

-- 2. Employees with salary greater than 50000
SELECT * FROM Employees
WHERE Salary > 50000;

-- 3. Employees from Kolkata
SELECT * FROM Employees
WHERE City = 'Kolkata';

-- 4. Employees whose age is less than 30
SELECT * FROM Employees
WHERE Age < 30;

-- 5. IT department employees
SELECT * FROM Employees
WHERE Department = 'IT';

-- 6. Salary between 50000 and 80000
SELECT * FROM Employees
WHERE Salary BETWEEN 50000 AND 80000;

-- 7. Employees from Delhi or Kolkata
SELECT * FROM Employees
WHERE City IN ('Delhi', 'Kolkata');

-- 8. Employees not from HR department
SELECT * FROM Employees
WHERE Department <> 'HR';

-- 9. Employees with age greater than or equal to 28
SELECT * FROM Employees
WHERE Age >= 28;

-- 10. Employees whose salary is not equal to 40000
SELECT * FROM Employees
WHERE Salary != 40000;

-- 11. Employees whose salary is less than 60000
SELECT *
FROM Employees
WHERE Salary < 60000;

-- 12. Employees aged between 25 and 30
SELECT *
FROM Employees
WHERE Age BETWEEN 25 AND 30;

-- 13. Employees not from Kolkata
SELECT *
FROM Employees
WHERE City <> 'Kolkata';

-- 14. Employees from IT with salary greater than 70000
SELECT *
FROM Employees
WHERE Department = 'IT'
AND Salary > 70000;

-- 15. Employees from HR or Sales
SELECT *
FROM Employees
WHERE Department = 'HR'
OR Department = 'Sales';

-- 16. Employees not older than 28
SELECT *
FROM Employees
WHERE Age <= 28;

-- 17. Employees with salary greater than or equal to 75000
SELECT *
FROM Employees
WHERE Salary >= 75000;

-- 18. Employees whose age is not 30
SELECT *
FROM Employees
WHERE Age <> 30;

-- 19. Employees from Mumbai
SELECT *
FROM Employees
WHERE City = 'Mumbai';

-- 20. Employees not from Delhi
SELECT *
FROM Employees
WHERE City != 'Delhi';

-- 21. Employees with salary between 40000 and 70000
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 70000;

-- 22. Employees from Bangalore or Pune
SELECT *
FROM Employees
WHERE City IN ('Bangalore', 'Pune');

-- 23. Employees not in IT department
SELECT *
FROM Employees
WHERE Department NOT IN ('IT');

-- 24. Employees whose salary is exactly 50000
SELECT *
FROM Employees
WHERE Salary = 50000;

-- 25. Employees aged greater than 25 and less than 30
SELECT *
FROM Employees
WHERE Age > 25
AND Age < 30;

-- 26. Employees from Kolkata with age below 30
SELECT *
FROM Employees
WHERE City = 'Kolkata'
AND Age < 30;

-- 27. Employees from Finance with salary above 65000
SELECT *
FROM Employees
WHERE Department = 'Finance'
AND Salary > 65000;

-- 28. Employees not from Pune or Mumbai
SELECT *
FROM Employees
WHERE City NOT IN ('Pune', 'Mumbai');

-- 29. Employees whose salary is less than or equal to 50000
SELECT *
FROM Employees
WHERE Salary <= 50000;

-- 30. Employees whose age is greater than 24
SELECT *
FROM Employees
WHERE Age > 24;