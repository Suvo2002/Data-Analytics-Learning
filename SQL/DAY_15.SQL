
-- Day 15: SQL Triggers
-- PostgreSQL


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);


INSERT INTO employees VALUES
(1,'Rahul','IT',50000),
(2,'Ananya','HR',45000),
(3,'Sourav','IT',70000);

-- Create Audit Table
CREATE TABLE employee_audit (
    audit_id SERIAL PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- Trigger Function for INSERT

CREATE OR REPLACE FUNCTION log_employee_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee_audit(emp_id, action_type)
    VALUES (NEW.emp_id, 'INSERT');

    RETURN NEW;
END;
$$;

-- Create Trigger
CREATE TRIGGER trg_employee_insert
AFTER INSERT
ON employees
FOR EACH ROW
EXECUTE FUNCTION log_employee_insert();

-- Test INSERT
INSERT INTO employees
VALUES (4, 'Priya', 'Finance', 65000);

SELECT * FROM employee_audit;

-- ==========================================
-- Trigger Function for UPDATE
-- ==========================================

CREATE OR REPLACE FUNCTION log_employee_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee_audit(emp_id, action_type)
    VALUES (NEW.emp_id, 'UPDATE');

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_employee_update
AFTER UPDATE
ON employees
FOR EACH ROW
EXECUTE FUNCTION log_employee_update();

-- Test UPDATE
UPDATE employees
SET salary = 75000
WHERE emp_id = 3;

SELECT * FROM employee_audit;

-- ==========================================
-- Trigger Function for DELETE
-- ==========================================

CREATE OR REPLACE FUNCTION log_employee_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee_audit(emp_id, action_type)
    VALUES (OLD.emp_id, 'DELETE');

    RETURN OLD;
END;
$$;

CREATE TRIGGER trg_employee_delete
AFTER DELETE
ON employees
FOR EACH ROW
EXECUTE FUNCTION log_employee_delete();

-- Test DELETE
DELETE FROM employees
WHERE emp_id = 2;

SELECT * FROM employee_audit;