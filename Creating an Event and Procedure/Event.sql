-- See what timezone the MySQL/MariaDB Server is using
-- SELECT @@system_time_zone;

-- Production is using UTC 

-- See if event_scheduler shows up as a user
-- SHOW PROCESSLIST;

-- Turn it on if it's not enabled
-- SET GLOBAL event_scheduler = ON;

-- Show that it's now enabled
-- SHOW PROCESSLIST;

-- Get Today's Date and the Desired Refresh Time
SET @refresh_date=DATE_FORMAT(NOW(), '%Y-%m-%d');
SET @refresh_time='11:30:00';

-- Create Variable representing the Refresh Time
SET @refresh=CONCAT(@refresh_date, ' ', @refresh_time);
select @refresh;

-- Get a time in EST converted to UTC
SET @refresh_utc=convert_tz(@refresh,'US/Eastern','UTC');
select @refresh_utc;

-- Drop Event if it Exists Already
DROP EVENT IF EXISTS `MariaDB-SchemaName`.MY_MARIADB_EVENT_NAME;

-- Create Event and Execute Every 24 Hours
CREATE EVENT `MariaDB-SchemaName`.MY_MARIADB_EVENT_NAME
ON SCHEDULE EVERY 24 HOUR
STARTS @refresh_utc
ON COMPLETION PRESERVE
DO CALL `MariaDB-SchemaName`.`MY_MARIADB_PROCEDURENAME`(TRUE);

-- Enable Event
ALTER EVENT `MariaDB-SchemaName`.MY_MARIADB_EVENT_NAME ENABLE;

-- Show the Events
SHOW EVENTS FROM `MariaDB-SchemaName`;