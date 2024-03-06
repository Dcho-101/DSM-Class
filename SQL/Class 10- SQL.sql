-- CTE - Common Table Expression

-- suppose you are using a query multiple time, saving the query result temporary is the CTE


-- Create a CTE with two named subqueries. the first one gets the actors with last names starting with s. 
-- Second one gets all the pg films acted by them. finally show the film id and title.

WITH actor_s as (
SELECT * FROM actor WHERE last_name LIKE "%s"), -- making temporary table named actor_s
actor_pg AS (
SELECT a.actor_id, a.first_name, a.last_name, f.title, f.film_id FROM actor_s AS a INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id INNER JOIN film AS f ON f.film_id = fa.film_id WHERE rating = 'pg') -- making temporary table
SELECT film_id, title, last_name FROM actor_pg; -- taking information from that temporary tables

-- Add one more subquery to the previous CTE to get the reveneues of those movies

WITH actor_s as (
SELECT * FROM actor WHERE last_name LIKE "%s"), -- task 1- filter people with last name as s

actor_pg AS (
SELECT a.actor_id, a.first_name, a.last_name, f.title, f.film_id FROM actor_s AS a INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id INNER JOIN film AS f ON f.film_id = fa.film_id WHERE rating = 'pg'), -- task 2- filter film rating as pg

film_revenue AS (
SELECT ap.title, ap.film_id, p.amount FROM actor_pg AS ap INNER JOIN inventory AS i ON i.film_id = ap.film_id INNER JOIN rental AS r ON r.inventory_id = i.inventory_id INNER JOIN payment as p ON p.rental_id = r.rental_id) -- task 3- join amount of filter films

SELECT title, SUM(amount) FROM film_revenue GROUP BY title; -- task 4- total revenue of each movie

-- Question 1 - Give me the details of films along with its revenue of pg rating and actor with last name as S
-- Answer
-- number of tables - actor, film, film_actor, film_inventory, rental, payment


-- CREATING A CASE STATEMENT

-- Write a query to generate a value for the activity_type column which returns the string "Active" or "Inactive" depending upon the customer.active column
SELECT * FROM customer;

SELECT first_name, last_name,
CASE
WHEN ACTIVE = 1 THEN 'active'
ELSE 'inactive'
END activity_type
FROM customer;

-- Write a Query to show the number of film rentals of May, June, July of 2005 in a single row.

SELECT * FROM rental;

SELECT MONTHNAME(rental_date) as month_name, COUNT(rental_id) FROM rental GROUP BY month_name;

SELECT SUM(CASE WHEN MONTHNAME(rental_date) = 'May' THEN 1 ELSE 0 END) AS May,
SUM(CASE WHEN MONTHNAME(rental_date) = 'June' THEN 1 ELSE 0 END) AS June,
SUM(CASE WHEN MONTHNAME(rental_date) = 'July' THEN 1 ELSE 0 END) AS July
FROM rental;


-- Write a query to catagorize films based on the inventory level
-- If the count of copies is 0 then 'Out of Stock'
-- If the count of copies is 1 or 2 then 'Scarce'
-- If the count of copies is 3 or 4 then 'Available'
-- If the count of copies is >= 5 then 'Common'

SELECT title, 
CASE
(SELECT COUNT(*) FROM inventory WHERE inventory.film_id = film.film_id)
WHEN 0 THEN 'Out of Stock'
WHEN 1 THEN 'Scarce'
WHEN 2 THEN 'Scares'
WHEN 3 THEN 'Available'
WHEN 4 THEN 'Availavle'
ELSE 'Common' END film_availablity FROM film;


-- Write a query to create a single row containing the number of films based on the ratings (G, PG, and NC17)

SELECT
SUM(CASE WHEN rating = 'G' THEN 1 ELSE 0 END) AS G_count, -- if we use COUNT instead of sum then it will count all the zero and 1 and returns same value for every raings.
SUM(CASE WHEN rating = 'PG' THEN 1 ELSE 0 END) AS PG_count,
SUM(CASE WHEN rating = 'NC-17' THEN 1 ELSE 0 END) AS NC17_count
FROM film;

