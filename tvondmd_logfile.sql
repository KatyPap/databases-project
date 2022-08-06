----- DRAFT CREATE for Log table-----
USE moviesondemand;
 
CREATE TABLE [dbo].[Events_Log]
	log_id SMALLINT(5) UNSIGNED NOT NULL,
	login_name VARCHAR(50) NOT NULL,
	event_category VARCHAR(50) NOT NULL,
	event_date DATETIME NOT NULL,
	name_of_object VARCHAR(256) NOT NULL,
	type_of_object VARCHAR(25) NOT NULL,
	id_of_object INT NOT NULL
;
 
ALTER TABLE [dbo].[Events_Log] ADD CONSTRAINT DF_EventsLog_event_date  
            DEFAULT GETDATE() FOR event_date
;
