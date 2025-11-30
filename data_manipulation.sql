-- --------------------------------------------------------------------
-- CREATE DATABASE
-- --------------------------------------------------------------------
CREATE DATABASE company;
USE company;

-- --------------------------------------------------------------------
-- 1. CREATE TABLE customer
-- --------------------------------------------------------------------
CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    age INT,
    email VARCHAR(255) UNIQUE,
    city VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------------------
-- 2. CREATE TABLE orders (Foreign Key with CASCADE options)
-- --------------------------------------------------------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    delivery_date DATE,
    cust_id INT,

    -- FK referencing customer table
    FOREIGN KEY (cust_id)
        REFERENCES customer(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- --------------------------------------------------------------------
-- 3. CREATE TABLE payments (Foreign Key with SET NULL)
-- --------------------------------------------------------------------
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    amount INT NOT NULL,
    cust_id INT,

    FOREIGN KEY (cust_id)
        REFERENCES customer(id)
        ON DELETE SET NULL
);

-- --------------------------------------------------------------------
-- SAMPLE INSERTS
-- --------------------------------------------------------------------

-- INSERT single and multiple rows
INSERT INTO customer (first_name, last_name, age, email, city)
VALUES ('Amit', 'Sharma', 25, 'amit@gmail.com', 'Mumbai'),
       ('Riya', 'Patel', 30, 'riya@gmail.com', 'Pune'),
       ('John', 'Doe', 40, 'john@gmail.com', 'Delhi');

-- INSERT orders
INSERT INTO orders (delivery_date, cust_id)
VALUES ('2025-01-10', 1),
       ('2025-02-01', 2);

-- INSERT payments
INSERT INTO payments (amount, cust_id)
VALUES (500, 1),
       (1000, 2);

-- --------------------------------------------------------------------
-- UPDATE OPERATIONS
-- --------------------------------------------------------------------

-- 1. Update with WHERE
UPDATE customer
SET city = 'Bangalore'
WHERE id = 1;

-- 2. Update multiple rows
UPDATE customer
SET age = age + 1;

-- 3. ON UPDATE CASCADE Example
-- Update primary key of customer, this automatically updates in orders
UPDATE customer
SET id = 10
WHERE id = 2;
-- orders table will now have cust_id = 10

-- --------------------------------------------------------------------
-- DELETE OPERATIONS
-- --------------------------------------------------------------------

-- 1. DELETE specific row
DELETE FROM payments
WHERE payment_id = 1;

-- 2. DELETE all rows
-- DELETE FROM payments;

-- 3. ON DELETE CASCADE Example
-- deleting customer with id=1 will delete all orders of that customer
DELETE FROM customer WHERE id = 1;

-- 4. ON DELETE SET NULL Example
-- deleting customer with id=3 will set payments.cust_id = NULL
DELETE FROM customer WHERE id = 3;

-- --------------------------------------------------------------------
-- REPLACE OPERATIONS
-- --------------------------------------------------------------------

-- (A) REPLACE behaves like UPDATE if PK exists
REPLACE INTO customer (id, first_name, last_name, age, email, city)
VALUES (10, 'UpdatedRiya', 'Patel', 31, 'riyaupdated@gmail.com', 'Nagpur');

-- (B) REPLACE behaves like INSERT if PK does NOT exist
REPLACE INTO customer (id, first_name, last_name, age, email, city)
VALUES (20, 'NewUser', 'Singh', 28, 'new@gmail.com', 'Indore');

-- (C) REPLACE using SET syntax
REPLACE INTO payments
SET payment_id = 2, amount = 1500, cust_id = 10;

-- --------------------------------------------------------------------
-- END OF FILE
-- --------------------------------------------------------------------
