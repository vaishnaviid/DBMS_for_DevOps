-- ========================
-- 1. Introduction to Data Sorting
-- ========================
-- Data in SQL can be sorted using the ORDER BY clause.
-- You can sort data in ascending or descending order.

-- Syntax:
-- SELECT column1, column2
-- FROM table_name
-- ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];

-- Notes:
-- ASC  : Ascending order (default)
-- DESC : Descending order

-- ========================
-- 2. Example Table: worker
-- Columns: worker_id, first_name, last_name, salary, department, joining_date
-- ========================

-- ========================
-- 3. Sorting Queries
-- ========================

--1 Sort all workers by salary in ascending order
SELECT * FROM worker
ORDER BY salary ASC;

--2 Sort all workers by salary in descending order
SELECT * FROM worker
ORDER BY salary DESC;

--3 Sort by department alphabetically
SELECT * FROM worker
ORDER BY department ASC;

--4 Sort by department descending, then by salary ascending
SELECT * FROM worker
ORDER BY department DESC, salary ASC;

--5 Sort by joining_date, newest first
SELECT * FROM worker
ORDER BY joining_date DESC;

--6 Sort by first_name, then last_name
SELECT * FROM worker
ORDER BY first_name ASC, last_name ASC;

--7 Sorting with expressions
-- Example: Sort by salary after adding a bonus of 500
SELECT first_name, salary + 500 AS adjusted_salary
FROM worker
ORDER BY adjusted_salary DESC;

-- ========================
-- End of Data Sorting SQL Script
-- ================================
