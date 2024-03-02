-- Subquery

-- when we are using querry under a querry then it is called as subquerry

-- Example

SELECT payment_id, amount FROM payment WHERE amount > (SELECT AVG(amount) FROM payment);

-- show film name and film id which movies has the letter e
SELECT film_id, title FROM film WHERE language_id IN (SELECT language_id FROM language WHERE name LIKE "%e%");

SELECT film_id, title, name FROM film INNER JOIN language ON film.language_id = language.language_id WHERE name LIKE "%e%";


-- Find the filmns that have a higher rental rates than any film in the "Action" genre. Display the title and rental rate.

SELECT * FROM film; -- title, rental_rate

SELECT category_id FROM category WHERE name = "Action";

SELECT * FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = "Action");

SELECT MAX(rental_rate) FROM film WHERE film_id IN (SELECT film_id FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = "Action"));

SELECT * FROM film WHERE rental_rate > (SELECT MAX(rental_rate) FROM film WHERE film_id IN (SELECT film_id FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = "Action"))); -- there are no any films present. that is why the result is showing null.



-- Retrive the films that have a replacement cost higher than the avarage replacement cost of films in the 
-- 'Drama' genre. Display the title and replacement cost

SELECT * FROM film; -- title and replacement cost

SELECT category_id FROM category WHERE name = 'Drama';

SELECT film_id FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = 'Drama');

SELECT title, replacement_cost FROM film WHERE replacement_cost > (SELECT AVG(replacement_cost) FROM film WHERE film_id IN (SELECT film_id FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = "Drama")));


-- Retrive the titles of films that have a rental duration greater than the avarage rental duration of all films.
SELECT AVG(rental_duration) FROM film;

SELECT title FROM film WHERE rental_duration > (SELECT AVG(rental_duration) FROM film);

-- List the name of actors who have not appeared in any films Display the actors first and last names.

SELECT first_name, last_name FROM actor WHERE actor_id NOT IN (SELECT actor_id FROM film_actor);

-- List the first and last name of customers who have made payments
SELECT first_name, last_name FROM customer WHERE customer_id IN (SELECT DISTINCT customer_id FROM payment);


-- Find the titiles of films that are availble in the inventory. 

SELECT title FROM film WHERE film_id IN (SELECT DISTINCT film_id FROM inventory);