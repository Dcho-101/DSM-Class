-- Retrive the title of the films that have a rental rate greater than $4.00

-- when a question requires a perticular thing from a querry, then provide that much data only

SELECT title, rental_rate FROM film WHERE rental_rate > 4;


-- List the customer names and emails of those who live in the city with the adress ID 300
-- first check the customer table (Dont need in Final Output)
SELECT * FROM customer --  (Dont need in Final Output)
 -- Now fetch the data --  (Dont need in Final Output)
 
SELECT first_name, last_name, email FROM customer WHERE address_id = 300; -- (final output)


-- Find the films with a length between 120 and 150 minutes (insclusive). Display the title and length.

SELECT * FROM film -- to show the columns

SELECT title, length FROM film WHERE length BETWEEN 120 and 150;


-- WILDCARD OPERATOR - LIKE
-- it has only two values one is underscore (_) second is percentage (%).
-- it is only applied on the text data


-- Retrive the first and last names of customers whose last names startswith the letter 'S'
SELECT first_name, last_name FROM customer WHERE last_name LIKE "S%" -- it means starts with s and after s it can be anything.


-- Retrive the first and last names of customers whose last names ends the letter 'S'
SELECT first_name, last_name FROM customer WHERE last_name LIKE "%S";


-- Retrive the first and last names of customers whose last names starts and ends with the letter 'S'
SELECT first_name, last_name FROM customer WHERE last_name LIKE "S%S";


-- Retrive the first and last names of customers whose last names contains the letter 'S'
SELECT first_name, last_name FROM customer WHERE last_name LIKE "%s%";

SELECT first_name, last_name FROM customer WHERE last_name LIKE "%es%";


-- Retrive the first and last name of customers whose first name contains a letter - e
SELECT first_name, last_name FROM customer WHERE last_name LIKE "%e%";

-- Retrive the first and last name of customers whose first name should starts with a and ends with e ?
SELECT first_name, last_name FROM customer WHERE first_name LIKE "a%e";

-- Retrive the first and last name of customer whose firstname where letter a is on second position?
-- _ takes only one space whereas % takes n number of values

SELECT first_name, last_name FROM customer WHERE first_name LIKE "_a%"


-- Retrive the first name and last name of customer whose first name have a letter a is on second position and e on 4th position?
SELECT first_name, last_name FROM customer WHERE first_name LIKE "_a_e%" 


-- Retrive the first name and last name of customer whose first name have a letter a is on second position and last name contains e on 4th position?
SELECT first_name, last_name FROM customer WHERE first_name LIKE "_a%" AND last_name LIKE "___e%" 


CREATE TABLE IF NOT EXISTS pwstudent(
student_id INT,
student_name CHAR(100) NOT NULL,
student_email VARCHAR(50) UNIQUE,
adhaar_card INT, -- candidate key 
joining_date DATE DEFAULT('2023-11-05'),
age INT CHECK(age >= 18), -- need to satisfy the condition
short_desc TEXT,
teacher_id INT,
marks DECIMAL(3,2), -- 000.00pwstudent
PRIMARY KEY(student_id),
FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id)
);


SELECT CONCAT(address, district) FROM address;