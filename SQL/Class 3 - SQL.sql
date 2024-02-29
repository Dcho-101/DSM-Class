-- ARITHMATIC OPERATORS

SELECT amount, 2*amount AS doubled_amount FROM payment;

SELECT amount, amount + 1 FROM payment;

-- For Remainders
SELECT amount, amount % 2 FROM payment;

-- For Dividing
SELECT amount, amount / 2 FROM payment;

-- WHERE CLAUSE

SELECT amount FROM payment WHERE amount = 2*amount/2;


-- COMPARISON OPERATOR

SELECT * FROM film WHERE replacement_cost > 20;

SELECT * FROM film WHERE replacement_cost < 20;

SELECT * FROM film WHERE rating = 'PG';

-- Not Equal to sign is <> and !=

SELECT * FROM film WHERE rating <> 'PG';

SELECT * FROM film WHERE rating != 'PG';

-- LOGICAL OPERATOR - AND, OR, NOT, IN, BETWEEN

SELECT * FROM film WHERE rating != 'PG' AND replacement_cost > 20;

SELECT * FROM film WHERE rating != 'PG' OR replacement_cost > 20;

-- NOT is used for making Excepations

SELECT * FROM film WHERE NOT replacement_cost > 20;

SELECT * FROM film WHERE NOT rating != 'PG';

SELECT * FROM film WHERE length BETWEEN 80 AND 100;

SELECT * FROM film WHERE length IN (80, 90, 100);

SELECT * FROM film WHERE length = 80 OR length = 90 OR length = 100;


-- CONSTRAINTS
-- NOT NULL, DEFAULT, UNIQUE, PRIMARY KEY, FOREIGN KEY, CANDIDATE KEY, SUPER KEY, CHECK, ARTIFICAL KEY

-- A table which is creating cannot have a null values
-- syntax
-- Column_name Data_type Constraints
-- we have done in the table created in class 2 in student_name column.

-- a column having unique 
-- Unique constrains holds uniques values not a repeating values, but it can holds null value.
-- we have done in the table created in class 2 in student_email column.

-- Default column
-- Default is used to use a default value in a column whenever any value are not given in the field.
 
 -- Primary Key
 -- that column which has not null and unique value will automatically assign to the primary key or vice versa
 -- primary key can be seen on all tables
 
 
 -- Foreign Key
 -- foreign key is a column in which we made connection from another table 
 -- foreign key is a primary key for another table
 -- if we don't use the foreign key and link with another table then it will show higher fetching time for querries, bigger table, and increase of memory consumption
 
 
 -- Candidate key
 -- candidate key is a column in a table which can become a primary key but already have a primary key, these columns can become a candidate key. 
 -- for example like adhaar card column, or mobile number columns
 
 -- Super key
 -- when a combination of 2 or 3 tables combine together referes to the complete entry of the table that is called as a superkey
 -- it is very rare key used in the tables. 
 