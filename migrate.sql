-- MySQL one file database schema migrations

-- DO NOT CHANGE BEGINNING OF THIS SCRIPT --
-- This part will ensure that you have migration stuff in place 
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` VARCHAR(150) NOT NULL,
  `migrationDate` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`));

DROP PROCEDURE IF  EXISTS migratedb;
delimiter //
CREATE PROCEDURE migratedb(IN migration_id VARCHAR(150), IN migration_query TEXT) 
begin
    set @existing_migration := (select id from migrations where id = migration_id);
    SET @q := migration_query;
	if @existing_migration IS null then
		PREPARE stmt1 FROM @q; 
		EXECUTE stmt1; 
		DEALLOCATE PREPARE stmt1; 
        insert into migrations(id, migrationDate) values(migration_id, NOW());
	end if;
end;
//
delimiter ;

-- ADD YOUR MIGRATIONS AFTER THIS LINE --

-- Example:
-- CALL migratedb('2018-10-05 00:00:00 Sample migration', 'SELECT 1');
-- CALL migratedb('2018-10-05 01:01:01 Sample migration', 'SELECT 1');