/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP TABLE IF EXISTS `character_template`;
CREATE TABLE IF NOT EXISTS `character_template` (
  `ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Money` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DELETE FROM `character_template`;
/*!40000 ALTER TABLE `character_template` DISABLE KEYS */;
INSERT INTO `character_template` (`ID`, `Name`, `Level`, `Money`) VALUES
	(1, 'Shaman Restoration iLvl 187, Level 80', 80, 100000000);
/*!40000 ALTER TABLE `character_template` ENABLE KEYS */;


DROP TABLE IF EXISTS `character_template_item`;
CREATE TABLE IF NOT EXISTS `character_template_item` (
  `TemplateID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ItemID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`TemplateID`,`ItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DELETE FROM `character_template_item`;
/*!40000 ALTER TABLE `character_template_item` DISABLE KEYS */;
INSERT INTO `character_template_item` (`TemplateID`, `ItemID`, `Count`, `Comment`) VALUES
	(1, 43599, 1, 'Big Blizzard Bear'),
	(1, 37011, 1, 'Magic Broom'),
	(1, 38082, 4, '"Gigantique" Bag'),
	(1, 43450, 1, 'Stormhide Belt'),
	(1, 43455, 1, 'Stormhide Crown'),
	(1, 43454, 1, 'Stormhide Grips'),
	(1, 43453, 1, 'Stormhide Hauberk'),
	(1, 43456, 1, 'Stormhide Legguards'),
	(1, 43457, 1, 'Stormhide Shoulders'),
	(1, 43451, 1, 'Stormhide Stompers'),
	(1, 43452, 1, 'Stormhide Wristguards'),
	(1, 38368, 1, 'Totem of the Bay'),
	(1, 37112, 1, 'Beguiling Scepter'),
	(1, 37061, 1, 'Tor\'s Crest'),
	(1, 36943, 1, 'Timeless Beads of Eternos'),
	(1, 36972, 1, 'Tome of Arcane Phenomena'),
	(1, 37079, 1, 'Enchanted Wire Stitching'),
	(1, 43498, 1, 'Savage Titanium Band'),
	(1, 36983, 1, 'Cape of Seething Steam'),
	(1, 37111, 1, 'Soul Preserver');
/*!40000 ALTER TABLE `character_template_item` ENABLE KEYS */;


DROP TABLE IF EXISTS `character_template_spell`;
CREATE TABLE IF NOT EXISTS `character_template_spell` (
  `TemplateID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SpellID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`TemplateID`,`SpellID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_template_spell`;
/*!40000 ALTER TABLE `character_template_spell` DISABLE KEYS */;
INSERT INTO `character_template_spell` (`TemplateID`, `SpellID`, `Comment`) VALUES
	(1, 3599, 'Searing Totem - Rank 1'),
	(1, 5394, 'Healing Stream Totem - Rank 1'),
	(1, 8071, 'Stoneskin Totem - Rank 1'),
	(1, 34091, 'Artisan Riding'),
	(1, 8737, 'Mail');
/*!40000 ALTER TABLE `character_template_spell` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


REPLACE INTO `sunwell_world`.`command` (`name`, `security`, `help`) VALUES ('character template', 4, 'Syntax: .character template [$playername] [#templateId]\r\n\r\nChanges player level, money, adds items, spells, based on selected template.\r\nFor template ID - use lookup char_template command.');

REPLACE INTO `sunwell_world`.`command` (`name`, `security`, `help`) VALUES ('lookup char_template', 3, 'Syntax: .lookup char_template $namepart\r\n\r\nLooks up a character template by $namepart, and returns all matches with their templates ID\'s.');
