-- Questgiver incorrectly thanks player for meat after asking them to get pelts
UPDATE `quest_template` SET `OfferRewardText`='\'Twas a grim task, friend, but you held up your part of the bargain.\r\n\r\nI have some things here you might want - take your pick!' WHERE `id`=33;
UPDATE `quest_template` SET `RequestItemsText`='Hey $N. How goes the hunt for diseased young wolves?' WHERE `id`=33;
UPDATE `quest_template` SET `Details`='I hate those nasty timber wolves! But I sure like eating wolf steaks... Bring me tough wolf meat and I will exchange it for something you\'ll find useful.\r\n\r\nTough wolf meat is gathered from hunting the timber wolves and young wolves wandering the Northshire countryside. ' WHERE  `Id`=33;

-- BEFORE 3.3.0, after: Prefix " Diseased  XXX  Wolf"
UPDATE `creature_template` SET `name`='Timber Wolf', modelid1 = 604, scale=1 where `entry`=69;
UPDATE `creature_template` SET `name`='Young Wolf', modelid1 = 447, scale=1 where `entry`=299;

-- before 3.3.0 750 / after 50432
UPDATE `creature_loot_template` SET `item` = 750 WHERE `item`=50432;
UPDATE `quest_template` SET `RequiredItemId1`=750 WHERE `Id`=33;
UPDATE `creature_template` SET `questItem1`=750 WHERE `questItem1`=50432;

DELETE FROM `smart_scripts` WHERE  `entryorguid` in(69,299);
--INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
--(69, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 71764, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Diseased Timber Wolf - On Respawn - Cast Diseased'),
--(299, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 71764, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Diseased Young Wolf - On Respawn - Cast Diseased');

-- before 3.3 they are aggressive, after - passive
-- faction 7
UPDATE `creature_template` SET `faction`=16 WHERE  `entry` in(38,103);