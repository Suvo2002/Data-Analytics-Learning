CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT
);
INSERT INTO Employees (EmployeeID, Name, Department, Salary, Age) VALUES
(1, 'Rahul', 'IT', 60000, 25),
(2, 'Priya', 'HR', 45000, 28),
(3, 'Amit', 'Finance', 70000, 30),
(4, 'Sneha', 'IT', 55000, 26),
(5, 'Rohan', 'Marketing', 50000, 29);

--first 3 employees
SELECT * FROM Employees
LIMIT 3;

--highest salary employee
SELECT * FROM Employees
ORDER BY Salary DESC
LIMIT 1;

--Second highest paid employee
SELECT * FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

--Lowest salary employee
SELECT * FROM Employees
ORDER BY Salary ASC
LIMIT 1;