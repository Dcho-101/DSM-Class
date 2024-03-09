-- Window Function

-- Retrive the top five films with the higherst rental rates, displaying the film title, rental rate and the avarage rental rate for the all four films. use window function to rank the film based on their rental rates

SELECT title, rental_rate, 
AVG(rental_rate) OVER(), 
RANK() OVER(ORDER BY rental_rate DESC) FROM film 
ORDER BY rental_rate DESC LIMIT 5;

-- syntax
-- select col_name, window_func() over() from table_name;

-- find the total number of rentals for each customer, along with their indivitual rental counts and the avarage number of rentals across all customers.
-- rental == customer_id, count(rental), avg(count())
-- add new column with indivitual having higher value than avg is marked higher or else lower 
-- give me the list of people who rented movies higher than avarage
SELECT customer_id, COUNT(rental_id) AS total_count, AVG(COUNT(rental_id)) OVER() avg_count,
CASE WHEN COUNT(rental_id) - AVG(COUNT(rental_id)) OVER() > 0 THEN "Higher" ELSE "Lower" END count_stats
FROM rental GROUP BY customer_id;

-- Find the films that have been rented the least number of times. display the film title, rental count, and the avarage rental count across all the films

-- from - join - where - group by - having - select - order by- limit

SELECT title, COUNT(rental_id) AS no_of_rental_count, AVG(COUNT(rental_id)) OVER() FROM film f LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id GROUP BY title ORDER BY no_of_rental_count;


-- WINDOW FUNCTION --
-- there are some window functions which are introduced earlier. now we are learning about value functions which is LEAD and LAG functions

-- syntax for lead function
-- LEAD(column) OVER(ORDER BY column)

-- Display the title and rental duration of films from the database alongside the title and rental duration of the subsequent film (using LEAD function)

-- LEAD FUNCTION
SELECT title, rental_duration, LEAD(title) OVER(ORDER BY rental_duration),
LEAD(rental_duration) OVER(ORDER BY rental_duration) FROM film;

SELECT title, rental_duration, LEAD(title, 2) OVER(ORDER BY rental_duration),
LEAD(rental_duration, 2) OVER(ORDER BY rental_duration) FROM film; -- this will give us the 2nd value items every time

SELECT title, rental_duration, LAG(title, 2) OVER(ORDER BY title),
LAG(rental_duration, 2) OVER(ORDER BY rental_duration) FROM film;

-- LAG -- when you want to comapare performance on weekly basis

SELECT title, rental_duration, LAG(title, 7) OVER(ORDER BY title),
LAG(rental_duration, 7) OVER(ORDER BY rental_duration) FROM film;


-- User defined function

-- create a function to get a squared value 
-- answer

SET SQL_LOG_BIN = OFF;

SET GLOBAL log_bin_trust_function_creators = 1; -- this explains the user of this workbench can be trusted to create functions. it is one time creation only

delimiter // -- this explains that my code completion will be when I am using // instead of using ; (;) is the default delimiter used in mysql
CREATE FUNCTION squared(num INT)
RETURNS INT
BEGIN
DECLARE result INT;
SET result = num * num;
RETURN result;
END//
delimiter ;

-- Calling the function
SELECT squared(5);