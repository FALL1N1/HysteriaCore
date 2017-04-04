ALTER TABLE `character_stats`
	ADD COLUMN `achievementPoints` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `resilience`;
ALTER TABLE `character_stats`
	ADD INDEX `achievementPoints` (`achievementPoints`);
