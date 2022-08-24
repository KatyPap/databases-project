-- DRAFT TRIGGERS 4.1 AND 4.2 --

-- Triggers 4.1 --

-- Trigger 1 --
DROP TRIGGER IF EXISTS before_delete_on_rental;
DELIMITER $
CREATE TRIGGER before_delete_on_rental BEFORE DELETE ON rental FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'An error occurred, deletion from rental not supported.';
END$
DELIMITER ;

-- Trigger 2 --
DROP TRIGGER IF EXISTS before_delete_on_payment;
DELIMITER $
CREATE TRIGGER before_delete_on_payment BEFORE DELETE ON payment FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'An error occurred, deletion from payment not supported.';
END$
DELIMITER ;


DROP TRIGGER IF EXISTS before_insert_on_rental;
DELIMITER $
CREATE TRIGGER before_insert_on_rental BEFORE INSERT ON rental FOR EACH ROW
BEGIN
DECLARE local_type_of_rental ENUM('films', 'series');
DECLARE local_film_id SMALLINT UNSIGNED;
DECLARE local_series_id SMALLINT UNSIGNED;

SELECT film_id, series_id
INTO local_film_id, local_series_id
FROM inventory
WHERE CURRENT_USER()
;

IF (local_series_id=NULL) THEN
	set NEW.type_of_rental='films';
ELSEIF (local_film_id=NULL) THEN 
	set NEW.type_of_rental='series';
END IF;
END$
DELIMITER ;



-- Tha xreiastoun --
-- Log triggers when doing tasks on rental and payment --
-- Only 2 triggers from rental and 2 triggers from payment  --


-- 1 --
DROP TRIGGER IF EXISTS log_after_insert_on_rental;
DELIMITER $
CREATE TRIGGER log_after_insert_on_rental AFTER INSERT ON rental FOR EACH ROW
BEGIN
    DECLARE r_id INT(4);
    DECLARE r_date DATETIME;
    DECLARE c_email VARCHAR(50);

    SELECT NEW.rental_id, NEW.rental_date, email
    INTO r_id, r_date, c_email
    FROM rental
    INNER JOIN customer ON rental.customer_id=customer.customer_id
    WHERE CURRENT_USER();
    INSERT INTO logfile(log_id, login_email, event_category, event_date, type_of_object, id_of_object)
    VALUES (c_email, 'New insert on Rental', r_date, 'Rental', r_id);
END$
DELIMITER ;



-- 2 --
DROP TRIGGER IF EXISTS log_after_insert_on_payment;
DELIMITER $
CREATE TRIGGER log_after_insert_on_payment AFTER INSERT ON payment FOR EACH ROW
BEGIN
    DECLARE r_id INT(4);
    DECLARE r_date DATETIME;
    DECLARE c_email VARCHAR(50);

    SELECT NEW.payment_id, NEW.payment_date, email
    INTO r_id, r_date, c_email
    FROM rental
    INNER JOIN customer ON rental.customer_id=customer.customer_id
    WHERE CURRENT_USER();
    INSERT INTO logfile(log_id, login_email, event_category, event_date, type_of_object, id_of_object)
    VALUES (c_email, 'New insert on Payment', r_date, 'Payment', r_id);
END$
DELIMITER ;

-- 3 --
DROP TRIGGER IF EXISTS log_after_update_on_rental;
DELIMITER $
CREATE TRIGGER log_after_update_on_rental AFTER UPDATE ON rental FOR EACH ROW
BEGIN
DECLARE local_admin_email varchar(50);
DECLARE local_admin_id INT(4);
SELECT USER INTO local_admin_email, local_admin_id
FROM admin
ORDER BY DATE DESC
LIMIT 1;
INSERT INTO log
VALUES (local_admin_email, 'Success', 'New Update on rental', now(), 'rental', local_admin_id);
END$
DELIMITER ;

-- 4 --
DROP TRIGGER IF EXISTS log_after_update_on_payment;
DELIMITER $
CREATE TRIGGER log_after_update_on_payment AFTER UPDATE ON payment FOR EACH ROW
BEGIN

END$
DELIMITER ;


-- Trigger 4.2 --
DROP TRIGGER IF EXISTS before_insert_on_payment;
DELIMITER $
CREATE TRIGGER before_insert_on_payment BEFORE INSERT ON payment FOR EACH ROW
BEGIN
DECLARE r_id INT;
DECLARE r_date DATETIME;
DECLARE c_id SMALLINT UNSIGNED;
DECLARE c_email VARCHAR(50);
DECLARE local_type_of_rental VARCHAR(6);
DECLARE local_type_of_registration VARCHAR(6);

SELECT rental_id, CURRENT_USER()
INTO r_id, c_id, c_email
FROM rental
INNER JOIN customer ON rental.customer_id=customer_customer_id
ORDER BY DATE DESC
LIMIT 1
;

CALL procedure_32(c_email, CURRENT_DATE());

IF (number_of_rents%3!=0) THEN
	IF (type_of_rental='film' AND type_of_registration='films') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.4);
	ELSEIF (type_of_rental='film' AND type_of_registration='both') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.3);
	ELSEIF (type_of_rental='series' AND type_of_registration='series') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.2);
	ELSEIF (type_of_rental='series' AND type_of_registration='both') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.1);
	END IF;
ELSEIF (number_of_rents%3=0) THEN
	IF (type_of_rental='film' AND type_of_registration='films') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.2);
	ELSEIF (type_of_rental='film' AND type_of_registration='both') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.15);
	ELSEIF (type_of_rental='series' AND type_of_registration='series') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.1);
	ELSEIF (type_of_rental='series' AND type_of_registration='both') THEN
		INSERT INTO payment(NEW.amount)
		VALUES (0.05);
	END IF;
END IF;
END$
DELIMITER ;

-- Trigger 4.3 --
DROP TRIGGER IF EXISTS before_update_on_customer;
DELIMITER $
CREATE TRIGGER before_update_on_customer BEFORE UPDATE ON customer FOR EACH ROW
BEGIN
DECLARE c_id SMALLINT UNSIGNED;
DECLARE c_email VARCHAR(50);

SELECT CURRENT_USER()
INTO c_id, c_email
FROM customer
ORDER BY DATE DESC
LIMIT 1
;

IF (c_email!=NEW.email) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'An error occurred, udates of email not supported.';
END IF;

END$
DELIMITER ;
