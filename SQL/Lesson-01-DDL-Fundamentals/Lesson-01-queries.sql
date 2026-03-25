-- ==========================================
-- Lesson 01: DDL & DML Fundamentals
-- Author: Marek Bekier
-- Tools: SQLiteOnline 
-- ==========================================

-- 1. Creating the table structure
-- Purpose: Defining the 'customers' table with proper data types
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(100),
    age INTEGER
);

-- 2. Populating data
-- Purpose: Adding initial records to the database
INSERT INTO customers (customer_id, first_name, last_name, city, age)
VALUES 
    (1, 'Jan', 'Kowalski', 'Warszawa', 30),
    (2, 'Anna', 'Nowak', 'Kraków', 25);

-- 3. Data Modification
-- Purpose: Updating city for a specific customer
UPDATE customers 
SET city = 'Wrocław' 
WHERE customer_id = 1;

-- 4. Final Verification
-- Purpose: Checking the results of the operations
SELECT * 
FROM customers 
ORDER BY last_name ASC;
