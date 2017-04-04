ALTER TABLE `account`
	CHANGE COLUMN `expansion` `expansion` TINYINT(3) UNSIGNED NOT NULL DEFAULT '2' AFTER `online`;
