-- ========================
-- 1. Introduction to Wildcards
-- ========================
-- Wildcards are used in SQL with the LIKE operator
-- to search for patterns in string columns.

-- Common Wildcards:
-- %  : Represents zero or more characters
-- _  : Represents exactly one character

-- ========================
-- 2. Example Table: worker (Assuming it exists)
-- Columns: first_name, last_name, department, salary
-- ========================

-- ========================
-- 3. Queries Using Wildcards
-- ========================

--1 Find all workers whose first name starts with 'A'
SELECT * FROM worker
WHERE first_name LIKE 'A%';

--2 Find all workers whose last name ends with 'z'
SELECT * FROM worker
WHERE last_name LIKE '%z';

--3 Find all workers whose first name contains 'an' anywhere
SELECT * FROM worker
WHERE first_name LIKE '%an%';

--4 Find all workers whose first name has exactly 5 letters
SELECT * FROM worker
WHERE first_name LIKE '_____';  -- 5 underscores = 5 characters

--5 Find workers whose first name starts with 'm' and ends with 'k'
SELECT * FROM worker
WHERE first_name LIKE 'm%k';

-- 6 Find workers whose department starts with 'a' or 'h'
SELECT * FROM worker
WHERE department LIKE 'a%' OR department LIKE 'h%';

--7 Using NOT LIKE
-- Find workers whose first name does NOT start with 'A'
SELECT * FROM worker
WHERE first_name NOT LIKE 'A%';

--8 Using multiple wildcards
-- Find first names starting with 'A' and ending with 'e'
SELECT * FROM worker
WHERE first_name LIKE 'A%e';

-- ========================
-- End of Wildcards SQL Script
-- ============================
