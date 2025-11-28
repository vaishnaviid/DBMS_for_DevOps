-- =====================================================
-- SQL Script: Basic SQL Commands and Tables 
-- Author: Vaishnavi Dhawalekar
-- Created: 2025-11-28
-- =====================================================

-- ========================
--  Sample Queries
-- ========================

-- Show all data from worker
SELECT * FROM worker;

-- Show first_name and salary only
SELECT first_name, salary FROM worker;

-- Workers with salary between 5000 and 20000
SELECT * FROM worker WHERE salary BETWEEN 5000 AND 20000;

-- Workers in HR or admin department
SELECT * FROM worker WHERE department = 'HR' OR department = 'admin';

-- Workers in HR or admin using IN
SELECT * FROM worker WHERE department IN ('HR', 'admin');

-- Workers not in HR
SELECT * FROM worker WHERE department NOT IN ('HR');

-- SELECT without FROM (return constant)
SELECT 45 + 25 AS total;

-- =====================================================
-- End of SQL Script
-- =====================================================
