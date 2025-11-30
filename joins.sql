-- =============================================
-- DATABASE & TABLE CREATION
-- =============================================
CREATE DATABASE company_join_demo;
USE company_join_demo;

-- =============================================
-- TABLE: department
-- =============================================
CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

-- =============================================
-- TABLE: employee
-- =============================================
CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,   -- used for SELF JOIN example
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- =============================================
-- INSERT SAMPLE DATA
-- =============================================
INSERT INTO department (dept_name) VALUES
('HR'),
('Finance'),
('Engineering'),
('Sales');

INSERT INTO employee (emp_name, salary, dept_id, manager_id) VALUES
('Amit', 50000, 1, NULL),
('Riya', 60000, 1, 1),
('John', 75000, 2, NULL),
('Meera', 55000, 3, 3),
('Karan', 45000, 4, NULL),
('Simran', 35000, NULL, NULL);  -- employee without dept


-- =====================================================
--                JOIN EXAMPLES
-- =====================================================

-- -----------------------------------------------------
-- 1. INNER JOIN (Only matching records in both tables)
-- -----------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employee AS e
INNER JOIN department AS d
ON e.dept_id = d.dept_id;

-- -----------------------------------------------------
-- 2. LEFT JOIN (All employees + matched departments)
-- -----------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employee AS e
LEFT JOIN department AS d
ON e.dept_id = d.dept_id;

-- -----------------------------------------------------
-- 3. RIGHT JOIN (All departments + matched employees)
-- -----------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employee AS e
RIGHT JOIN department AS d
ON e.dept_id = d.dept_id;

-- -----------------------------------------------------
-- 4. FULL JOIN (MySQL: use UNION of left + right)
-- -----------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employee AS e
LEFT JOIN department AS d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name, d.dept_name
FROM employee AS e
RIGHT JOIN department AS d
ON e.dept_id = d.dept_id;

-- -----------------------------------------------------
-- 5. CROSS JOIN (Cartesian product)
-- -----------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employee AS e
CROSS JOIN department AS d;

-- -----------------------------------------------------
-- 6. SELF JOIN (Employee ↔ Manager in same table)
-- -----------------------------------------------------
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM employee AS e
INNER JOIN employee AS m
ON e.manager_id = m.emp_id;

-- -----------------------------------------------------
-- 7. JOIN without JOIN keyword (Old-style)
-- -----------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employee e, department d
WHERE e.dept_id = d.dept_id;

-- =====================================================
-- End of SQL Script
-- =====================================================
