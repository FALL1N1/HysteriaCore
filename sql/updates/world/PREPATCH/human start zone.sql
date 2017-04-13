-- Questgiver incorrectly thanks player for meat after asking them to get pelts
UPDATE `quest_template` SET `OfferRewardText`='\'Twas a grim task, friend, but you held up your part of the bargain.\r\n\r\nI have some things here you might want - take your pick!' WHERE `id`=33;
UPDATE `quest_template` SET `RequestItemsText`='Hey $N. How goes the hunt for diseased young wolves?' WHERE `id`=33;
UPDATE `quest_template` SET `Details`='I hate those nasty timber wolves! But I sure like eating wolf steaks... Bring me tough wolf meat and I will exchange it for something you\'ll find useful.\r\n\r\nTough wolf meat is gathered from hunting the timber wolves and young wolves wandering the Northshire countryside. ' WHERE  `Id`=33;


-- BEFORE 3.3.0, after: Prefix " Diseased  XXX  Wolf"
UPDATE `creature_template` SET `name`='Timber Wolf', modelid1 = 10274 where `entry`=69;
UPDATE `creature_template` SET `name`='Young Wolf', modelid1 = 10274 where `entry`=299;

-- before 3.3.0 750 / after 50432
UPDATE `creature_loot_template` SET `item` = 750 WHERE `item`=50432;
UPDATE `quest_template` SET `RequiredItemId1`=750 WHERE `Id`=33;
UPDATE `creature_template` SET `questItem1`=750 WHERE `questItem1`=50432;

-- before 3.3.0, wolves had disease aura
delete from creature_addon where entry in(69, 299) and auras = 71764;
-- INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
-- (69, 0, 0, 0, 4097, 0, '71764'),
-- (299, 0, 0, 0, 4097, 0, '71764');