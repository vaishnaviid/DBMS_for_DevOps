-- ============================================================
-- SET OPERATIONS IN MySQL (UNION, UNION ALL, INTERSECT, MINUS)
-- ============================================================

-- Drop tables if they already exist
DROP TABLE IF EXISTS table1;
DROP TABLE IF EXISTS table2;

-- ============================================
-- 1. CREATE SAMPLE TABLES
-- ============================================
CREATE TABLE table1 (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE table2 (
    id INT,
    name VARCHAR(50)
);

-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================
INSERT INTO table1 VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

INSERT INTO table2 VALUES
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F');

-- ============================================
-- 3. UNION (removes duplicates)
-- ============================================
SELECT * FROM table1
UNION
SELECT * FROM table2;

-- ============================================
-- 4. UNION ALL (keeps duplicates)
-- ============================================
SELECT * FROM table1
UNION ALL
SELECT * FROM table2;

-- ============================================
-- 5. INTERSECT (emulated using INNER JOIN)
--    Returns common rows from both tables
-- ============================================
SELECT DISTINCT t1.*
FROM table1 t1
JOIN table2 t2
USING(id, name);

-- Alternative INTERSECT version
-- SELECT DISTINCT t1.*
-- FROM table1 t1
-- INNER JOIN table2 t2
-- ON t1.id = t2.id AND t1.name = t2.name;

-- ============================================
-- 6. MINUS (EXCEPT emulated)
--    Returns rows in table1 NOT present in table2
-- ============================================
SELECT t1.*
FROM table1 t1
LEFT JOIN table2 t2
ON t1.id = t2.id AND t1.name = t2.name
WHERE t2.id IS NULL;

-- ================================
-- End of Data Sorting SQL Script
-- ================================