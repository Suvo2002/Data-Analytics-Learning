-- ==========================================
-- Day 14: Stored Procedures
-- PostgreSQL
-- ==========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

-- Insert Data
INSERT INTO employees VALUES
(1,'Rahul','IT',50000),
(2,'Ananya','HR',45000),
(3,'Sourav','IT',70000),
(4,'Priya','Finance',65000),
(5,'Riya','IT',80000);

-- ==========================================
-- Procedure 1: Display All Employees
-- ==========================================

CREATE OR REPLACE PROCEDURE get_all_employees()
LANGUAGE SQL
AS $$
    SELECT * FROM employees;
$$;

CALL get_all_employees();

-- ==========================================
-- Procedure 2: Employee by Department
-- ==========================================

CREATE OR REPLACE PROCEDURE get_department_employees(IN dept_name VARCHAR)
LANGUAGE SQL
AS $$
    SELECT *
    FROM employees
    WHERE department = dept_name;
$$;

CALL get_department_employees('IT');

-- ==========================================
-- Procedure 3: Update Salary
-- ==========================================

CREATE OR REPLACE PROCEDURE update_salary(
    IN employee_id INT,
    IN new_salary DECIMAL
)
LANGUAGE SQL
AS $$
    UPDATE employees
    SET salary = new_salary
    WHERE emp_id = employee_id;
$$;

CALL update_salary(1, 60000);

-- Verify Update
SELECT * FROM employees;

-- ==========================================
-- Procedure 4: Delete Employee


CREATE OR REPLACE PROCEDURE delete_employee(IN employee_id INT)
LANGUAGE SQL
AS $$
    DELETE FROM employees
    WHERE emp_id = employee_id;
$$;

CALL delete_employee(5);

SELECT * FROM employees;


-- Procedure 5: Increase Salary by Percentage


CREATE OR REPLACE PROCEDURE increase_salary(
    IN percent_increase DECIMAL
)
LANGUAGE SQL
AS $$
    UPDATE employees
    SET salary = salary + (salary * percent_increase / 100);
$$;

CALL increase_salary(10);

SELECT * FROM employees;