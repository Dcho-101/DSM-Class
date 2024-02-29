-- SQL pre defined functions mathematical functions, strings, datetime

-- What is the total amount of all the movies

SELECT SUM(amount) FROM payment;

SELECT AVG(amount) FROM payment;

SELECT COUNT(amount) FROM payment;

SELECT MIN(amount) FROM payment;

SELECT MAX(amount) FROM payment;


-- String Functions - concat, upper, lower, substr
SELECT * FROM actor;

-- joining first and last name 

SELECT CONCAT(first_name, " ", last_name) FROM actor;

SELECT CONCAT(first_name, " ", last_name) AS full_name FROM actor;

SELECT CONCAT(first_name, " ", last_name) AS full_name, LENGTH(CONCAT(first_name, " ", last_name)) AS letters_of_the_string FROM actor; -- calculates letters of the string including space.



-- names as lower case
SELECT LOWER(first_name) FROM actor;

-- names as upper case
SELECT UPPER(first_name) FROM actor;

-- substr
-- it is a function to extract/slice text data
-- substr(text_data, starting_point, no_of_char)
select * from address;

SELECT SUBSTR(address, 3,10) FROM address; -- fetching 3rd to 10th letter


-- DATETIME functions - month, year, day, monthname, datediff

SELECT * FROM rental;

SELECT rental_date, MONTH(rental_date) FROM rental;

SELECT rental_date, MONTHNAME(rental_date) FROM rental;

SELECT rental_date, YEAR(rental_date) FROM rental;

SELECT rental_date, DAY(rental_date) FROM rental;

-- finding date difference
SELECT return_date, rental_date, DATEDIFF(return_date, rental_date) FROM rental; -- used to measure difference between the dates


-- Questions

-- What will be smallest rental duration?
SELECT MIN(rental_duration) FROM film;

-- What is the highest replacement cost amongst all films

SELECT MAX(replacement_cost) FROM film;

-- Display all films whose title length is greater than 10 characters
SELECT * FROM film WHERE LENGTH(title > 10);


-- Provide the count of unique ratings of films provided

SELECT COUNT(DISTINCT(rating)) FROM film; 


-- Display the list of first 4 cities which starts and ends with 'a'
SELECT * FROM city WHERE city like "a%a" LIMIT 4;


-- GroupBY

SELECT rating, AVG(rental_duration) FROM film WHERE rating = 'PG';

SELECT rating, AVG(rental_duration) FROM film GROUP BY rating; -- doing like same but with every rating

SELECT actor_id, COUNT(film_id) FROM film_actor GROUP BY actor_id;

SELECT actor_id, COUNT(film_id) AS Number_of_films FROM film_actor GROUP BY actor_id ORDER BY Number_of_films DESC;


-- List the total sales amount for each customer in the database

SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id;

SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;


-- HAVING

SELECT customer_id, SUM(amount) AS total_amount FROM payment GROUP BY customer_id HAVING total_amount > 100;

-- both are used for filtration, Where clause is used to filtration from complete table, having used on aggregated/group by data. 

