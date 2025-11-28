-- ========================
-- 1. Introduction
-- ========================
-- DISTINCT: Returns unique values from a column
-- GROUP BY: Groups rows that have the same values in specified columns
-- Aggregation Functions: Perform calculations on groups of rows

-- Common Aggregation Functions:
-- COUNT(): Count rows
-- SUM(): Sum of values
-- AVG(): Average of values
-- MIN(): Minimum value
-- MAX(): Maximum value

-- ========================
-- 2. Example Table: worker
-- Columns: worker_id, first_name, last_name, salary, joining_date, department

-- ========================
-- 3. Queries
-- ========================

--1 Using DISTINCT
-- List all unique departments
SELECT DISTINCT department FROM worker;

--2 Count of workers in each department
SELECT department, COUNT(*) AS total_workers
FROM worker
GROUP BY department;

--3 Sum of salaries per department
SELECT department, SUM(salary) AS total_salary
FROM worker
GROUP BY department;

--4 Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM worker
GROUP BY department;

--5 Maximum and minimum salary per department
SELECT department,
       MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
FROM worker
GROUP BY department;

--6 Count distinct salaries
SELECT COUNT(DISTINCT salary) AS distinct_salaries
FROM worker;

--7 Group by with multiple columns
-- Count number of workers per department and salary
SELECT department, salary, COUNT(*) AS num_workers
FROM worker
GROUP BY department, salary;

--8 Aggregation with bonus table
-- Total bonus per worker
SELECT worker_ref_id, SUM(bonus_amt) AS total_bonus
FROM bonus
GROUP BY worker_ref_id;

--9 Average bonus per worker
SELECT worker_ref_id, AVG(bonus_amt) AS avg_bonus
FROM bonus
GROUP BY worker_ref_id;

-- ========================
-- End of DISTINCT, GROUP BY, Aggregation SQL Script
-- =====================================================
