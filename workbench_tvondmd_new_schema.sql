-- Alterations to the original schema --

-- DRAFT CREATE command for Log table --
CREATE TABLE logfile (
    event_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    login_email VARCHAR(50),
    login_id SMALLINT UNSIGNED,
    event_category VARCHAR(50) NOT NULL,
    event_date DATETIME,
    event_status ENUM ('Success', 'Failed') NOT NULL,
    on_table VARCHAR(50) NOT NULL,
    PRIMARY KEY (event_id),
    FOREIGN KEY (login_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (login_id) REFERENCES employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (login_id) REFERENCES administrator (administrator_id) ON DELETE CASCADE ON UPDATE CASCADE
); 

-- DRAFT CREATE commands for user's tables (ISA) --


-- DRAFT CREATE commands for series' tables --
CREATE TABLE series (
    series_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    description TEXT DEFAULT NULL,
    language_id TINYINT UNSIGNED NOT NULL,
    original_language_id TINYINT UNSIGNED DEFAULT NULL,
    seasons INT DEFAULT 1,
    release_year YEAR DEFAULT NULL,
    rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
    special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
    PRIMARY KEY (series_id),
    CONSTRAINT fk_series_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_series_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE season (
    season_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) DEFAULT 'unknown', 
    season_year YEAR DEFAULT NULL,
    episodes_per_season INT,
    series_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (season_id),
    CONSTRAINT fk_season_series FOREIGN KEY (series_id) REFERENCES series (series_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE episode (
    episode_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    length SMALLINT UNSIGNED DEFAULT NULL,
    season_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (episode_id),
    CONSTRAINT fk_episode_season FOREIGN KEY (season_id) REFERENCES season (season_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE series_actor (
  actor_id SMALLINT UNSIGNED NOT NULL,
  series_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (actor_id,series_id),
  CONSTRAINT fk_series_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_series_actor_series FOREIGN KEY (series_id) REFERENCES series (series_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE series_category (
  series_id SMALLINT UNSIGNED NOT NULL,
  category_id TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (series_id, category_id),
  CONSTRAINT fk_series_category_series FOREIGN KEY (series_id) REFERENCES series (series_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_series_category_category FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- DRAFT ALTER commands on existing tables --


-- Adding indexes to table actor --
ALTER TABLE rental
	ADD COLUMN type_of_rental VARCHAR(6)
;

ALTER TABLE actor
	ADD INDEX idx_lastname (lastname(8))
;


