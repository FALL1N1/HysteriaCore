ALTER TABLE `game_event`
ADD COLUMN `announce` tinyint(3) unsigned NULL DEFAULT 2 COMMENT '0 dont announce, 1 announce, 2 value from config' AFTER `world_event`;

ALTER TABLE `skill_extra_item_template`
	CHANGE COLUMN `newMaxOrEntry` `additionalMaxNum` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'max num of adds' AFTER `additionalCreateChance`;

ALTER TABLE `quest_poi_points`
	DROP PRIMARY KEY;

ALTER TABLE `player_factionchange_items`
	CHANGE COLUMN `alliance_comment` `commentA` TEXT NOT NULL AFTER `alliance_id`,
	CHANGE COLUMN `horde_comment` `commentH` TEXT NOT NULL AFTER `horde_id`;

ALTER TABLE `player_factionchange_spells`
	CHANGE COLUMN `alliance_comment` `commentA` TEXT NOT NULL AFTER `alliance_id`,
	CHANGE COLUMN `horde_comment` `commentH` TEXT NOT NULL AFTER `horde_id`;

ALTER TABLE `player_factionchange_items`
	ADD COLUMN `race_A` INT(10) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `commentA` `commentA` TEXT NULL AFTER `alliance_id`,
	ADD COLUMN `race_H` INT(10) UNSIGNED NOT NULL AFTER `commentA`,
	CHANGE COLUMN `horde_id` `horde_id` INT(10) UNSIGNED NOT NULL AFTER `race_H`,
	CHANGE COLUMN `commentH` `commentH` TEXT NULL AFTER `horde_id`;
