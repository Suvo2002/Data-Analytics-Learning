-- Step 1: Create Table
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary INT
);


INSERT INTO Employees (Emp_ID, Emp_Name, Salary) VALUES
(1, 'Amit', 50000),
(2, 'Rahul', 70000),
(3, 'Priya', 60000),
(4, 'Neha', 80000),
(5, 'Rohan', 70000),
(6, 'Ankit', 90000),
(7, 'Suman', 65000),
(8, 'Kiran', 55000),
(9, 'Pooja', 75000);

-- View the table
SELECT * FROM Employees;


Select salary from(select salary , DENSE Rank() over( order by salary )as rank_no from Employees) as T
where rank_no=2;