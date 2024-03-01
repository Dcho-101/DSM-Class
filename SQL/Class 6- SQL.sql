-- Joins Clause - Inner join, Left Join, right join, full outer join

-- INNER JOIN

SELECT * FROM actor;
SELECT * FROM actor_award;
-- From both table actor id is common. so actor id can be taken as join parameter
SELECT * FROM actor INNER JOIN actor_award ON actor.actor_id = actor_award.actor_id; -- fetching all the data from actor and actor_award table. 
-- I don't want to see the null values 
-- joined on the basis from the actor table we kept actor_id and from the actor_award table kept actor_id
-- if there are any null values from the actor_id column, that result won't shown


-- LEFT JOIN
SELECT * FROM actor LEFT JOIN actor_award ON actor.actor_id = actor_award.actor_id;

-- RIGHT JOIN
SELECT * FROM actor RIGHT JOIN actor_award ON actor.actor_id = actor_award.actor_id;


-- Display all the cities in india?
SELECT * FROM country; -- country data
SELECT * FROM city; -- city data
-- from the tables the country id is common in both tables

SELECT city FROM city INNER JOIN country ON city.country_id = country.country_id WHERE country.country = "India";

-- Display all the cities with there postal code in india

SELECT * FROM country; -- country data
SELECT * FROM city; -- city data
SELECT * FROM address; -- postal code data

SELECT postal_code, city, country
FROM
	address
		INNER JOIN
	city ON address.city_id = city.city_id
		INNER JOIN
	country ON city.country_id = country.country_id
		WHERE 
	country = "India";
    
-- Display the names of the actors and the names of the films they have acted in.
SELECT * FROM actor; -- names of actors
SELECT * FROM film; -- name of the title of the films
SELECT * FROM film_actor; -- joining both the table with id which contains in this table

SELECT first_name, last_name, title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id;


-- also names can be used as full name (new column)
SELECT CONCAT(first_name, " ", last_name) AS Actor_name, title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id;

-- Display all actors and total number of films they have acted in 

-- according to the question we have to show all the actors. thats why here inner join will be wrong. 
-- we can use left join in this case

SELECT CONCAT(first_name, " ", last_name) as actor_name, COUNT(title)
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id
LEFT JOIN film ON film.film_id = film_actor.film_id
GROUP BY actor_name;