-- DDL Command - Create, Alter, Truncate, Drop


CREATE DATABASE pwskills; -- to Create a Database named pwskills

USE pwskills; -- to use the database

CREATE TABLE IF NOT EXISTS pwstudent(
student_id INT,
student_name CHAR(100),
student_email VARCHAR(50),
joining_date DATE,
short_desc TEXT,
marks DECIMAL(3,2) -- 000.00pwstudent
);

-- To See the Table
SELECT * FROM pwstudent; 

-- Describe the student table 
DESCRIBE pwstudent;

-- Changing name of a column
ALTER TABLE pwstudent
RENAME COLUMN weight TO student_weight;


-- Removing table from the database
DROP TABLE pwstudent;


-- Dropping the database
DROP DATABASE pwskills;

-- Adding a column in this table
ALTER TABLE pwstudent
ADD weight FLOAT;

-- Removing a column
ALTER TABLE pwstudent
DROP COLUMN short_desc;

-- Modifying existing column
ALTER TABLE pwstudent
MODIFY weight INT;

-- Inserting values in the table
INSERT INTO pwstudent VALUE (1, "Deepak Suneja", "deepak123@gmail.com", "2023-11-11", 8.4, 6.7);
INSERT INTO pwstudent VALUE (2, "Deepak Suneja", "deepak123@gmail.com", "2023-11-11", 8.4, 6.7);

-- Deleting all data or entries from the table 
TRUNCATE pwstudent;

SELECT * FROM insurance_data;