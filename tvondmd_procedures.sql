--- DRAFT POCEDURES 3.1 AND 3.2 ---

-----Stored Procedure 3.1-----

DROP PROCEDURE IF EXISTS procedure_3.1;
DELIMITER $
CREATE PROCEDURE procedure_3.1(IN letter VARCHAR, IN quantity INT, IN date1 DATETIME, IN date2 DATETIME) 
BEGIN

---Declaring the required variables---
DECLARE date DATETIME;
DECLARE msg VARCHAR(50);
DECLARE NUMBER_OF_RENTS INT;
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
		INNER JOIN [dbo].[Events_Log] ON film_id=id_of_object
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
			FETCH rental_cursor INTO MOVIE_ID, MOVIE_NAME, NUMBER_OF_RENTS;
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
		INNER JOIN [dbo].[Events_Log] ON series_id=id_of_object
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
			FETCH rental_cursor INTO SERIES_ID, SERIES_NAME, NUMBER_OF_RENTS;
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
DROP PROCEDURE IF EXISTS procedure_3.2;
DELIMITER $
CREATE PROCEDURE procedure_3.1(IN customer_email VARCHAR, IN date3 DATETIME) 
BEGIN
DECLARE NUMBER_OF_RENTS DATETIME;



SELECT COUNT(event_category)
INTO NUMBER_OF_RENTS
FROM [dbo].[Events_Log]
INNER JOIN customer ON log_id=customer_id
WHERE event_category=rent_movie AND event_date=date3;
GROUP BY event_category;

END$
DELIMITER;