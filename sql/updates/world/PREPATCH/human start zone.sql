-- Questgiver incorrectly thanks player for meat after asking them to get pelts
UPDATE `quest_template` SET `OfferRewardText`='\'Twas a grim task, friend, but you held up your part of the bargain.\r\n\r\nI have some things here you might want - take your pick!' WHERE `id`=33;
UPDATE `quest_template` SET `RequestItemsText`='Hey $N. How goes the hunt for diseased young wolves?' WHERE `id`=33;
UPDATE `quest_template` SET `Details`='I hate those nasty timber wolves! But I sure like eating wolf steaks... Bring me tough wolf meat and I will exchange it for something you\'ll find useful.\r\n\r\nTough wolf meat is gathered from hunting the timber wolves and young wolves wandering the Northshire countryside. ' WHERE  `Id`=33;


-- wolves should be "Young Wolf" instead.
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`, `AddedInBuild`) VALUES 
-- AFTER 3.3.0
-- (299, 0, 0, 0, 0, 0, 31049, 0, 0, 0, 'Diseased Young Wolf', '', NULL, 0, 1, 1, 0, 32, 0, 1, 0.85714, 1, 0, 2, 2, 0, 24, 1, 2000, 2000, 1, 0, 2048, 0, 1, 0, 0, 0, 0, 1, 1, 100, 1, 1, 299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13059, 0, 0, 0, '', 1, 1, 1, 1, 1, 1, 0, 50432, 0, 0, 0, 0, 0, 100, 1, 0, 0, '', 12340, 0),
-- BEFORE 3.3.0
(299, 0, 0, 0, 0, 0, 10274, 0, 0, 0, 'Young Wolf', '', NULL, 0, 1, 1, 0, 32, 0, 1, 0.85714, 0.5, 0, 2, 2, 0, 24, 1, 2000, 2000, 1, 0, 2048, 0, 1, 0, 0, 0, 0, 1, 1, 100, 1, 1, 299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13059, 0, 0, 0, '', 1, 1, 1, 1, 1, 1, 0, 50432, 0, 0, 0, 0, 0, 100, 1, 0, 0, '', 12340, 0);
-- should be 1;3
UPDATE `creature_template` SET `maxlevel`=3 where `entry` = 299;

-- before 3.3.0 750 / after 50432
UPDATE `creature_loot_template` SET `item` = 750 WHERE `item`=50432;
UPDATE `quest_template` SET `RequiredItemId1`=750 WHERE `Id`=33;
UPDATE `creature_template` SET `questItem1`=750 WHERE `questItem1`=50432;