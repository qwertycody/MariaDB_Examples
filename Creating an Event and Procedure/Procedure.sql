DROP PROCEDURE IF EXISTS `MariaDB-SchemaName`.`MY_MARIADB_PROCEDURENAME`;

-- This needs to be commented out unless testing locally in MySQL Workbench or equivalent
-- DELIMITER //
CREATE PROCEDURE `MariaDB-SchemaName`.`MY_MARIADB_PROCEDURENAME`(IN exampleBoolean BOOLEAN) 
BEGIN
    SELECT 'EXAMPLE QUERY' as example;
End
-- This needs to be commented out unless testing locally in MySQL Workbench or equivalent
-- //
-- DELIMITER ;

-- This needs to be commented out unless testing locally in MySQL Workbench or equivalent
-- CALL `MariaDB-SchemaName`.`MY_MARIADB_PROCEDURENAME`(FALSE); 