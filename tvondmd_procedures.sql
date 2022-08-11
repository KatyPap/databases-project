--- DRAFT POCEDURES 3.1 AND 3.2 ---

-----Stored Procedure 3.1-----

DROP PROCEDURE IF EXISTS procedure_31;
DELIMITER $
CREATE PROCEDURE procedure_31(IN letter VARCHAR, IN quantity INT, IN date1 DATETIME, IN date2 DATETIME) 
BEGIN

---Declaring the required variables---
DECLARE date DATETIME;
DECLARE msg VARCHAR(50);
DECLARE number_of_rents INT;
DECLARE MOVIE_ID SMALLINT;
DECLARE MOVIE_NAME VARCHAR;
DECLARE SERIES_ID SMALLINT;
DECLARE SERIES_NAME VARCHAR;

---Declaring a flag for the cursor that follows---
DECLARE rental_cursor_flag INT; 

IF (letter=='m') THEN

	SET msg = 'Top 5 rented movies:'
	SELECT msg;
	---Declaring a cursor for the SELECT command that follows right after it---
	DECLARE rental_cursor CURSOR  FOR
		SELECT film_id, film_ title, COUNT(event_category)
		FROM film
		INNER JOIN logfile ON film_id=id_of_object
		WHERE event_category=movie_rent AND event_date>=date1 AND event_date<=date2
		ORDER BY COUNT(event_category) DESC
		GROUP BY event_category;

	---Declaring the value of the flag which will indicate that the cursor went through the results---
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET rental_cursor_flag=quantity;

	---Setting an initial value for the flag
	SET rental_cursor_flag=0;

	---Letting the cursor run the command it is linked to---
	OPEN rental_cursor;
	REPEAT
		IF (rental_cursor_flag=0) THEN
			FETCH rental_cursor INTO MOVIE_ID, MOVIE_NAME, number_of_rents;
		END IF;
	UNTIL (rental_cursor_flag=quantity)
	END REPEAT;
	CLOSE rental_cursor;

ELSE IF (letter='s')
	SET msg = 'Top 5 rented series:'
	SELECT msg;
	---Declaring a cursor for the SELECT command that follows right after it---
	DECLARE rental_cursor CURSOR  FOR
		SELECT series_id, series_ title, COUNT(event_category)
		FROM series
		INNER JOIN logfile ON series_id=id_of_object
		WHERE event_category=series_rent AND event_date>=date1 AND event_date<=date2
		ORDER BY COUNT(event_category) DESC
		GROUP BY event_category;

	---Declaring the value of the flag which will indicate that the cursor went through the results---
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET rental_cursor_flag=quantity;

	---Setting an initial value for the flag
	SET rental_cursor_flag=0;

	---Letting the cursor run the command it is linked to---
	OPEN rental_cursor;
	REPEAT
		IF (rental_cursor_flag=0) THEN
			FETCH rental_cursor INTO SERIES_ID, SERIES_NAME, number_of_rents;
		END IF;
		UNTIL (rental_cursor_flag=quantity)
	END REPEAT;
	CLOSE rental_cursor;

ELSE
	set msg = 'Not applicable action';
	SELECT msg;
END IF

END$
DELIMITER ;


-----Stored Procedure 3.2-----
DROP PROCEDURE IF EXISTS procedure_32;
DELIMITER $
CREATE PROCEDURE procedure_32(IN customer_email VARCHAR, IN date3 DATETIME, OUT number_of_rents INT) 
BEGIN
DECLARE msg VARCHAR(50);
DECLARE ID SMALLINT; 
DECLARE type_of_registration VARCHAR;
DECLARE films_rents INT; 
DECLARE series_rents INT; 

SELECT customer_id, registration
INTO ID, type_of_registration
FROM customer
WHERE email=customer_email;

SET msg = 'The type of registration of this customer is:';
SELECT msg;
SELECT type_of_registration;

IF (type_of_registration='both')	
	SELECT COUNT(*)
	INTO films_rents
	FROM rental
	INNER JOIN films_inventory ON rental.f_iventory_id=films_inventory.inventory_id
	WHERE rental_date=date3 AND customer_id=ID;
	GROUP BY customer_id;

	SELECT COUNT(*)
	INTO series_rents
	FROM rental
	INNER JOIN series_inventory ON rental.s_iventory_id=series_inventory.inventory_id
	WHERE rental_date=date3 AND customer_id=ID;
	GROUP BY customer_id;

	SET msg = 'The number of rents of this customer is:';
	SET total_number_of_rents = films_rents + series_rents;
	SELECT total_number_of_rents;


END$
DELIMITER;

-----Stored Procedure 3.3-----
DROP PROCEDURE IF EXISTS procedure_33;
DELIMITER $
CREATE PROCEDURE procedure_33(IN customer_email VARCHAR, IN date3 DATETIME) 
BEGIN
DECLARE msg VARCHAR(50);
DECLARE ID SMALLINT; 
DECLARE number_of_rents DATETIME;

SELECT customer_id
INTO ID
FROM customer
WHERE email=customer_email;

SELECT COUNT(*)
INTO number_of_rents
FROM rental
WHERE rental_date=date3 AND customer_id=ID;
GROUP BY event_category;

SET msg = 'Number of rentals for this customer is:';
SELECT number_of_rents;
END$
DELIMITER;

