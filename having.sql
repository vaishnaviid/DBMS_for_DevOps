-- ============================
-- 1. Introduction to HAVING
-- ============================
-- HAVING is used to filter records *after* GROUP BY is applied.
-- WHERE filters rows BEFORE grouping.
-- HAVING filters groups AFTER grouping.

-- Rule:
-- GROUP BY → creates groups
-- HAVING   → filters those groups

-- ============================
-- 2. Basic Syntax
-- ============================
-- SELECT column_name, AGG_FUNC(column_name)
-- FROM table_name
-- GROUP BY column_name
-- HAVING condition_on_aggregate;

-- ============================
-- 3. Example Table: worker, bonus
-- ============================

-- ============================
-- 4. Example Queries
-- ============================

--1 Count workers per department but show only departments with more than 2 workers
SELECT department, COUNT(*) AS total_workers
FROM worker
GROUP BY department
HAVING COUNT(*) > 2;

--2 Show departments where total salary is greater than 40,000
SELECT department, SUM(salary) AS total_salary
FROM worker
GROUP BY department
HAVING SUM(salary) > 40000;

--3 Show only salary groups where more than 1 worker has same salary
SELECT salary, COUNT(*) AS num_workers
FROM worker
GROUP BY salary
HAVING COUNT(*) > 1;

--4 Total bonus per worker, but show only workers whose bonus exceeds 7000
SELECT worker_ref_id, SUM(bonus_amt) AS total_bonus
FROM bonus
GROUP BY worker_ref_id
HAVING SUM(bonus_amt) > 7000;

--5 Workers hired per year, show years where more than one hire happened
SELECT YEAR(joining_date) AS joining_year,
       COUNT(worker_id) AS total_hired
FROM worker
GROUP BY joining_year
HAVING COUNT(worker_id) > 1;

-- ============================
-- 5. WHERE vs HAVING Comparison
-- ============================
-- WHERE filters rows before grouping
-- HAVING filters groups after grouping

-- Example:
-- Show departments whose total salary > 30,000,
-- but only consider workers earning more than 10,000 salary

SELECT department, SUM(salary) AS total_salary
FROM worker
WHERE salary > 10000       -- BEFORE grouping
GROUP BY department
HAVING SUM(salary) > 30000; -- AFTER grouping

-- ===================================
-- End of GROUP BY HAVING SQL Script
-- ===================================
