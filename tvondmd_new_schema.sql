 ----- Alterations to the original schema -----

----- DRAFT CREATE for Log table-----
 
CREATE TABLE logfile
    event_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    login_email VARCHAR(50) NOT NULL,
    event_category VARCHAR(50) NOT NULL,
    event_date DATETIME DEFAULT GETDATE(),
    event_status ENUM ('Success', 'Failed') NOT NULL,
    type_of_object VARCHAR(25) NOT NULL,
    id_of_object INT NOT NULL,
    PRIMARY KEY (event_id)
    CONSTRAINT fk_logfile_rental FOREIGN KEY (rental_id) REFERENCES rental (rental_id) ON DELETE RESTRICT ON UPDATE CASCADE
    CONSTRAINT fk_logfile_payment FOREIGN KEY (payment_id) REFERENCES payment (payment_id) ON DELETE RESTRICT ON UPDATE CASCADE
;

