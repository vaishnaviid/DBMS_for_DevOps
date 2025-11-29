-- =====================================================
-- 1. PRIMARY KEY
-- =====================================================
-- A Primary Key:
-- 1. Must be NOT NULL
-- 2. Must be UNIQUE
-- 3. Only ONE primary key allowed per table
-- 4. Identifies each row uniquely

CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    age INT
);

-- =====================================================
-- 2. FOREIGN KEY
-- =====================================================
-- A Foreign Key:
-- 1. References the Primary Key of another table
-- 2. Table can contain multiple foreign keys
-- 3. Ensures referential integrity

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    delivery_date DATE,
    order_placed_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

-- =====================================================
-- 3. UNIQUE CONSTRAINT
-- =====================================================
-- UNIQUE:
-- 1. Ensures all values in a column are unique
-- 2. Can be NULL (NULL is treated as a unique value)
-- 3. Table can contain multiple UNIQUE constraints

CREATE TABLE user_account (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    mobile VARCHAR(20)
);

-- =====================================================
-- 4. CHECK CONSTRAINT
-- =====================================================
-- CHECK:
-- 1. Ensures values satisfy a condition
-- 2. MySQL allows CHECK but earlier versions ignored it
-- 3. Constraint name is optional

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    CONSTRAINT age_check CHECK (age > 12)
);

-- (MySQL can generate name automatically)
-- Example without naming:
-- CHECK (age > 12)

-- =====================================================
-- 5. DEFAULT CONSTRAINT
-- =====================================================
-- DEFAULT:
-- 1. Assigns a default value when no value is provided
-- 2. Useful for status, timestamps, numeric defaults

CREATE TABLE bank_account (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(255) NOT NULL,
    saving_rate DOUBLE NOT NULL DEFAULT 4.25,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- 6. COLUMN that is BOTH PK and FK
-- =====================================================
-- A column can be BOTH:
-- 1. Primary Key (unique record identity)
-- 2. Foreign Key (referencing parent table)

-- Example: Each employee has exactly one ID card.
-- id_card_id is PK, but it references employee(emp_id)

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255)
);

CREATE TABLE id_card (
    card_id INT PRIMARY KEY,
    emp_id INT UNIQUE,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

-- Another example where same column is PK + FK:

CREATE TABLE passport (
    passport_id INT PRIMARY KEY,
    emp_id INT,
    FOREIGN KEY (passport_id) REFERENCES employee(emp_id)
);

-- =====================================================
-- End of SQL CONSTRAINTS Script
-- =====================================================
