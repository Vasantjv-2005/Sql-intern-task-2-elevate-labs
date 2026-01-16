-- ==========================================
-- Elevate Labs SQL Internship - Task 2
-- Database: intern_training_db
-- Table: students_v2
-- Concepts: Datatypes, Constraints, ALTER TABLE
-- ==========================================


-- 1) Create database
CREATE DATABASE IF NOT EXISTS intern_training_db;
USE intern_training_db;


-- 2) Drop table if already exists (so script can run multiple times)
DROP TABLE IF EXISTS students_v2;


-- 3) Create redesigned students table with correct datatypes + constraints
CREATE TABLE students_v2 (
    id INT AUTO_INCREMENT PRIMARY KEY,              -- Unique student ID
    name VARCHAR(100) NOT NULL,                     -- Name cannot be NULL
    email VARCHAR(150) NOT NULL UNIQUE,             -- Email must be unique and NOT NULL
    dob DATE NOT NULL,                              -- Date of Birth
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP   -- Auto stores record creation time
);


-- 4) Insert sample valid records
INSERT INTO students_v2 (name, email, dob)
VALUES
('Vasant', 'vasant@gmail.com', '2004-08-12'),
('Rahul Sharma', 'rahulsharma@gmail.com', '2003-05-10'),
('Ananya Reddy', 'ananyareddy@gmail.com', '2002-09-15');


-- 5) Verify insertion
SELECT * FROM students_v2;


-- ==========================================
-- 6) Insert INVALID data (to test constraints)
-- Uncomment and run one-by-one to see errors
-- ==========================================

-- (A) NOT NULL constraint failure (name cannot be NULL)
-- INSERT INTO students_v2 (name, email, dob)
-- VALUES (NULL, 'test@gmail.com', '2003-01-01');

-- (B) UNIQUE constraint failure (duplicate email)
-- INSERT INTO students_v2 (name, email, dob)
-- VALUES ('Duplicate User', 'vasant@gmail.com', '2001-01-01');

-- (C) NOT NULL constraint failure (dob missing)
-- INSERT INTO students_v2 (name, email)
-- VALUES ('No DOB', 'nodob@gmail.com');


-- ==========================================
-- 7) ALTER TABLE Practice
-- ==========================================

-- Add new column
ALTER TABLE students_v2
ADD COLUMN phone_number VARCHAR(15);

-- Rename column (phone_number -> mobile)
ALTER TABLE students_v2
RENAME COLUMN phone_number TO mobile;

-- Drop column carefully (example)
ALTER TABLE students_v2
DROP COLUMN mobile;


-- 8) Final check after ALTER operations
DESC students_v2;
SELECT * FROM students_v2;


-- ==========================================
-- Documentation: Why constraints were chosen
-- ==========================================
-- PRIMARY KEY (id)       : Uniquely identifies each student row
-- AUTO_INCREMENT         : Automatically generates student IDs
-- NOT NULL (name,email,dob): Prevents missing important data
-- UNIQUE (email)         : Prevents duplicate student emails
-- DEFAULT CURRENT_TIMESTAMP (created_at): Automatically saves record creation time
-- ==========================================
