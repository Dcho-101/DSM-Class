-- Correlated Related Querries

-- Retrive the title of films that have a rental rate higher than the avarage rental rate of films released in the same year 
-- In this querry it can be it can be dificult because it contains same date in the entire dataset

SELECT title FROM film f WHERE rental_rate > (SELECT AVG(rental_rate) FROM film WHERE release_year = f.release_year);


-- List customers who have made more than five payments Display their first and last name
SELECT customer_id, COUNT(*) FROM payment GROUP BY customer_id HAVING COUNT(*) > 5;

SELECT first_name, last_name FROM customer WHERE (SELECT COUNT(*) FROM payment WHERE payment.customer_id = customer.customer_id) > 5;


SELECT first_name, last_name, COUNT(*) FROM customer JOIN payment ON customer.customer_id = payment.customer_id GROUP BY first_name, last_name HAVING COUNT(*) > 5;

-- Find films with a rental rate higher than the avarage rental rate for all films. Display title and rental rate

SELECT title, rental_rate FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- Retrive the names of actors who have appeared in at least two films. Display their first and last name 

SELECT actor_id, (film_id) FROM film_actor GROUP BY actor_id HAVING COUNT(film_id) > 2;

SELECT first_name, last_name FROM actor a WHERE (SELECT COUNT(film_id) FROM film_actor fa WHERE fa.actor_id = a.actor_id) >= 2;


-- Write a query to count the number of film rentals for each customers and the containing querry then retrives those customers who have rented exactly 30 films.

SELECT first_name, last_name FROM customer WHERE (SELECT COUNT(rental_id) FROM rental WHERE rental.customer_id = customer.customer_id) = 30;


-- Write a query to find all customers whose total payments for all film rentals are between 100 and 150 dollars.

SELECT first_name, last_name FROM customer c WHERE (SELECT SUM(amount) FROM payment p WHERE c.customer_id = p.customer_id) BETWEEN 100 AND 150;


-- write a query to generate a list of customers ID along with the number of film rentals and the total payments.

SELECT c.first_name, c.last_name, total_rentals, total_payments FROM customer c INNER JOIN (SELECT customer_id, COUNT(*) AS total_rentals, SUM(amount) AS total_payments FROM payment GROUP BY customer_id) a ON c.customer_id = a.customer_id;
