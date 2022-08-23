USE tvondemand;
-- DRAFT code for the requested PROCEDURES --

-- Stored Procedure 3.1 --
-- NOTE: Possibly it is completed --

DROP PROCEDURE IF EXISTS procedure_31;
DELIMITER $
CREATE PROCEDURE procedure_31(IN letter VARCHAR(1), IN quantity INT, IN date1 DATETIME, IN date2 DATETIME) 
BEGIN

-- Declaring the required local variables --
DECLARE date DATETIME;
DECLARE msg VARCHAR(50);
DECLARE local_number_of_rents INT;
DECLARE local_film_id SMALLINT;
DECLARE local_film_name VARCHAR(128);
DECLARE local_series_id SMALLINT;
DECLARE local_series_name VARCHAR(128);

-- Declaring our 1st cursor for the SELECT command that retrieves the films --
DECLARE films_rental_cursor CURSOR FOR
	SELECT film_id, title, COUNT(*)
	FROM film
	INNER JOIN inventory ON film.film_id=inventory.film_id
	INNER JOIN rental ON inventory.inventory_id=rental.inventory_id
	WHERE rental_date>=date1 AND rental_date<=date2
    GROUP BY rental_id
	ORDER BY COUNT(*) DESC
	LIMIT quantity
;

-- Declaring our 2nd cursor for the SELECT command that retrieves the series --
DECLARE series_rental_cursor CURSOR FOR
	SELECT series_id, title, COUNT(*)
	FROM series
	INNER JOIN inventory ON series.series_id=inventory.series_id
	INNER JOIN rental ON inventory.inventory_id=rental.inventory_id
	WHERE rental_date>=date1 AND rental_date<=date2
    GROUP BY rental_id
	ORDER BY COUNT(*) DESC
	LIMIT quantity
;

-- Declaring an exit flag for the cursors --
DECLARE cursor_exit_flag INT; 

-- Declaring the value of the flag which will indicate that the cursor went through the results --
DECLARE CONTINUE HANDLER FOR NOT FOUND SET cursor_exit_flag=quantity;

-- Setting an initial value for the flag --
SET cursor_exit_flag=0;
    
IF (letter='m') THEN

	SET msg = 'Top 5 rented films:';
	SELECT msg;
    
	-- Allowing the (1st) cursor to run the command that retrieves the top 5 rented films --
	OPEN films_rental_cursor;
    BEGIN
		REPEAT
			IF (cursor_exit_flag<quantity) THEN
				FETCH films_rental_cursor INTO local_film_id, local_film_name, local_number_of_rents;
				SELECT local_films_id, local_films_name, local_number_of_rents;
			END IF;
		UNTIL (cursor_exit_flag=quantity)
		END REPEAT;
	END;
	CLOSE films_rental_cursor;

ELSEIF (letter='s') THEN

	SET msg = 'Top 5 rented series:';
	SELECT msg;

	-- Allowing the (2nd) cursor to run the command that retrieves the top 5 rented series --
	OPEN series_rental_cursor;
    BEGIN
		REPEAT
			IF (cursor_exit_flag<quantity) THEN
				FETCH series_rental_cursor INTO local_series_id, local_series_name, local_number_of_rents;
                SELECT local_series_id, local_series_name, local_number_of_rents;
			END IF;
		UNTIL (cursor_exit_flag=quantity)
		END REPEAT;
	END;
	CLOSE series_rental_cursor;
    
ELSE

	set msg = 'Not applicable action';
	SELECT msg;

END IF;

END$
DELIMITER ;


-- Stored Procedure 3.2 --
-- NOTE: Possibly it is completed --

DROP PROCEDURE IF EXISTS procedure_32;
DELIMITER $
CREATE PROCEDURE procedure_32(IN customer_email VARCHAR(50), IN date3 DATETIME, OUT number_of_rents INT) 
BEGIN
DECLARE msg VARCHAR(50);
DECLARE local_id SMALLINT; 
DECLARE local_registration_type VARCHAR(6);


SELECT customer_id, registration
INTO local_id, local_registration_type
FROM customer
WHERE email=customer_email;

SET msg = 'The type of registration of this customer is:';
SELECT msg;
SELECT local_registration_type;

SELECT COUNT(*)
INTO films_rents
FROM rental
INNER JOIN inventory ON rental.iventory_id=inventory.inventory_id
WHERE rental_date=date3 AND customer_id=local_id
GROUP BY customer_id;

SET msg = 'The number of rents of the customer is:';
SELECT number_of_rents;

END$
DELIMITER;

-----Stored Procedure 3.3-----
DROP PROCEDURE IF EXISTS procedure_33;
DELIMITER $
CREATE PROCEDURE procedure_33() 
BEGIN
DECLARE msg VARCHAR(50);
DECLARE local_id SMALLINT;
DECLARE local_films_sum INT;
DECLARE local_series_sum INT;
DECLARE local_income INT;

SELECT SUM(amount)
INTO local_films_sum
FROM payment
INNER JOIN rental ON payment.rental_id=rental.rental_id
WHERE type_of_rental = 'film'
GROUP BY type_of_rental
;

SELECT SUM(amount)
INTO local_series_sum
FROM payment
INNER JOIN rental ON payment.rental_id=rental.rental_id
WHERE type_of_rental = 'series'
GROUP BY type_of_rental
;


SET msg = 'Total income of this month';
SET income = SUM(local_films_sum + local_series_sum);
SELECT income;
END$
DELIMITER ;


-- Stored Procedure 3.4a --


DROP PROCEDURE IF EXISTS procedure_34a;
DELIMITER $
CREATE PROCEDURE procedure_34a(IN lastname1 VARCHAR(45), IN  lastname2 VARCHAR(45)) 
BEGIN
-- Declaring the required local variables --
DECLARE msg VARCHAR(50);
DECLARE local_id SMALLINT UNSIGNED;
DECLARE local_name VARCHAR(45);
DECLARE local_lastname VARCHAR(45);
DECLARE Number_of_Actors INT;

-- Declaring an exit flag for the cursor --
DECLARE cursor_exit_flag INT; 

-- Declaring our cursor for the SELECT command that retrieves the actors' data --
DECLARE actors_data_cursor CURSOR FOR
	SELECT actor_id
    FROM actor
    WHERE last_name BETWEEN lastname1 AND lastname2
;

-- Declaring the value of the flag which will indicate that the cursor went through the results --
DECLARE CONTINUE HANDLER FOR NOT FOUND SET cursor_exit_flag=1;

-- Setting an initial value for the flag --
SET cursor_exit_flag=0;

SELECT COUNT(*)
INTO Number_of_Actors
FROM actor USE INDEX(idx_lastname)
WHERE last_name BETWEEN lastname1 AND lastname2
;

-- Allowing the cursor to run the command that retrieves the actors' data --
OPEN actors_data_cursor;
BEGIN
	REPEAT
		IF (cursor_exit_flag<=1) THEN
			FETCH actors_data_cursor INTO local_id;
            SELECT first_name, last_name
			FROM actor
			WHERE last_name BETWEEN lastname1 AND lastname2 
			ORDER BY last_name;
			END IF;
		UNTIL (cursor_exit_flag>1)
		END REPEAT;
	END;
CLOSE actors_data_cursor;
SELECT Number_of_Actors;
END$
DELIMITER ;



-- Stored Procedure 3.4b --


DROP PROCEDURE IF EXISTS procedure_34b;
DELIMITER $
CREATE PROCEDURE procedure_34b(IN actor_lastaname VARCHAR(45)) 
BEGIN
-- Declaring the required local variables --
DECLARE msg VARCHAR(50);
DECLARE local_name VARCHAR(45);
DECLARE local_lastname VARCHAR(45);
DECLARE local_count INT;

-- Declaring our cursor for the SELECT command that retrieves the actors' data --
DECLARE actors_data_cursor CURSOR FOR
	SELECT first_name AS Actor_Name, last_name AS Actor_Lastname, COUNT(*) AS Number_of_Actors
	FROM actor
	WHERE last_name>='lastname1%' AND last_name<='lastname2%'
    GROUP BY last_name
	ORDER BY last_name
;

-- Declaring an exit flag for the cursor --
DECLARE cursor_exit_flag INT; 

-- Declaring the value of the flag which will indicate that the cursor went through the results --
DECLARE CONTINUE HANDLER FOR NOT FOUND SET cursor_exit_flag=1;

-- Setting an initial value for the flag --
SET cursor_exit_flag=0;

SELECT COUNT(*)
FROM actor
INTO local_count
WHERE last_name>=actor_lastname
GROUP BY last_name
ORDER BY last_name
;

-- Allowing the cursor to run the command that retrieves the actors' data --
OPEN actors_data_cursor;
BEGIN
	REPEAT
		IF (cursor_exit_flag<1) THEN
			FETCH actors_data_cursor INTO local_name, local_lastname, local_count;
				SELECT local_name, local_lastname, local_count;
			END IF;
		UNTIL (cursor_exit_flag=1)
		END REPEAT;
	END;
CLOSE actors_data_cursor;

END$
DELIMITER ;
