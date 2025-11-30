-- =====================================================
-- SQL FILE: ALTER OPERATIONS (ADD, MODIFY, CHANGE, DROP, RENAME)
-- Author: Your Name
-- Purpose: Understanding schema modification in SQL
-- =====================================================

-- =====================================================
-- 0. CREATE SAMPLE DATABASE & TABLES
-- =====================================================

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- Main table for ALTER operations
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    qty INT,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

-- =====================================================
-- 1. ADD COLUMN
-- Purpose: Add one or multiple new columns to an existing table
-- Syntax:
-- ALTER TABLE table_name ADD column_name datatype;
-- ALTER TABLE table_name ADD col1 datatype, ADD col2 datatype;

-- Example 1: Add one column
ALTER TABLE customer 
ADD age INT NOT NULL;

-- Example 2: Add multiple columns at once
ALTER TABLE customer
ADD phone VARCHAR(20),
ADD city VARCHAR(50);

-- =====================================================
-- 2. MODIFY COLUMN
-- Purpose: Modify datatype or size of an existing column
-- Syntax:
-- ALTER TABLE table_name MODIFY column_name new_datatype;

-- Example 1: Change datatype from VARCHAR → CHAR
ALTER TABLE customer
MODIFY first_name CHAR(1024);

-- Example 2: Change datatype of age
ALTER TABLE customer
MODIFY age SMALLINT;

-- =====================================================
-- 3. CHANGE COLUMN (Rename Column + Modify datatype)
-- Purpose: Rename column AND change datatype (optional)
-- Syntax:
-- ALTER TABLE table_name CHANGE COLUMN old_name new_name new_datatype;

-- Example 1: Rename email → email_id
ALTER TABLE customer
CHANGE COLUMN email email_id VARCHAR(255);

-- Example 2: Rename phone → mobile_no and change size
ALTER TABLE customer
CHANGE COLUMN phone mobile_no VARCHAR(30);

-- =====================================================
-- 4. DROP COLUMN
-- Purpose: Remove a column from the table permanently
-- Syntax:
-- ALTER TABLE table_name DROP COLUMN col_name;

-- Example 1: Drop last_name
ALTER TABLE customer
DROP COLUMN last_name;

-- Example 2: Drop city column
ALTER TABLE customer
DROP COLUMN city;

-- =====================================================
-- 5. RENAME TABLE
-- Purpose: Rename the entire table
-- Syntax:
-- ALTER TABLE old_table_name RENAME TO new_table_name;

-- Example:
ALTER TABLE customer
RENAME TO customer_details;

-- =====================================================
-- 6. FINAL STRUCTURE VERIFICATION
-- Commands (NOT executable inside SQL file but for reference)
-- SHOW TABLES;
-- DESCRIBE customer_details;
-- DESCRIBE orders;
-- =====================================================
