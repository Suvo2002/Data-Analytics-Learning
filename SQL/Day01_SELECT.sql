CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees VALUES
(1,'Rahul','Sharma','IT',60000),
(2,'Priya','Das','HR',45000);

SELECT * FROM employees;