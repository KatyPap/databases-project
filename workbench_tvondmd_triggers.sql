-- DRAFT TRIGGERS 4.1 AND 4.2 --

-- Trigger 4.1 --
-- Isos xreiastei --

DROP TRIGGER IF EXISTS before_insert_on_rental;
DELIMITER $
CREATE TRIGGER before_insert_on_rental BEFORE INSERT ON rental FOR EACH ROW
BEGIN
DECLARE local_type_of_registration ;
SELECT registration
INTO type_of_registration
FROM customer
WHERE 
;

IF (type_of_registration='films') THEN
	set NEW.rental_id=;
ELSE IF (type_of_registration='series') THEN 
	set NEW.payment_id=NULL;
ELSE
	set NEW.payment_id=NULL;
END IF;
END$
DELIMITER ;



----- Tha xreiastoun -----
DROP TRIGGER IF EXISTS before_insert_on_payment;
DELIMITER $
CREATE TRIGGER before_insert_on_payment BEFORE INSERT ON rental FOR EACH ROW
BEGIN
    DECLARE 
    IF (something<ammount) THEN
        set NEW.payment_id=NULL;
END$
DELIMITER ;










-- Log triggers when changing rental --

DROP TRIGGER IF EXISTS log_after_insert_on_rental;
DELIMITER $
CREATE TRIGGER log_after_insert_on_rental AFTER INSERT ON rental FOR EACH ROW
BEGIN
    DECLARE r_id INT(4);
    DECLARE r_date DATETIME;

    DECLARE c_email VARCHAR(50);

    SELECT NEW.rental_id, NEW.rental_date, custormer_id, email
    INTO r_id, r_date, c_email
    FROM rental
    INNER JOIN customer ON rental.customer_id=customer.customer_id;
    INSERT INTO logfile(log_id, login_email, event_category, event_date, type_of_object, id_of_object)
    VALUES (c_email, 'New insert on Rental', r_date, 'Rental', r_id);
END$
DELIMITER ;

DROP TRIGGER IF EXISTS log_after_update_on_rental;
DELIMITER $
CREATE TRIGGER log_after_update_on_rental AFTER UPDATE ON rental FOR EACH ROW
BEGIN
    DECLARE r_id INT(4);
    DECLARE r_date DATETIME;

    DECLARE c_email VARCHAR(50);

    SELECT rental_id, rental_date, custormer_id, email
    INTO r_id, r_date, c_email
    FROM rental
    INNER JOIN customer ON rental.customer_id=customer.customer_id;
    INSERT INTO logfile(log_id, login_email, event_category, event_date, type_of_object, id_of_object)
    VALUES (c_email, 'New insert on Rental', r_date, 'Rental', r_id);
END$
DELIMITER ;

DROP TRIGGER IF EXISTS log_after_delete_on_rental;
DELIMITER $
CREATE TRIGGER log_after_delete_on_rental AFTER DELETE ON rental FOR EACH ROW
BEGIN
    DECLARE r_id INT(4);
    DECLARE r_date DATETIME;

    DECLARE c_email VARCHAR(50);

    SELECT rental_id, rental_date, custormer_id, email
    INTO r_id, r_date, c_email
    FROM rental
    INNER JOIN customer ON rental.customer_id=customer.customer_id;
    INSERT INTO logfile(log_id, login_email, event_category, event_date, type_of_object, id_of_object)
    VALUES (c_email, 'New insert on Rental', r_date, 'Rental', r_id);
END$
DELIMITER ;




-- Trigger 4.2 --
DROP TRIGGER IF EXISTS payment_before_insert;
DELIMITER $
CREATE TRIGGER payment_before_insert BEFORE INSERT ON payment FOR EACH ROW
BEGIN
    DECLARE r_id INT;
    DECLARE r_date DATETIME;
    DECLARE c_email VARCHAR(50);

    CALL procedure_32;

    SELECT rental_id, rental_date, custormer_id, email
    INTO r_id, r_date, c_email
    FROM rental
    INNER JOIN customer ON rental.customer_id=customer.customer_id;
    INSERT INTO logfile(login_email, event_category, event_date, type_of_object, id_of_object)
    VALUES (c_email, 'New insert on Rental', r_date, 'Rental', r_id);
END$
DELIMITER ;