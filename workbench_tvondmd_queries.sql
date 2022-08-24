-- Queries for testing the STORED PROCEDURES--

-- Testing stored procedure 3.4a
SELECT *
FROM actor
ORDER BY last_name
;

SELECT *
FROM actor
WHERE last_name BETWEEN 'Or%' AND 'Pri%' 
ORDER BY last_name
;


-- Queries for testing the TRIGGERS--

SELECT * 
FROM rental
ORDER BY rental_id
;

DELETE FROM rental WHERE rental_id=16040;

SELECT * 
FROM payment
ORDER BY payment_id
;

DELETE FROM payment WHERE payment_id=434;

