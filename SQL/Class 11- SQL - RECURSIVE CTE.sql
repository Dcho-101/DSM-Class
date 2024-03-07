-- CTE - Common Table Expression
-- Recursive CTE

-- CTE is Common table Expression which is reused again and again within a single set of query

-- Syntax
-- WITH RECURSIVE NAME AS (ANCHOR QUERY UNION/UNION ALL RECURSIVE QUERY) SELECT * FROM NAME

-- Find even number between 10 to 20
-- anchor point is 10 in this query
WITH RECURSIVE even_no(n) AS
(SELECT 10 -- ANCHOR 
UNION ALL 
SELECT n+2 FROM even_no WHERE n<20) -- RECURSIVE
SELECT * FROM even_no;

-- Find odd number between 5 to 25
WITH RECURSIVE odd_num(n) AS
(SELECT 5
UNION ALL
SELECT n+2 FROM odd_num WHERE n<25)
SELECT * FROM odd_num;


-- WINDOW FUNCTION
-- Window function is a function similar to aggregate, raniking and Value functions
-- Aggregate function contains SUM,COUNT, and AVARAGE
-- Ranking contains ROW NUMBER, RANK, and DENSE RANK
-- value contains LEAD and LAG

-- Question 1
-- Calculate the avarage rental duration for films and display both the indivitual avarage duration
-- for each film and the overall avarage duration

SELECT film_id, title, rental_duration, AVG(rental_duration) OVER(),
AVG(rental_duration) OVER(PARTITION BY rating)
 FROM film;
 
-- Assign the rank based on the ratings along with rental_duration

SELECT film_id, rating, title, rental_duration,
RANK() OVER(PARTITION BY rating ORDER BY rental_duration)
 FROM film;