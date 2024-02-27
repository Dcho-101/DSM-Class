-- Constants - Not Null, Primary key, foreign key, Unique, Default

USE pwskills;

-- Syntax for creating table 

-- CREATE TABLE table_name(
-- column_name1 data_type constraint,
-- column_name2 data_type constraint,
-- column_name3 data_type constraint
-- )

CREATE TABLE teachers(
teacher_id INT,
teacher_name CHAR(50),
PRIMARY KEY(teacher_id)
);

CREATE TABLE IF NOT EXISTS pwstudent(
student_id INT,
student_name CHAR(100) NOT NULL,
student_email VARCHAR(50) UNIQUE,
joining_date DATE DEFAULT('2023-11-05'),
short_desc TEXT,
teacher_id INT,
marks DECIMAL(3,2), -- 000.00pwstudent
PRIMARY KEY(student_id),
FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id)
);


SELECT * FROM pwstudent;


DESCRIBE pwstudent;


-- DML Commands - Insert, Update, Delete

-- Syntax 
-- INSERT INTO table_name VALUE ();

INSERT INTO teachers VALUE (1, "Dibyendu Chowdhury");

SELECT * FROM teachers;

-- Adding value into only one column

INSERT INTO teachers(teacher_id) VALUES (2);

-- Inserting multiple values into single syntax

INSERT INTO teachers VALUES (3, "Raja"), (4, "Subho");


-- UPDATE command

-- update my teachers table and set teacher_name value as Chowdhury where teacher_id is equal to 2
UPDATE teachers SET teacher_name = "Chowdhury" WHERE teacher_id = 2;


-- DELETE command

-- Delete values from the teachers table wherever you find teacher_id as 3
DELETE FROM teachers WHERE teacher_id = 3;


-- DQL - Select

SELECT * FROM teachers;

-- Selecting Perticular column
SELECT teacher_id FROM teachers;

-- Command to show the list of the databases 
SHOW DATABASES;

-- Command to Show name of the Tables
SHOW TABLES;


-- Operations using SELECT commmand - FROM, JOIN, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT

-- Using "mavenmovies" schema

SELECT * FROM inventory;
SELECT * FROM film;

-- finding title and description from the film table 
SELECT title, description FROM film; 

-- finding title and description from the film table (top 3)
SELECT title, description FROM film LIMIT 3;

-- sorting the data based on film_id
SELECT film_id, title FROM film ORDER BY film_id ASC;
SELECT film_id, title FROM film ORDER BY film_id DESC;


-- COMPARISON OPERATOR = <, >, <=,>=, =, !=
SELECT film_id, title FROM film WHERE film_id < 20;
SELECT film_id, title FROM film WHERE film_id <= 20;
SELECT customer_id, first_name FROM customer WHERE customer_id < 20;
SELECT customer_id, first_name FROM customer WHERE first_name = "SANDRA";

-- ARITHMATIC OPERATORS = +,-,*,/,
SELECT 2*2;
SELECT amount, amount * 2 FROM payment;


-- LOGICAL OPERATORS - AND, OR, NOT
SELECT * FROM payment WHERE amount > 2.99 AND customer_id > 100;
SELECT * FROM payment WHERE amount > 2.99 OR customer_id > 100;
SELECT * FROM payment WHERE amount > 2.99 AND customer_id > 100 OR staff_id = 1;