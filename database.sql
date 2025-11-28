-- ========================
-- 1. Create Database
-- ========================
CREATE DATABASE IF NOT EXISTS company;

-- ========================
-- 2. Use Database
-- ========================
USE company;

-- ========================
-- 3. Create Tables
-- ========================

-- Worker Table
CREATE TABLE IF NOT EXISTS worker (
    worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    salary INT(10),
    joining_date DATE,
    department CHAR(25)
);

-- Bonus Table
CREATE TABLE IF NOT EXISTS bonus (
    worker_ref_id INT,
    bonus_amt INT(10),
    bonus_date DATE,
    FOREIGN KEY (worker_ref_id)
        REFERENCES worker(worker_id)
        ON DELETE CASCADE
);

-- Title Table
CREATE TABLE IF NOT EXISTS Title (
    worker_ref_id INT,
    worker_title CHAR(25),
    affected_from DATETIME,
    FOREIGN KEY (worker_ref_id)
        REFERENCES worker(worker_id)
        ON DELETE CASCADE
);

-- ========================
-- 4. Insert Data
-- ========================

-- Insert into Worker
INSERT INTO worker (worker_id, first_name, last_name, salary, joining_date, department)
VALUES
(1, 'ANNIE',  'BENZ',  10000, '2025-11-01', 'HR'),
(2, 'monika', 'vyas',  20000, '2024-10-02', 'admin'),
(3, 'nitesh', 'shah',  30000, '2025-08-04', 'HR'),
(4, 'hannah', 'jee',    5000, '2021-09-11', 'admin'),
(5, 'ANNA',   'BENZO', 10000, '2025-11-01', 'admin'),
(6, 'monik',  'vyas',  20000, '2024-10-02', 'account'),
(7, 'nitin',  'shahi', 30000, '2025-08-04', 'account'),
(8, 'hannu',  'joo',    5000, '2021-09-11', 'admin');

-- Insert into Bonus
INSERT INTO bonus (worker_ref_id, bonus_amt, bonus_date) VALUES
(1, 5000, '2016-02-20'),
(2, 3000, '2016-06-11'),
(3, 4000, '2016-02-20'),
(1, 4500, '2016-02-20'),
(2, 3500, '2016-06-11');

-- Insert into Title
INSERT INTO Title (worker_ref_id, worker_title, affected_from) VALUES
(1, 'Manager',        '2016-02-20 00:00:00'),
(2, 'Executive',      '2016-06-11 00:00:00'),
(8, 'Executive',      '2016-06-11 00:00:00'),
(5, 'Manager',        '2016-06-11 00:00:00'),
(4, 'Asst. Manager',  '2016-06-11 00:00:00'),
(7, 'Executive',      '2016-06-11 00:00:00'),
(6, 'Lead',           '2016-06-11 00:00:00'),
(3, 'Lead',           '2016-06-11 00:00:00');