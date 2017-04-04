ALTER TABLE `creature_template`
	ADD COLUMN `AddedInBuild` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `VerifiedBuild`;
    
ALTER TABLE `gameobject_template`
	ADD COLUMN `AddedInBuild` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `VerifiedBuild`;

ALTER TABLE `item_template`
	ADD COLUMN `AddedInBuild` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `VerifiedBuild`;

ALTER TABLE `quest_template`
	ADD COLUMN `AddedInBuild` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `VerifiedBuild`;

