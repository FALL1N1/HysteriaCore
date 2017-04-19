-- ('1485359047636826738');
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 10  WHERE `guid` IN (1976006, 1976007, 1976008, 1976009, 1976010, 1976011, 1976012);
-- ('1485359702808366893');
DELETE FROM `disables` WHERE `entry`= 45425;
INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`params_0`,`params_1`,`comment`) VALUES
(0, 45425, 64, '', '', 'Ignore LOS for Shoot (Dummy)');
-- ('1485362469183149355');
-- [Quest][WotlK] The Last of Her Kind
-- Harnessed Icemaw Matriarch SAI
SET @ENTRY := 30468;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,28,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harnessed Icemaw Matriarch - On Passenger Removed - Despawn Instant");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=29563 AND `SourceEntry`=56795;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 29563, 56795, 0, 0, 9, 0, 12983, 0, 0, 0, 0, 0, '', 'Required quest \'The Last of Her Kind\' active for spellclick');
-- ('1485365422169494530');
-- Civilian Recruit modelid from 3422 to 24821
UPDATE `creature` SET `modelid` = 24821 WHERE `guid` IN (117788, 117798);

-- Civilian Recruit Scripts in Building
DELETE FROM `creature_addon` WHERE `guid`=117789;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(117789, 0, 0, 3, 0, 0, NULL);

-- Civilian Recruit SAI
SET @GUID := -117794;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=25317;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,8000,8000,12000,12000,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Play Emote 36"),
(@GUID,0,1,0,1,0,100,0,35000,40000,35000,40000,80,11779400,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 11779400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,10,117790,25317,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 3");

-- Civilian Recruit SAI
SET @GUID := -117788;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=25317;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,8000,8000,12000,12000,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Play Emote 36"),
(@GUID,0,1,0,1,0,100,0,35000,40000,35000,40000,80,11778800,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 11778800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,10,117789,25317,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 3");


DELETE FROM `creature_text` WHERE `entry`=25317 AND `groupid` >=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
-- First text
(25317, 1, 0, 'This is harder than it looks.', 12, 7, 100, 0, 0, 0, 26488, 'Civilian Recruit'),
(25317, 1, 1, 'Did that seem okay?', 12, 7, 100, 0, 0, 0, 26487, 'Civilian Recruit'),
(25317, 1, 2, 'My arm is getting sore.', 12, 7, 100, 0, 0, 0, 26491, 'Civilian Recruit'),
(25317, 1, 3, 'Hmm....', 12, 7, 100, 0, 0, 0, 26492, 'Civilian Recruit'),
(25317, 1, 4, 'I think I\'m starting to get the hang of this.', 12, 7, 100, 0, 0, 0, 26490, 'Civilian Recruit'),
(25317, 1, 5, 'This isn\'t easy.', 12, 7, 100, 0, 0, 0, 26489, 'Civilian Recruit'),
-- reaction
(25317, 2, 0, 'You aren\'t going to let me sleep are you?', 12, 7, 100, 0, 0, 0, 26497, 'Civilian Recruit'),
(25317, 2, 1, 'Are you going to be doing this for much longer?', 12, 7, 100, 0, 0, 0, 26502, 'Civilian Recruit'),
(25317, 2, 2, 'Could you try to be a little quieter?', 12, 7, 100, 0, 0, 0, 26500, 'Civilian Recruit'),
-- reaction 2
(25317, 3, 0, 'I just don\'t want to let anyone down.', 12, 7, 100, 0, 0, 0, 26494, 'Civilian Recruit'),
(25317, 3, 1, 'I need to do something to keep myself busy.', 12, 7, 100, 0, 0, 0, 26495, 'Civilian Recruit'),
(25317, 3, 2, 'I\'m just nervous.  Sorry.', 12, 7, 100, 0, 0, 0, 26493, 'Civilian Recruit');
-- ('1485367877592394862');
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 10  WHERE `guid` IN (1976006, 1976007, 1976008, 1976009, 1976010, 1976011, 1976012);
-- ('1485367936523741798');
DELETE FROM `disables` WHERE `entry`= 45425;
INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`params_0`,`params_1`,`comment`) VALUES
(0, 45425, 64, '', '', 'Ignore LOS for Shoot (Dummy)');
-- ('1485367955664959270');
-- [Quest][WotlK] The Last of Her Kind
-- Harnessed Icemaw Matriarch SAI
SET @ENTRY := 30468;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,28,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harnessed Icemaw Matriarch - On Passenger Removed - Despawn Instant");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=29563 AND `SourceEntry`=56795;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 29563, 56795, 0, 0, 9, 0, 12983, 0, 0, 0, 0, 0, '', 'Required quest \'The Last of Her Kind\' active for spellclick');
-- ('1485367987525031467');
-- ('1485365422169494530');
-- Civilian Recruit modelid from 3422 to 24821
UPDATE `creature` SET `modelid` = 24821 WHERE `guid` IN (117788, 117798);

-- Civilian Recruit Scripts in Building
DELETE FROM `creature_addon` WHERE `guid`=117789;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(117789, 0, 0, 3, 0, 0, NULL);

-- Civilian Recruit SAI
SET @GUID := -117794;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=25317;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,8000,8000,12000,12000,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Play Emote 36"),
(@GUID,0,1,0,1,0,100,0,35000,40000,35000,40000,80,11779400,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 11779400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,10,117790,25317,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 3");

-- Civilian Recruit SAI
SET @GUID := -117788;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=25317;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,8000,8000,12000,12000,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Play Emote 36"),
(@GUID,0,1,0,1,0,100,0,35000,40000,35000,40000,80,11778800,0,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 11778800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,10,117789,25317,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Civilian Recruit - On Script - Say Line 3");


DELETE FROM `creature_text` WHERE `entry`=25317 AND `groupid` >=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
-- First text
(25317, 1, 0, 'This is harder than it looks.', 12, 7, 100, 0, 0, 0, 26488, 'Civilian Recruit'),
(25317, 1, 1, 'Did that seem okay?', 12, 7, 100, 0, 0, 0, 26487, 'Civilian Recruit'),
(25317, 1, 2, 'My arm is getting sore.', 12, 7, 100, 0, 0, 0, 26491, 'Civilian Recruit'),
(25317, 1, 3, 'Hmm....', 12, 7, 100, 0, 0, 0, 26492, 'Civilian Recruit'),
(25317, 1, 4, 'I think I\'m starting to get the hang of this.', 12, 7, 100, 0, 0, 0, 26490, 'Civilian Recruit'),
(25317, 1, 5, 'This isn\'t easy.', 12, 7, 100, 0, 0, 0, 26489, 'Civilian Recruit'),
-- reaction
(25317, 2, 0, 'You aren\'t going to let me sleep are you?', 12, 7, 100, 0, 0, 0, 26497, 'Civilian Recruit'),
(25317, 2, 1, 'Are you going to be doing this for much longer?', 12, 7, 100, 0, 0, 0, 26502, 'Civilian Recruit'),
(25317, 2, 2, 'Could you try to be a little quieter?', 12, 7, 100, 0, 0, 0, 26500, 'Civilian Recruit'),
-- reaction 2
(25317, 3, 0, 'I just don\'t want to let anyone down.', 12, 7, 100, 0, 0, 0, 26494, 'Civilian Recruit'),
(25317, 3, 1, 'I need to do something to keep myself busy.', 12, 7, 100, 0, 0, 0, 26495, 'Civilian Recruit'),
(25317, 3, 2, 'I\'m just nervous.  Sorry.', 12, 7, 100, 0, 0, 0, 26493, 'Civilian Recruit');
-- ('1485368761589638156');
-- Bailey + Bellinger Event
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid` IN (114937, 114958);
DELETE FROM `creature_formations` WHERE `leaderGUID`=114937;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(114937, 114937, 0, 0, 4, 0, 0),
(114937, 114958, 2, 270, 4, 0, 0);

-- Bailey SAI
SET @ENTRY := 29643;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,900000,900000,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - Out of Combat - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,4,29643,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Waypoint 4 Reached - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,8,29643,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Waypoint 8 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,15,29643,0,0,80,@ENTRY*100+03,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Waypoint 15 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 2964300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,0,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,1,1,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Set Orientation Closest Creature 'Bellinger'"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 3"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,5,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Play Emote 60"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,86,54899,0,10,114958,29644,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Cross Cast 'Knockback 15'"),
(@ENTRY,9,10,0,0,0,100,0,5000,5000,0,0,1,3,5000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 3"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,45,4,4,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Set Data 4 4"),
(@ENTRY,9,12,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.58825,"Bailey - On Script - Set Orientation 1.58825"),
(@ENTRY,9,13,0,0,0,100,0,3000,3000,0,0,1,4,3000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 4"),
(@ENTRY,9,14,0,0,0,100,0,5000,5000,0,0,45,1,1,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Set Data 1 1"),
(@ENTRY,9,15,0,0,0,100,0,300000,300000,0,0,1,5,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 5"), -- 5min
(@ENTRY,9,16,0,0,0,100,0,6000,6000,0,0,1,4,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 4"),
(@ENTRY,9,17,0,0,0,100,0,6000,6000,0,0,1,6,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 6"),
(@ENTRY,9,18,0,0,0,100,0,6000,6000,0,0,1,7,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 7"),
(@ENTRY,9,19,0,0,0,100,0,6000,6000,0,0,1,8,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 8"),
(@ENTRY,9,20,0,0,0,100,0,6000,6000,0,0,1,5,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 5"),
(@ENTRY,9,21,0,0,0,100,0,6000,6000,0,0,1,6,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 6"),
(@ENTRY,9,22,0,0,0,100,0,300000,300000,0,0,53,0,29643,0,0,0,1,1,0,0,0,0,0,0,0,"Bailey - On Script - Start Waypoint"); -- 5min 300000

-- Actionlist SAI
SET @ENTRY := 2964301;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,13000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.085985,"Bailey - On Script - Set Orientation 2,085985"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,45,2,2,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Set Data 2 2"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,7,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 7"),
(@ENTRY,9,4,0,0,0,100,0,6000,6000,0,0,1,9,5000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 9");

-- Actionlist SAI
SET @ENTRY := 2964302;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,33000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.50084,"Bailey - On Script - Set Orientation 2.50084"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,45,3,3,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Set Data 3 3"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,1,8,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 8"),
(@ENTRY,9,4,0,0,0,100,0,6000,6000,0,0,1,10,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 10"),
(@ENTRY,9,5,0,0,0,100,0,6000,6000,0,0,1,9,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 9"),
(@ENTRY,9,6,0,0,0,100,0,6000,6000,0,0,1,11,6000,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Say Line 11"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,1,10,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Say Line 10");

-- Actionlist SAI
SET @ENTRY := 2964303;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,4000,4000,0,0,45,5,5,0,0,0,0,10,114958,29644,0,0,0,0,0,"Bailey - On Script - Set Data 5 5"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bailey - On Script - Set Active Off");

-- Bellinger SAI
SET @ENTRY := 29644;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.50098,"Bellinger - On Data Set 1 1 - Set Orientation 1.50098"),
(@ENTRY,0,1,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.08598,"Bellinger - On Data Set 2 2 - Set Orientation 2.08598"),
(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.50084,"Bellinger - On Data Set 3 3 - Set Orientation 2.50084"),
(@ENTRY,0,3,0,38,0,100,0,4,4,0,0,69,0,0,0,0,0,0,8,0,0,0,6034.820,-750.8344,369.8008,1.4146,"Bellinger - On Data Set 4 4 - Move To Position"),
(@ENTRY,0,4,0,38,0,100,0,5,5,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.269333,"Bellinger - On Data Set 3 3 - Set Orientation 1.269333");

DELETE FROM `creature_text` WHERE `entry` IN (29643, 29644);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES
-- Bailey
(29643, 0, 0, 'This doesn''t look pretty, lad.', 12, 0, 100, 1, 0, 0, 30286, 'Bailey'),
(29643, 1, 0, 'That right? Well why don''t you go prance your merry little self over and grab them, eh?', 12, 0, 100, 6, 0, 0, 30289, 'Bailey'),
(29643, 2, 0, 'That''s strange... for a moment there, I could have swore you called me short.', 12, 0, 100, 1, 0, 0, 30288, 'Bailey'),
(29643, 3, 0, 'Toss me?! Okay, that''s it punk.', 12, 0, 100, 5, 0, 0, 30290, 'Bailey'),
(29643, 4, 0, 'Keep it to yourself.', 12, 0, 100, 1, 0, 0, 30291, 'Bailey'),
(29643, 5, 0, 'You better hope they don''t survive it, lad.', 12, 0, 100, 1, 0, 0, 30292, 'Bailey'),
(29643, 6, 0, 'Cause I''m just going to watch and laugh as they toss you in.', 12, 0, 100, 1, 0, 0, 30293, 'Bailey'),
(29643, 7, 0, 'There''s got to be a way in somewhere.', 12, 0, 100, 1, 0, 0, 30294, 'Bailey'),
(29643, 8, 0, 'How''d the goblin leave his tools there then?', 12, 0, 100, 1, 0, 0, 30295, 'Bailey'),
(29643, 9, 0, 'That''s it, lad! It looks totally safe. Go for it, I''ll be right behind ya!', 12, 0, 100, 5, 0, 0, 30296, 'Bailey'),
(29643, 10, 0, 'Pansy.', 12, 0, 100, 5, 0, 0, 30312, 'Bailey'),
-- Bellinger
(29644, 0, 0, 'I don''t know, Bailey... it''s not so bad. We could throw a rock at the tools from here.', 12, 0, 100, 1, 0, 0, 30287, 'Bellinger'),
(29644, 1, 0, 'Well... I was just thinking... you''re a bit smaller, so you''re less likely to set off any of those mines.', 12, 0, 100, 1, 0, 0, 30297, 'Bellinger'),
(29644, 2, 0, 'No, no, no! Not short... it''s just... well... maybe I could toss you across most of it?', 12, 0, 100, 1, 0, 0, 30298, 'Bellinger'),
(29644, 3, 0, 'Ahhh!', 12, 0, 100, 0, 0, 0, 30306, 'Bellinger'),
(29644, 4, 0, 'That was close! You scared me.', 12, 0, 100, 5, 0, 0, 30311, 'Bellinger'),
(29644, 5, 0, 'I''ve got an idea, Bailey...', 12, 0, 100, 5, 0, 0, 30299, 'Bellinger'),
(29644, 6, 0, 'No, no - this might work!', 12, 0, 100, 5, 0, 0, 30300, 'Bellinger'),
(29644, 7, 0, 'There''s a path right there... only a few mines at the end in between us and the tools.', 12, 0, 100, 1, 0, 0, 30301, 'Bellinger'),
(29644, 8, 0, 'We wait for the next adventurer to come through and we tell him that''s the way to go... then after they set off the mines, we just walk in and grab the tools!', 12, 0, 100, 1, 0, 0, 30302, 'Bellinger'),
(29644, 9, 0, 'It really doesn''t look like it, Bailey.', 12, 0, 100, 1, 0, 0, 30303, 'Bellinger'),
(29644, 10, 0, 'Oh... good point. How about right there? That looks clear... kind of.', 12, 0, 100, 1, 0, 0, 30304, 'Bellinger'),
(29644, 11, 0, 'Uh... that''s okay. It still kind of hurts from last time.', 12, 0, 100, 1, 0, 0, 30305, 'Bellinger');

DELETE FROM `waypoints` WHERE `entry`=29643;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(29643, 1, 6043.27, -752.358, 371.289, 'Bailey'),                                                          
(29643, 2, 6057.13, -750.684, 374.297, 'Bailey'),                                                          
(29643, 3, 6075.11, -746.512, 378.785, 'Bailey'),                                                          
(29643, 4, 6074.88, -746.098, 378.744, 'Bailey'),                                                          
(29643, 5, 6082.66, -744.527, 380.612, 'Bailey'),                                                          
(29643, 6, 6094.52, -739.821, 383.156, 'Bailey'),                                                          
(29643, 7, 6108.06, -728.91, 385.165, 'Bailey'),                                                          
(29643, 8, 6106.12, -727.415, 384.716, 'Bailey'),                                                          
(29643, 9, 6103.38, -731.758, 384.439, 'Bailey'),                                                          
(29643, 10, 6094.78, -740.08, 383.232, 'Bailey'),                                                          
(29643, 11, 6081.35, -743.988, 380.304, 'Bailey'),                                                          
(29643, 12, 6064.46, -748.543, 376.139, 'Bailey'),                                                          
(29643, 13, 6047.42, -752.5, 372.131, 'Bailey'),                                                          
(29643, 14, 6036.15, -753.071, 369.981, 'Bailey'),                                                          
(29643, 15, 6036.69, -751.232, 370.083, 'Bailey'); 
-- ('1485370364401596254');
-- add fake death emote for K3 Snow Runner
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `dynamicflags`=32 WHERE  `guid` IN (105491);
UPDATE `creature_addon` SET `bytes1`=7, `auras`='29266' WHERE  `guid`=105491;

-- Cast Emote Snowblind Devotee
-- Snowblind Devotee SAI
SET @GUID := -152070;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

-- Snowblind Devotee SAI
SET @GUID := -117307;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

-- Snowblind Devotee SAI
SET @GUID := -117305;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

-- Snowblind Devotee SAI
SET @GUID := -117306;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

-- Snowblind Devotee SAI
SET @GUID := -117309;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

-- Snowblind Devotee SAI
SET @GUID := -152076;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

-- Snowblind Devotee SAI
SET @GUID := -152071;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,3000,2000,3000,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Out of Combat - Play Emote 51"),
(@GUID,0,1,0,2,0,100,0,0,30,120000,130000,11,56410,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Devotee - Between 0-30% Health - Cast 'Blind Faith'");

SET @MAXGUID := 935; 
SET @SCRIPTID := 11730800; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 16, 1, 51, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 117308;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `orientation`) VALUES
(@PATH, 1, 6293.67, -1372.49, 425.351, 0, 0, 0),
(@PATH, 2, 6292.79, -1379.43, 425.474, 0, 0, 0),
(@PATH, 3, 6292.56, -1389.92, 425.328, 0, 0, 0),
(@PATH, 4, 6291.29, -1402.94, 425.217, 0, 0, 0),
(@PATH, 5, 6280.42, -1410.52, 425.174, 0, 0, 0),
(@PATH, 6, 6276.46, -1426.88, 425.625, 0, 0, 0),
(@PATH, 7, 6287.83, -1430.52, 426.185, 0, 0, 0),
(@PATH, 8, 6299.13, -1428.12, 426.536, 0, 0, 0),
(@PATH, 9, 6300.72, -1411.98, 425.887, 0, 0, 0),
(@PATH, 10, 6298.78, -1404.25, 425.477, 0, 0, 0),
(@PATH, 11, 6294.47, -1397.44, 425.235, 0, 0, 0),
(@PATH, 12, 6293.67, -1372.49, 425.351, 19000, @SCRIPTID, 0);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);

-- path event for one nowblind Devotee
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid` IN (117310);

SET @MAXGUID := 936; 
SET @SCRIPTID := 11730800; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 1, 1, 36, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 117310;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `orientation`, `move_type`) VALUES
(@PATH, 1, 6310.51, -1764.65, 457.506, 3000, @SCRIPTID, 0.106101, 1),
(@PATH, 2, 6312.33, -1761.09, 457.204, 3000, @SCRIPTID, 5.38790, 1),
(@PATH, 3, 6316.17, -1760.95, 457.158, 3000, @SCRIPTID, 4.253009, 1),
(@PATH, 4, 6314.01, -1761.02, 457.186, 0, 0, 0, 1),
(@PATH, 5, 6310.96, -1762.02, 457.424, 0, 0, 0, 1);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);
-- ('1485372721456090106');
-- Torseg the Exiled SAI
SET @ENTRY := 29350;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,25,0,100,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Torseg the Exiled - On Reset - Set Flag Standstate Sleep"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Torseg the Exiled - On Aggro - Remove Flag Standstate Sleep");
-- ('1485380024518159887');
-- Reduce respawntime for landmine
UPDATE `gameobject` SET `spawntimesecs`=10 WHERE  `id`=191502;

-- add fake death emote for Savage Hill Scavengers
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `unit_flags`=`unit_flags`|536870912|33554432|32770, `dynamicflags`=32 WHERE  `guid` IN (116957, 116956, 116958, 116959);
DELETE FROM `creature_addon` WHERE `guid` IN (116957, 116956, 116958, 116959);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(116957,0,0,7,1,0, '29266'),
(116956,0,0,7,1,0, '29266'),
(116958,0,0,7,1,0, '29266'),
(116959,0,0,7,1,0, '29266');

-- add textevent for Janks 
-- Janks SAI
SET @ENTRY := 29429;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Reset - Set Flag Standstate Sit Down"),
(@ENTRY,0,1,0,10,0,100,0,1,10,55000,55000,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - Within 0-10 Range Out of Combat LoS - Run Script");

-- Actionlist SAI
SET @ENTRY := 2942900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Remove Flag Standstate Sit Down"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,3,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Set Flag Standstate Sit Down"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Janks - On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry`=29429;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(29429, 0, 0, 'Is it true?! Has someone finally come to get me out of this place?', 12, 0, 100, 0, 0, 0, 30198, 'Janks'),
(29429, 1, 0, 'No... no... that''s not it, is it? That heartless lout probably sent you after the tools, didn''t he?', 12, 0, 100, 0, 0, 0, 30199, 'Janks'),
(29429, 2, 0, 'Well... I guess I''ll just keep an eye on the turrets... or something.', 12, 0, 100, 0, 0, 0, 30200, 'Janks'),
(29429, 3, 0, '%s sighs.', 16, 0, 100, 0, 0, 0, 30201, 'Janks');
-- ('1485380723419936376');
-- Initiate Park
SET @NPC := 111475;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, 3621.02, 5897.4, 174.577, 2.35131, 0),
(@PATH, 2, 3619.69, 5898.14, 174.577, 2.92465, 16000),
(@PATH, 3, 3619.09, 5890.59, 174.577, 3.63152, 0),
(@PATH, 4, 3618.11, 5890.39, 174.577, 2.89325, 16000);

-- Initiate Park SAI
SET @ENTRY := 27302;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,34,0,100,0,2,1,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Park - On Reached Point 1 - Run Script"),
(@ENTRY,0,1,0,34,0,100,0,2,3,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Park - On Reached Point 3 - Run Script");

-- Actionlist SAI
SET @ENTRY := 2730200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 69"),
(@ENTRY,9,1,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");
-- ('1485381009640442878');
-- Initiate Vernon SAI
SET @ENTRY := 27300;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Vernon - On Data Set 1 1 - Set Rooted On"),
(@ENTRY,0,1,0,61,0,100,0,1,1,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Vernon - On Data Set 1 1 - Set Emote State 0"),
(@ENTRY,0,2,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,10,111281,27299,0,0,0,0,0,"Initiate Vernon - On Data Set 2 2 - Set Orientation Closest Creature 'Initiate Greer'"),
(@ENTRY,0,3,0,38,0,100,0,3,3,0,0,11,48254,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Vernon - On Data Set 3 3 - Cast 'Prototype Neural Needle Impact'"),
(@ENTRY,0,4,0,38,0,100,0,4,4,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Vernon - On Data Set 4 4 - Set Rooted Off");

SET @MAXGUID := 915; 
SET @SCRIPTID := 11130700; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 2, 1, 69, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 17, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 111307;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `orientation`) VALUES
(@PATH, 1, 3647.87, 5909.61, 174.578, 21000, @SCRIPTID, 1.26067),
(@PATH, 2, 3640.9, 5911.28, 174.579, 21000, @SCRIPTID, 1.26067);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);

-- Initiate Greer SAI
SET @ENTRY := 27299;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,27299,1,0,0,1,1,0,0,0,0,0,0,0,"Initiate Greer - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,5,27299,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Waypoint 5 Reached - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,5,27299,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.76692,"Initiate Greer - On Waypoint 5 Reached - Set Orientation 2,76692"),
(@ENTRY,0,4,5,40,0,100,0,11,27299,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Waypoint 11 Reached - Run Script"),
(@ENTRY,0,5,0,61,0,100,0,11,27299,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.84897,"Initiate Greer - On Waypoint 11 Reached - Set Orientation 5,84897");

-- Actionlist SAI
SET @ENTRY := 2729900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,55000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Active On"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Emote State 133"),
(@ENTRY,9,3,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Emote State 0"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Say Line 0"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,45,3,3,0,0,0,0,10,111307,27300,0,0,0,0,0,"Initiate Greer - On Script - Set Data 3 3"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,45,1,1,0,0,0,0,10,111307,27300,0,0,0,0,0,"Initiate Greer - On Script - Set Data 1 1"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Say Line 1"),
(@ENTRY,9,8,0,0,0,100,0,4000,4000,0,0,45,2,2,0,0,0,0,10,111307,27300,0,0,0,0,0,"Initiate Greer - On Script - Set Data 2 2"),
(@ENTRY,9,9,0,0,0,100,0,2000,2000,0,0,1,0,6000,0,0,0,0,10,111307,27300,0,0,0,0,0,"Initiate Greer - On Script - Say Line 0"),
(@ENTRY,9,10,0,0,0,100,0,14000,14000,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Say Line 2"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,45,4,4,0,0,0,0,10,111307,27300,0,0,0,0,0,"Initiate Greer - On Script - Set Data 4 4"),
(@ENTRY,9,12,0,0,0,100,0,2000,2000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Active Off");

-- Actionlist SAI
SET @ENTRY := 2729901;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,70000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Active On"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Emote State 133"),
(@ENTRY,9,3,0,0,0,100,0,64000,64000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Emote State 0"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Initiate Greer - On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry` IN (27299, 27300);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(27299, 0, 0, 'Tell me if this hurts.', 12, 0, 100, 0, 0, 0, 26296, 'Initiate Greer'),
(27299, 0, 1, 'Let''s try this one out...', 12, 0, 100, 0, 0, 0, 26298, 'Initiate Greer'),
(27299, 0, 2, 'I think I''ve got it this time..', 12, 0, 100, 0, 0, 0, 26297, 'Initiate Greer'),
(27299, 1, 0, 'How''d that feel?', 12, 0, 100, 0, 0, 0, 26299, 'Initiate Greer'),
(27299, 1, 1, 'Was that potent enough?', 12, 0, 100, 0, 0, 0, 26302, 'Initiate Greer'),
(27299, 1, 2, 'Do you think that will get some answers?', 12, 0, 100, 0, 0, 0, 26300, 'Initiate Greer'),
(27299, 2, 0, 'Hmm...', 12, 0, 100, 0, 0, 0, 26304, 'Initiate Greer'),
(27299, 2, 1, 'True, our enemies would show us no mercy.', 12, 0, 100, 0, 0, 0, 26320, 'Initiate Greer'),
(27299, 2, 2, 'True, but how far should we push?  At what point are we no better than our enemies?', 12, 0, 100, 0, 0, 0, 26319, 'Initiate Greer'),
(27300, 0, 0, 'You need more bite.  Do not show our enemies any mercy.', 12, 0, 100, 0, 0, 0, 26305, 'Initiate Vernon'),
(27300, 0, 1, 'The more pain we can inflict, the quicker we can get our answers.', 12, 0, 100, 0, 0, 0, 26306, 'Initiate Vernon');

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=111281;
DELETE FROM `waypoints` WHERE `entry`=27299;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27299, 1, 3640.38, 5908, 174.576, 'Initiate Greer'),
(27299, 2, 3642.54, 5905.63, 174.572, 'Initiate Greer'),
(27299, 3, 3645.93, 5904.91, 174.571, 'Initiate Greer'),
(27299, 4, 3647.52, 5906.78, 174.576, 'Initiate Greer'),
(27299, 5, 3646.7, 5907.29, 174.578, 'Initiate Greer'),
(27299, 6, 3647.49, 5906.69, 174.578, 'Initiate Greer'),
(27299, 7, 3646.49, 5905.07, 174.576, 'Initiate Greer'),
(27299, 8, 3643.7, 5905.04, 174.568, 'Initiate Greer'),
(27299, 9, 3641.21, 5906.38, 174.577, 'Initiate Greer'),
(27299, 10, 3640.11, 5908.16, 174.577, 'Initiate Greer'),
(27299, 11, 3641.55, 5908.3, 174.577, 'Initiate Greer');
-- ('1485381169908880329');
-- Apprentice Trotter -- http://www.wowhead.com/npc=27301
-- Apprentice Trotter SAI
SET @ENTRY := 27301;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,27301,1,0,0,1,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,3,27301,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Waypoint 3 Reached - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,3,27301,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.20907,"Apprentice Trotter - On Waypoint 3 Reached - Set Orientation 5,20907"),
(@ENTRY,0,4,5,40,0,100,0,5,27301,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Waypoint 5 Reached - Run Script"),
(@ENTRY,0,5,0,61,0,100,0,5,27301,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.1162,"Apprentice Trotter - On Waypoint 5 Reached - Set Orientation 6,1162"),
(@ENTRY,0,6,7,40,0,100,0,8,27301,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Waypoint 8 Reached - Run Script"),
(@ENTRY,0,7,0,61,0,100,0,8,27301,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.10835,"Apprentice Trotter - On Waypoint 8 Reached - Set Orientation 6,10835");

-- Actionlist SAI
SET @ENTRY := 2730100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Script - Set Emote State 133"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apprentice Trotter - On Script - Set Emote State 0");

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=111400;
DELETE FROM `waypoints` WHERE `entry`=27301;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27301, 1, 3655.39, 5880.89, 174.576, 'Apprentice Trotter'),
(27301, 2, 3648.21, 5875.72, 174.554, 'Apprentice Trotter'),
(27301, 3, 3649.17, 5874.43, 174.578, 'Apprentice Trotter'),
(27301, 4, 3656.08, 5881.3, 174.577, 'Apprentice Trotter'),
(27301, 5, 3659.29, 5880.93, 174.577, 'Apprentice Trotter'),
(27301, 6, 3658.57, 5882.95, 174.577, 'Apprentice Trotter'),
(27301, 7, 3659.6, 5887.87, 174.577, 'Apprentice Trotter'),
(27301, 8, 3661.47, 5888.53, 174.577, 'Apprentice Trotter'),
(27301, 9, 3659.61, 5887.48, 174.576, 'Apprentice Trotter');
-- ('1485381323407860747');
-- Librarian Hamilton -- http://www.wowhead.com/npc=27141/librarian-hamilton
-- Librarian Hamilton SAI
SET @ENTRY := 27141;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,27141,1,0,0,1,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,1,27141,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Waypoint 1 Reached - Pause Waypoint"),
(@ENTRY,0,3,0,40,0,100,0,2,27141,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Waypoint 2 Reached - Run Script"),
(@ENTRY,0,4,0,40,0,100,0,3,27141,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Waypoint 3 Reached - Pause Waypoint"),
(@ENTRY,0,5,6,40,0,100,0,4,27141,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Waypoint 4 Reached - Run Script"),
(@ENTRY,0,6,0,61,0,100,0,4,27141,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.15815,"Librarian Hamilton - On Waypoint 4 Reached - Set Orientation 3,15815");

-- Actionlist SAI
SET @ENTRY := 2714100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,17000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Script - Set Flag Standstate Kneel"),
(@ENTRY,9,2,0,0,0,100,0,11000,11000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Librarian Hamilton - On Script - Remove Flag Standstate Kneel");

DELETE FROM `waypoints` WHERE `entry`=27141;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27141, 1, 3595.1, 5959.01, 136.328, 'Librarian Hamilton'),
(27141, 2, 3590.25, 5953.57, 136.203, 'Librarian Hamilton'),
(27141, 3, 3595.1, 5959.01, 136.328, 'Librarian Hamilton'),
(27141, 4, 3593.01, 5963.17, 136.328, 'Librarian Hamilton');
-- ('1485381491399791033');
-- Karen I Don't Caribou the Culler SAI
SET @ENTRY := 25803;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,10000,10000,15000,11,42724,0,0,0,0,0,2,0,0,0,0,0,0,0,"Karen I Don't Caribou the Culler - In Combat - Cast 'Cleave'"),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,15000,21000,11,48280,0,0,0,0,0,1,0,0,0,0,0,0,0,"Karen I Don't Caribou the Culler - In Combat - Cast 'Whirlwind'"),
(@ENTRY,0,2,0,9,0,100,0,8,25,10000,10000,11,27577,0,0,0,0,0,2,0,0,0,0,0,0,0,"Karen I Don't Caribou the Culler - Within 8-25 Range - Cast 'Intercept'"),
(@ENTRY,0,3,0,25,0,100,0,0,0,0,0,53,0,25803,1,0,0,2,1,0,0,0,0,0,0,0,"Karen I Don't Caribou the Culler - On Reset - Start Waypoint"),
(@ENTRY,0,4,5,40,0,100,0,15,25803,0,0,54,26000,0,0,0,0,0,0,0,0,0,0,0,0,0,"Karen I Don't Caribou the Culler - On Waypoint 15 Reached - Pause Waypoint"),
(@ENTRY,0,5,6,61,0,100,0,15,25803,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.698295,"Karen I Don't Caribou the Culler - On Waypoint 15 Reached - Set Orientation 0.698295"),
(@ENTRY,0,6,0,61,0,100,0,15,25803,0,0,11,46147,0,0,0,0,0,1,0,0,0,0,0,0,0,"Karen I Don't Caribou the Culler - On Waypoint 15 Reached - Cast 'Karen Eats'");

DELETE FROM `waypoints` WHERE `entry`=25803;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(25803, 1, 2732.85, 5267, 70.526, 'Karen I Don''t Caribou the Cullerr'),
(25803, 2, 2726.15, 5264.63, 71.5126, 'Karen I Don''t Caribou the Cullerr'),
(25803, 3, 2721.45, 5267.05, 71.632, 'Karen I Don''t Caribou the Cullerr'),
(25803, 4, 2721.44, 5276.07, 70.8437, 'Karen I Don''t Caribou the Cullerr'),
(25803, 5, 2729.39, 5276.17, 71.4764, 'Karen I Don''t Caribou the Cullerr'),
(25803, 6, 2732.85, 5267, 70.526, 'Karen I Don''t Caribou the Cullerr'),
(25803, 7, 2726.15, 5264.63, 71.5126, 'Karen I Don''t Caribou the Cullerr'),
(25803, 8, 2721.45, 5267.05, 71.632, 'Karen I Don''t Caribou the Cullerr'),
(25803, 9, 2721.44, 5276.07, 70.8437, 'Karen I Don''t Caribou the Cullerr'),
(25803, 10, 2729.39, 5276.17, 71.4764, 'Karen I Don''t Caribou the Cullerr'),
(25803, 11, 2732.85, 5267, 70.526, 'Karen I Don''t Caribou the Cullerr'),
(25803, 12, 2726.15, 5264.63, 71.5126, 'Karen I Don''t Caribou the Cullerr'),
(25803, 13, 2721.45, 5267.05, 71.632, 'Karen I Don''t Caribou the Cullerr'),
(25803, 14, 2721.44, 5276.07, 70.8437, 'Karen I Don''t Caribou the Cullerr'),
(25803, 15, 2728.34, 5281.66, 71.0141, 'Karen I Don''t Caribou the Cullerr'),
(25803, 16, 2729.39, 5276.17, 71.4764, 'Karen I Don''t Caribou the Cullerr'),
(25803, 17, 2732.85, 5267, 70.526, 'Karen I Don''t Caribou the Cullerr'),
(25803, 18, 2726.15, 5264.63, 71.5126, 'Karen I Don''t Caribou the Cullerr'),
(25803, 19, 2721.45, 5267.05, 71.632, 'Karen I Don''t Caribou the Cullerr'),
(25803, 20, 2721.44, 5276.07, 70.8437, 'Karen I Don''t Caribou the Cullerr'),
(25803, 21, 2729.39, 5276.17, 71.4764, 'Karen I Don''t Caribou the Cullerr'),
(25803, 22, 2732.85, 5267, 70.526, 'Karen I Don''t Caribou the Cullerr'),
(25803, 23, 2726.15, 5264.63, 71.5126, 'Karen I Don''t Caribou the Cullerr'),
(25803, 24, 2721.45, 5267.05, 71.632, 'Karen I Don''t Caribou the Cullerr'),
(25803, 25, 2721.44, 5276.07, 70.8437, 'Karen I Don''t Caribou the Cullerr'),
(25803, 26, 2729.39, 5276.17, 71.4764, 'Karen I Don''t Caribou the Cullerr');
-- ('1485381659665860694');
-- Armorer Orkuruk --
UPDATE `creature_addon` SET `path_id`=0 WHERE  `guid`=125542;
DELETE FROM `waypoint_data` WHERE  `id`=1255420;
UPDATE `creature` SET `MovementType`=0 WHERE  `guid`=125542;

-- Armorer Orkuruk SAI
SET @ENTRY := 25274;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,25274,1,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,17,25274,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Waypoint 17 Reached - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,17,25274,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.38169,"Armorer Orkuruk - On Waypoint 17 Reached - Set Orientation 3,38169"),
(@ENTRY,0,4,5,40,0,100,0,71,25274,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Waypoint 71 Reached - Run Script"),
(@ENTRY,0,5,0,61,0,100,0,71,25274,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.88465,"Armorer Orkuruk - On Waypoint 71 Reached - Set Orientation 2,88465");

-- Actionlist SAI
SET @ENTRY := 2527400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,5,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Script - Play Emote 5"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,0,10000,0,0,0,0,1,0,0,0,0,0,0,0,"Armorer Orkuruk - On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=25274;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(25274, 0, 0, 'Keep ''em hot you big dummy!', 12, 1, 100, 0, 0, 0, 25133, 'Armorer Orkuruk'),
(25274, 0, 1, 'Those weapons ain''t gonna build themselves! Faster!', 12, 1, 100, 0, 0, 0, 25134, 'Armorer Orkuruk'),
(25274, 0, 2, 'You call that a hammer strike? What kind of amateurs am I workin'' with here?', 12, 1, 100, 0, 0, 0, 25135, 'Armorer Orkuruk'),
(25274, 0, 3, 'You keep that garbage up and I''ll ship you back to your momma in a box with a note strapped to your chest that reads: FAILURE.', 12, 1, 100, 0, 0, 0, 25136, 'Armorer Orkuruk'),
(25274, 0, 4, 'And WHAT are our soldiers supposed to do with that shoddy piece of junk?', 12, 1, 100, 0, 0, 0, 25137, 'Armorer Orkuruk'),
(25274, 0, 5, 'You''re an embarassment to this entire operation! Pack up your stuff and get out!', 12, 1, 100, 0, 0, 0, 25138, 'Armorer Orkuruk');

DELETE FROM `waypoints` WHERE `entry`=25274;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(25274, 1, 2761.85, 6187.82, 83.448, 'Armorer Orkuruk'),
(25274, 2, 2763.1, 6203.83, 83.4409, 'Armorer Orkuruk'),
(25274, 3, 2765.37, 6209.65, 83.4451, 'Armorer Orkuruk'),
(25274, 4, 2772.92, 6217.22, 83.4475, 'Armorer Orkuruk'),
(25274, 5, 2766.39, 6211.48, 83.437, 'Armorer Orkuruk'),
(25274, 6, 2762.96, 6202.62, 83.4409, 'Armorer Orkuruk'),
(25274, 7, 2762.31, 6187.53, 83.4546, 'Armorer Orkuruk'),
(25274, 8, 2765.22, 6178.21, 83.4565, 'Armorer Orkuruk'),
(25274, 9, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 10, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 11, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 12, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 13, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 14, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 15, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 16, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 17, 2764.09, 6182.25, 83.4576, 'Armorer Orkuruk'),
(25274, 18, 2762.03, 6188.66, 83.4549, 'Armorer Orkuruk'),
(25274, 19, 2763.21, 6203.82, 83.4422, 'Armorer Orkuruk'),
(25274, 20, 2766.87, 6211.5, 83.4422, 'Armorer Orkuruk'),
(25274, 21, 2773.88, 6218.09, 83.4497, 'Armorer Orkuruk'),
(25274, 22, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 23, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 24, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 25, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 26, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 27, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 28, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 29, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 30, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 31, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 32, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 33, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 34, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 35, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 36, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 37, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 38, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 39, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 40, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 41, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 42, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 43, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 44, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 45, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 46, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 47, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 48, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 49, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 50, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 51, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 52, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 53, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 54, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 55, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 56, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 57, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 58, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 59, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 60, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 61, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 62, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 63, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 64, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 65, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 66, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 67, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 68, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 69, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 70, 2766.07, 6210.93, 83.4391, 'Armorer Orkuruk'),
(25274, 71, 2762.53, 6207.16, 83.4206, 'Armorer Orkuruk'),
(25274, 72, 2762.16, 6187.79, 83.4531, 'Armorer Orkuruk'),
(25274, 73, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk'),
(25274, 74, 2761.85, 6187.82, 83.448, 'Armorer Orkuruk'),
(25274, 75, 2763.1, 6203.83, 83.4409, 'Armorer Orkuruk'),
(25274, 76, 2765.37, 6209.65, 83.4451, 'Armorer Orkuruk'),
(25274, 77, 2772.92, 6217.22, 83.4475, 'Armorer Orkuruk'),
(25274, 78, 2766.39, 6211.48, 83.437, 'Armorer Orkuruk'),
(25274, 79, 2762.96, 6202.62, 83.4409, 'Armorer Orkuruk'),
(25274, 80, 2762.31, 6187.53, 83.4546, 'Armorer Orkuruk'),
(25274, 81, 2765.22, 6178.21, 83.4565, 'Armorer Orkuruk'),
(25274, 82, 2762.24, 6188.36, 83.4575, 'Armorer Orkuruk'),
(25274, 83, 2763.33, 6204.33, 83.4432, 'Armorer Orkuruk'),
(25274, 84, 2766.61, 6211.59, 83.4381, 'Armorer Orkuruk'),
(25274, 85, 2773.5, 6217.87, 83.4484, 'Armorer Orkuruk'),
(25274, 86, 2765.7, 6210.09, 83.4438, 'Armorer Orkuruk'),
(25274, 87, 2762.77, 6202.1, 83.4395, 'Armorer Orkuruk'),
(25274, 88, 2762.54, 6187.41, 83.4578, 'Armorer Orkuruk'),
(25274, 89, 2765.46, 6178.01, 83.4598, 'Armorer Orkuruk');
-- ('1485384033201060550');
-- Warden Nork Bloodfrenzy SAI
SET @ENTRY := 25379;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,10000,10000,470000,470000,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 2537900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,0,10000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,8000,8000,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Play Emote 11"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,2,1000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,1000,1000,0,0,1,3,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,5000,5000,0,0,1,1,6000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 1"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,1,4,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 4"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,1,5,10000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 5"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Play Emote 1"),
(@ENTRY,9,10,0,0,0,100,0,5000,5000,0,0,1,2,8000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 2"),
(@ENTRY,9,11,0,0,0,100,0,8000,8000,0,0,1,6,9000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 6"),
(@ENTRY,9,12,0,0,0,100,0,5000,5000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Play Emote 1"),
(@ENTRY,9,13,0,0,0,100,0,4000,4000,0,0,1,7,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 7"),
(@ENTRY,9,14,0,0,0,100,0,5000,5000,0,0,1,8,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 8"),
(@ENTRY,9,15,0,0,0,100,0,7000,7000,0,0,1,3,3000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 3"),
(@ENTRY,9,16,0,0,0,100,0,3000,3000,0,0,1,4,5000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 4"),
(@ENTRY,9,17,0,0,0,100,0,5000,5000,0,0,1,5,3000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 5"),
(@ENTRY,9,18,0,0,0,100,0,3000,3000,0,0,1,6,5000,0,0,0,0,10,125421,25426,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 6"),
(@ENTRY,9,19,0,0,0,100,0,5000,5000,0,0,1,9,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 9"),
(@ENTRY,9,20,0,0,0,100,0,2000,2000,0,0,1,10,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 10"),
(@ENTRY,9,21,0,0,0,100,0,4000,4000,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Play Emote 15"),
(@ENTRY,9,22,0,0,0,100,0,3000,3000,0,0,1,11,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Say Line 11"),
(@ENTRY,9,23,0,0,0,100,0,3000,3000,0,0,5,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Play Emote 5"),
(@ENTRY,9,24,0,0,0,100,0,2000,2000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warden Nork Bloodfrenzy - On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry`=25379 AND `groupid` >=1;
DELETE FROM `creature_text` WHERE `entry`=25426;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
-- Warden Nork Bloodfrenzy
(25379, 1, 0, 'Look at \'em, Ug. You know what those are?', 12, 1, 100, 25, 0, 0, 24631, 'Warden Nork Bloodfrenzy'),
(25379, 2, 0, 'Those...', 12, 1, 100, 25, 0, 0, 24633, 'Warden Nork Bloodfrenzy'),
(25379, 3, 0, 'Those are cowards.', 12, 1, 100, 1, 0, 0, 24634, 'Warden Nork Bloodfrenzy'),
(25379, 4, 0, '%s shakes his head.', 16, 1, 100, 274, 0, 0, 24636, 'Warden Nork Bloodfrenzy'),
(25379, 5, 0, 'No, blood of my blood, they are soldiers of the Alliance. Our sworn enemies.', 12, 1, 100, 1, 0, 0, 24637, 'Warden Nork Bloodfrenzy'),
(25379, 6, 0, 'They are here because they do not wish to defend their homes... their families...', 12, 1, 100, 1, 0, 0, 24639, 'Warden Nork Bloodfrenzy'),
(25379, 7, 0, 'They have given up and surrendered - willingly - to us.', 12, 1, 100, 1, 0, 0, 24640, 'Warden Nork Bloodfrenzy'),
(25379, 8, 0, 'Ug\'thor, they are afraid to die.', 12, 1, 100, 1, 0, 0, 24641, 'Warden Nork Bloodfrenzy'),
(25379, 9, 0, '%s laughs.', 16, 1, 100, 11, 0, 0, 24646, 'Warden Nork Bloodfrenzy'),
(25379, 10, 0, 'That\'s right, Ug. Victory or death!', 12, 1, 100, 273, 0, 0, 24647, 'Warden Nork Bloodfrenzy'),
(25379, 11, 0, '[In Broken Common] Hear boy, cowards? Boy die! Boy die for freedom!', 12, 0, 100, 273, 0, 0, 24648, 'Warden Nork Bloodfrenzy'),
-- Ug''thor Bloodfrenzy
(25426, 0, 0, 'No, popo. They look kind of like the pigs. Are they pigs?', 12, 1, 100, 1, 0, 0, 24632, 'Ug''thor Bloodfrenzy'),
(25426, 1, 0, 'Are they cowardly pigs, popo?', 12, 1, 100, 1, 0, 0, 24635, 'Ug''thor Bloodfrenzy'),
(25426, 2, 0, 'But popo, what are they afraid of? Why are they here?', 12, 1, 100, 1, 0, 0, 24638, 'Ug''thor Bloodfrenzy'),
(25426, 3, 0, '%s scratches his head.', 16, 1, 100, 0, 0, 0, 24642, 'Ug''thor Bloodfrenzy'),
(25426, 4, 0, 'I... I don\'t understand, popo.', 12, 1, 100, 1, 0, 0, 24643, 'Ug''thor Bloodfrenzy'),
(25426, 5, 0, '%s puffs out his chest and stands on his tip-toes.', 16, 1, 100, 0, 0, 0, 24644, 'Ug''thor Bloodfrenzy'),
(25426, 6, 0, 'Lok\'tar ogar, popo!', 12, 1, 100, 1, 0, 0, 24645, 'Ug''thor Bloodfrenzy');

DELETE FROM `creature_addon` WHERE  `guid`=13964;
UPDATE `creature` SET `MovementType`=0 WHERE  `guid`=13964;
DELETE FROM `waypoint_data` WHERE  `id`=139640;

-- Mogg SAI
SET @ENTRY := 14908;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,14908,1,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,5,14908,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 5 Reached - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,6,14908,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 6 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,7,14908,0,0,80,@ENTRY*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 7 Reached - Run Script"),
(@ENTRY,0,4,0,40,0,100,0,17,14908,0,0,80,@ENTRY*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 17 Reached - Run Script"),
(@ENTRY,0,5,0,40,0,100,0,27,14908,0,0,80,@ENTRY*100+04,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 27 Reached - Run Script"),
(@ENTRY,0,6,0,40,0,100,0,28,14908,0,0,80,@ENTRY*100+05,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 28 Reached - Run Script"),
(@ENTRY,0,7,8,40,0,100,0,29,14908,0,0,80,@ENTRY*100+06,2,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Waypoint 29 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 1490800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,89,5,0,0,0,0,0,19,14909,50,0,0,0,0,0,"Mogg - On Script - Start Random Movement"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 1490801;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Set Run On");

-- Actionlist SAI
SET @ENTRY := 1490802;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,3,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 3");

-- Actionlist SAI
SET @ENTRY := 1490803;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,5000,5000,0,0,1,5,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 5");

-- Actionlist SAI
SET @ENTRY := 1490804;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,10,0,0,0,0,0,0,0,"Mogg - On Script - Pause Waypoint"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Set Run Off"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,6,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 6");

-- Actionlist SAI
SET @ENTRY := 1490805;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,14909,50,0,0,0,0,0,"Mogg - On Script - Set Data 1 1"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,7,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Mogg - On Script - Say Line 7");

-- Actionlist SAI
SET @ENTRY := 1490806;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,80000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,8,5000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 8"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,45,2,2,0,0,0,0,19,14909,50,0,0,0,0,0,"On Script - Set Data 2 2");

-- Pooka SAI
SET @ENTRY := 14909;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Data Set 1 1 - Run Script"),
(@ENTRY,0,1,2,38,0,100,0,2,2,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Data Set 2 2 - Set Run Off"),
(@ENTRY,0,2,3,61,0,100,0,2,2,0,0,53,0,14909,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Data Set 2 2 - Start Waypoint"),
(@ENTRY,0,3,0,61,0,100,0,2,2,0,0,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Data Set 2 2 - Say Line 1"),
(@ENTRY,0,4,0,40,0,100,0,6,14909,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Waypoint 6 Reached - Run Script"),
(@ENTRY,0,5,0,40,0,100,0,12,14909,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Waypoint 12 Reached - Start Random Movement");

-- Actionlist SAI
SET @ENTRY := 1490900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Script - Start Random Movement"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,1021.28,-2233.42,93.33,5.05,"Pooka - On Script - Move To Position"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Script - Set Run Off"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,1013.24,-2221.47,92.9837,2.5,"Pooka - On Script - Move To Position"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,69,0,0,0,0,0,0,8,0,0,0,1017.95,-2224.33,93.08,4.7,"Pooka - On Script - Move To Position"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pooka - On Script - Start Random Movement");

-- Actionlist SAI
SET @ENTRY := 1490901;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 18"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 18");

DELETE FROM `creature_text` WHERE `entry` IN (14908, 14909);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(14908, 0, 0, 'I am going to practice and become a warrior like my father!', 12, 0, 100, 1, 0, 0, 10293, 'Mogg'),
(14908, 1, 0, 'Now to find an unsuspecting Harpy!', 12, 0, 100, 1, 0, 0, 10294, 'Mogg'),
(14908, 2, 0, 'There''s one! For the Horde!', 12, 0, 100, 1, 0, 0, 10295, 'Mogg'),
(14908, 3, 0, 'Take that you mangy Harpy! Hyaa!', 12, 0, 100, 1, 0, 0, 10296, 'Mogg'),
(14908, 4, 0, 'You can''t get away from a warrior of the Horde! Take that! And that!', 12, 0, 100, 1, 0, 0, 10297, 'Mogg'),
(14908, 5, 0, 'Now go back home where you belong!', 12, 0, 100, 1, 0, 0, 10298, 'Mogg'),
(14908, 6, 0, 'Aaahhh... Another glorious victory for The Horde!', 12, 0, 100, 1, 0, 0, 10299, 'Mogg'),
(14908, 7, 0, 'Yes right away momma!', 12, 0, 100, 1, 0, 0, 10301, 'Mogg'),
(14908, 8, 0, 'When is poppa coming back from the fights in Warsong? It has been so long...', 12, 0, 100, 1, 0, 0, 10303, 'Mogg'),

(14909, 0, 0, 'Mogg, get inside. It is not safe out there while your father is gone.', 12, 0, 100, 1, 0, 0, 10300, 'Pooka'),
(14909, 1, 0, 'Soon child... Very soon.', 12, 0, 100, 1, 0, 0, 10304, 'Pooka');

DELETE FROM `waypoints` WHERE `entry`=14908;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(14908,1,1022.24,-2235.11,93.3114,     'Mogg'),
(14908,2,1023.37,-2238.18,92.3744,     'Mogg'),
(14908,3,1024.2,-2243.96,92.4697,      'Mogg'),
(14908,4,1022.05,-2244.86,92.3385,     'Mogg'),
(14908,5,1020.21,-2242.92,92.2321,     'Mogg'),
(14908,6,1034.19,-2250.56,92.8656,     'Mogg'),
(14908,7,1033.85,-2258.61,93.6338,     'Mogg'),
(14908,8,1037.68,-2262.02,93.8145,     'Mogg'),
(14908,9,1036.96,-2269.7,93.7554,      'Mogg'),
(14908,10,1042,-2273.46,93.6932,       'Mogg'),
(14908,11,1042.7,-2275.52,93.5781,     'Mogg'),
(14908,12,1046.52,-2274.46,93.6045,    'Mogg'),
(14908,13,1050.26,-2270.44,93.4986,    'Mogg'),
(14908,14,1049.74,-2266.86,93.3475,    'Mogg'),
(14908,15,1048.05,-2263.53,93.2249,    'Mogg'),
(14908,16,1041.05,-2258.77,93.4525,    'Mogg'),
(14908,17,1039.14,-2253.68,92.9611,    'Mogg'),
(14908,18,1032.8,-2253.55,93.3633,     'Mogg'),
(14908,19,1025.83,-2258.54,93.1641,    'Mogg'),
(14908,20,1021.94,-2266.24,92.8306,    'Mogg'),
(14908,21,1022.81,-2272.14,92.6617,    'Mogg'),
(14908,22,1027.02,-2277.89,92.6709,    'Mogg'),
(14908,23,1036.56,-2280.12,93.1197,    'Mogg'),
(14908,24,1046.66,-2275.73,93.5356,    'Mogg'),
(14908,25,1049.61,-2269.77,93.5509,    'Mogg'),
(14908,26,1045.76,-2261.03,93.2522,    'Mogg'),
(14908,27,1038.3,-2254.31,93.1039,     'Mogg'),
(14908,28,1028.89,-2245.04,92.4171,    'Mogg'),
(14908,29,1016.87,-2225.77,93.1025,    'Mogg');

DELETE FROM `waypoints` WHERE `entry`=14909;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(14909, 1, 1025.19, -2239.77, 92.4462,  'Pooka'),
(14909, 2, 1032.77, -2242.09, 92.1655,  'Pooka'),
(14909, 3, 1040.45, -2241.81, 91.9457,  'Pooka'),
(14909, 4, 1040.65, -2233.18, 91.735,   'Pooka'),
(14909, 5, 1037.72, -2227.49, 91.8037,  'Pooka'),
(14909, 6, 1035.65, -2224.96, 91.9576,  'Pooka'), -- cry
(14909, 7, 1039.38, -2231.71, 91.7299,  'Pooka'),
(14909, 8, 1041.05, -2240.78, 91.9556,  'Pooka'),
(14909, 9, 1031.51, -2241.51, 92.1757,  'Pooka'),
(14909, 10, 1025.37, -2240.84, 92.4583, 'Pooka'),
(14909, 11, 1020.98, -2232.5, 93.3069,  'Pooka'),
(14909, 12, 1014.45, -2225.92, 93.0579, 'Pooka'); -- move rndm
-- ('1485431016613888200');
-- Jimmy the Stable Boy
UPDATE `creature` SET `position_x`=2260.2114, `position_y`=5205.3139, `position_z`=11.4189, `orientation`=5.8917 WHERE  `guid`=117744;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2255.84643, `position_y`=5207.1347, `position_z`=11.2519, `orientation`=5.8878 WHERE  `guid`=117793;

-- Jimmy the Stable Boy SAI
SET @ENTRY := 27364;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,34,0,100,0,2,1,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Reached Point 1 - Run Script"),
(@ENTRY,0,1,0,34,0,100,0,2,9,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Reached Point 9 - Run Script"),
(@ENTRY,0,2,0,34,0,100,0,2,23,0,0,1,4,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Reached Point 23 - Say Line 4"),
(@ENTRY,0,3,0,34,0,100,0,2,27,0,0,28,48478,0,0,0,0,0,10,117793,27365,0,0,0,0,0,"Jimmy the Stable Boy - On Reached Point 27 - Remove Aura 'Transform - Stabled Pet Appearance'");

-- Actionlist SAI
SET @ENTRY := 2736400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,0,6000,0,0,0,0,10,107742,27010,0,0,0,0,0,"Jimmy the Stable Boy - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,75,48478,0,0,0,0,0,10,117793,27365,0,0,0,0,0,"Jimmy the Stable Boy - On Script - Add Aura 'Transform - Stabled Pet Appearance'"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Script - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 2736401;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Script - Say Line 2"),
(@ENTRY,9,1,0,0,0,100,0,6000,6000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Jimmy the Stable Boy - On Script - Say Line 3");

DELETE FROM `waypoint_data` WHERE `id`=1177440;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(1177440, 1, 2260.21, 5205.31, 11.4189, 0, 0, 0, 0, 100, 0),
(1177440, 2, 2260.21, 5205.31, 11.4189, 0, 20000, 0, 0, 100, 0),
(1177440, 3, 2258.42, 5206.38, 11.3041, 0, 0, 0, 0, 100, 0),
(1177440, 4, 2260.78, 5212.97, 11.2323, 0, 0, 0, 0, 100, 0),
(1177440, 5, 2265.26, 5222.43, 11.285, 0, 0, 0, 0, 100, 0),
(1177440, 6, 2275.49, 5231.85, 11.3558, 0, 0, 0, 0, 100, 0),
(1177440, 7, 2284.1, 5249.56, 11.2543, 0, 0, 0, 0, 100, 0),
(1177440, 8, 2285.7, 5265.13, 11.3355, 0, 0, 0, 0, 100, 0),
(1177440, 9, 2285.82, 5269.38, 11.3778, 0, 0, 0, 0, 100, 0),
(1177440, 10, 2288.5, 5271.9, 11.4001, 0, 15000, 0, 0, 100, 0),
(1177440, 11, 2282.43, 5249.42, 11.2138, 0, 0, 0, 0, 100, 0),
(1177440, 12, 2275.66, 5250.47, 11.2624, 0, 0, 0, 0, 100, 0),
(1177440, 13, 2265.76, 5253.98, 7.16312, 0, 0, 0, 0, 100, 0),
(1177440, 14, 2252.91, 5259.53, 10.2728, 0, 0, 0, 0, 100, 0),
(1177440, 15, 2246.47, 5262.26, 11.7963, 0, 0, 0, 0, 100, 0),
(1177440, 16, 2236.65, 5265.97, 9.08925, 0, 0, 0, 0, 100, 0),
(1177440, 17, 2226.8, 5269.61, 7.16322, 0, 0, 0, 0, 100, 0),
(1177440, 18, 2209.85, 5275.66, 10.8121, 0, 0, 0, 0, 100, 0),
(1177440, 19, 2208.18, 5268.86, 10.7009, 0, 0, 0, 0, 100, 0),
(1177440, 20, 2203.12, 5252.14, 10.5775, 0, 0, 0, 0, 100, 0),
(1177440, 21, 2192.52, 5236.56, 10.5738, 0, 0, 0, 0, 100, 0),
(1177440, 22, 2176.46, 5233.64, 11.5804, 0, 0, 0, 0, 100, 0),
(1177440, 23, 2160.99, 5234.54, 17.9753, 0, 0, 0, 0, 100, 0),
(1177440, 24, 2137.26, 5245.75, 19.4465, 0, 0, 0, 0, 100, 0),
(1177440, 25, 2111.31, 5256.28, 19.4465, 0, 0, 0, 0, 100, 0),
(1177440, 26, 2087.92, 5269.58, 19.4465, 0, 0, 0, 0, 100, 0),
(1177440, 27, 2087.94, 5290.85, 19.4495, 0, 0, 0, 0, 100, 0),
(1177440, 28, 2092.85, 5313.56, 19.4495, 0, 5000, 0, 0, 100, 0),
(1177440, 29, 2091.17, 5300.7, 19.4495, 0, 22000, 0, 0, 100, 0),
(1177440, 30, 2086.89, 5273.04, 19.4482, 0, 0, 0, 0, 100, 0),
(1177440, 31, 2108.96, 5257.42, 19.4467, 0, 0, 0, 0, 100, 0),
(1177440, 32, 2138.17, 5245.65, 19.4467, 0, 0, 0, 0, 100, 0),
(1177440, 33, 2157.61, 5237.7, 19.0772, 0, 0, 0, 0, 100, 0),
(1177440, 34, 2177, 5234.21, 11.426, 0, 0, 0, 0, 100, 0),
(1177440, 35, 2194.04, 5236.1, 10.5729, 0, 0, 0, 0, 100, 0),
(1177440, 36, 2202.59, 5250.43, 10.5729, 0, 0, 0, 0, 100, 0),
(1177440, 37, 2210.88, 5273.46, 10.814, 0, 0, 0, 0, 100, 0),
(1177440, 38, 2228.14, 5268.23, 7.1635, 0, 0, 0, 0, 100, 0),
(1177440, 39, 2245.5, 5263.03, 11.7909, 0, 0, 0, 0, 100, 0),
(1177440, 40, 2264.42, 5255.25, 7.16331, 0, 0, 0, 0, 100, 0),
(1177440, 41, 2281.83, 5245.22, 11.317, 0, 0, 0, 0, 100, 0),
(1177440, 42, 2280.49, 5237.07, 11.4029, 0, 0, 0, 0, 100, 0),
(1177440, 43, 2269.62, 5227.42, 11.2536, 0, 0, 0, 0, 100, 0),
(1177440, 44, 2261.16, 5215.02, 11.2106, 0, 0, 0, 0, 100, 0),
(1177440, 45, 2256.64, 5205.68, 11.2277, 0, 0, 0, 0, 100, 0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (1080, 1081);

DELETE FROM `creature_formations` WHERE `leaderGUID`=117744;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(117744, 117744, 0, 0, 7, 0, 0),
(117744, 117793, 7, 359, 7, 0, 0);

DELETE FROM `creature_text` WHERE `entry` IN (27010, 27364);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES
(27010, 0, 0, 'All these folks are keeping me busy.  Take this horse over to your stables.', 12, 7, 100, 396, 0, 0, 26522, 'Celidh Aletracker to Jimmy the Stable Boy'),
(27364, 0, 0, 'Hey Celidh!  Do you have any pets you want me to take over to the stable?', 12, 7, 100, 0, 0, 0, 26428, 'Jimmy the Stable Boy'),
(27364, 1, 0, 'Let''s go boy.', 12, 7, 100, 0, 0, 0, 26432, 'Jimmy the Stable Boy'),
(27364, 2, 0, 'If I were king, I''d have a horse like you.  I''d make sure you didn''t get lost, and I bet you''d make sure I never got lost.', 12, 7, 100, 0, 0, 0, 26478, 'Jimmy the Stable Boy'),
(27364, 3, 0, 'We''d be best friends.  I bet me and Anduin would also be best friends, too.  Friends are important.  ', 12, 7, 100, 0, 0, 0, 26479, 'Jimmy the Stable Boy'),
(27364, 4, 0, 'I''ll take you to some other horses.  You probably miss being around other horses.  They can be your friend too.', 12, 7, 100, 0, 0, 0, 26486, 'Jimmy the Stable Boy');-- ('1485431085279815600');
-- Hammerfall - Arathi Highland
-- Hammerfall Guardian SAI
SET @GUID := -11212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2621;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,10000,10000,80,1121200,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hammerfall Guardian - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 1121200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,11235,2621,0,0,0,0,0,"Hammerfall Guardian - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hammerfall Guardian - On Script - Play Emote 1");

-- ==================================================================
-- Horde Guard - Barrens
-- Horde Guard SAI
SET @GUID := -19403;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=3501;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,10000,10000,80,1940300,0,0,0,0,0,1,0,0,0,0,0,0,0,"Horde Guard - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 1940300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,19428,3501,0,0,0,0,0,"Horde Guard - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Horde Guard - On Script - Play Emote 1");

-- ==================================================================
-- Peon - Barrens
-- Peon SAI
SET @GUID := -13751;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=14901;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,10000,10000,80,1375100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Peon - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 1375100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,13772,14901,0,0,0,0,0,"Peon - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Peon - On Script - Play Emote 1");

-- Peon Emotestate script
SET @MAXGUID := 933; 
SET @SCRIPTID := 1377500; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 3, 1, 69, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 235, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 13775;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `move_type`, `action`) VALUES
(@PATH, 1, -629.313, -3161, 92.3242, 3.79019, 0, 0, 0),                                                               
(@PATH, 2, -624.911, -3156.44, 91.7832, 0.483361, 0, 0, 0),                                                               
(@PATH, 3, -617.56, -3155.6, 91.7512, 0.161653, 0, 0, 0),                                                               
(@PATH, 4, -617.56, -3155.6, 91.7512, 0.161653, 240000, 0, @SCRIPTID),                                                               
(@PATH, 5, -625.854, -3158.22, 91.9782, 3.5153, 0, 0, 0),                                                               
(@PATH, 6, -629.313, -3161, 92.3242, 3.79019, 20000, 0, 0);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);

-- ==================================================================
-- Westfall Woodworker - Sentinell Hill - Westfall
DELETE FROM `creature_addon` WHERE guid IN (44303,45472,45521,89860);
SET @SCTIPT_ID = 4430300;
SET @MAXGUID := 930; 
DELETE FROM `waypoint_scripts` WHERE id BETWEEN @SCTIPT_ID+0 AND @SCTIPT_ID+1;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCTIPT_ID+0, 3, 1, 69, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCTIPT_ID+0, 87, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCTIPT_ID+1, 3, 1, 16, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 44303;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`) VALUES 
(@PATH, 1, -10662.1, 1130.83, 34.1967, 15000, 0) ,
(@PATH, 2, -10662.1, 1130.83, 34.1967, 90000, @SCTIPT_ID+0),
(@PATH, 3, -10661.3, 1113.16, 34.1967, 90000, @SCTIPT_ID+0);

SET @NPC := 45472;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`) VALUES 
(@PATH, 1, -10650.8, 1128.61, 34.1978, 90000, @SCTIPT_ID+0),
(@PATH, 2, -10650.8, 1128.61, 34.1978, 10000, 0),
(@PATH, 3, -10658.8, 1134.62, 34.1967, 90000, @SCTIPT_ID+0);

SET @NPC := 45521;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`) VALUES 
(@PATH, 1, -10650.1, 1115.028, 35.611, 6000, @SCTIPT_ID+1),
(@PATH, 2, -10646.4, 1113.332, 35.6268, 90000, @SCTIPT_ID+0);

SET @NPC := 89860;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`) VALUES 
(@PATH, 1, -10656.2, 1126.87, 34.1967, 90000, @SCTIPT_ID+0),
(@PATH, 2, -10667.4, 1121.39, 34.1967, 90000, @SCTIPT_ID+0);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` BETWEEN @SCTIPT_ID+0 AND @SCTIPT_ID+1;-- ('1485431395889581500');
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `unit_flags`=`unit_flags`|536870912|32770, `dynamicflags`=32 WHERE  `guid`=116778;

DELETE FROM `creature_addon` WHERE `guid` IN (113320, 116778);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(113320,0,0,0,1,233, ''),
(116778,0,0,7,1,0, '29266');

-- Ironwool Mammoth, Part 2, patrolling event
DELETE FROM `creature` WHERE `guid` IN (116895, 116892, 116894, 116891);
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=6459.656738, `position_y`=-1248.93371, `position_z`=459.40695, `orientation`=2.7473 WHERE  `guid` IN (116907, 116911, 116910, 116908, 116909);
UPDATE `creature` SET `position_x`=6479.30419, `position_y`=-1257.4559, `position_z`= 468.8983, `orientation`=5.98313 WHERE  `guid`=116908;
UPDATE `creature_template` SET `speed_run`=1.5 WHERE  `entry`=29402;

DELETE FROM `creature_formations` WHERE `leaderGUID`=116908;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(116908, 116908, 0, 0, 2, 0, 0),
(116908, 116907, 8, 30, 2, 0, 0),
(116908, 116911, 8, 60, 2, 0, 0),
(116908, 116910, 8, 300, 2, 0, 0),
(116908, 116909, 8, 330, 2, 0, 0);

SET @NPC := 116908;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@PATH, 1, 6435.16, -1239.87, 447.581, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 2, 6396.64, -1223.13, 430.318, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 3, 6380.58, -1209.6, 426.213, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 4, 6368.91, -1176.6, 427.008, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 5, 6358.24, -1131.07, 423.253, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 6, 6336.66, -1037.79, 416.366, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 7, 6328.1, -1003.7, 415.253, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 8, 6317.85, -975.257, 409.725, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 9, 6291.93, -925.632, 409.592, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 10, 6268.17, -896.997, 407.157, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 11, 6232.51, -856.589, 405.761, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 12, 6205.65, -821.214, 401.573, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 13, 6197.91, -784.789, 402.398, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 14, 6172.17, -737.765, 398.054, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 15, 6173.12, -682.006, 398.173, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 16, 6178.15, -638.913, 405.172, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 17, 6181.84, -609.178, 407.013, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 18, 6158.61, -566.177, 402.071, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 19, 6124.7, -514.61, 396.071, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 20, 6113.01, -498.197, 395.71, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 21, 6078.05, -503.076, 381.885, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 22, 6039.49, -514.377, 364.875, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 23, 6004.76, -523.171, 347.563, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 24, 5976.67, -507.53, 336.84, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 25, 5941.96, -495.75, 317.882, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 26, 5925.45, -490.855, 308.241, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 27, 5905.03, -485.92, 297.25, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 28, 5886.99, -480.799, 286.995, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 29, 5849.22, -468.861, 267.261, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 30, 5815.16, -457.732, 251.466, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 31, 5777.5, -444.971, 234.154, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 32, 5796.25, -451.588, 242.775, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 33, 5813.78, -456.937, 250.769, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 34, 5829.77, -461.747, 257.881, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 35, 5866.75, -475.495, 275.778, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 36, 5935.89, -493.427, 314.012, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 37, 5977.02, -505.339, 336.79, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 38, 6022.89, -509.131, 356.888, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 39, 6076.86, -503.914, 381.206, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 40, 6105.04, -501.556, 392.878, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 41, 6129.72, -536.563, 393.466, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 42, 6162.83, -582.65, 402.332, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 43, 6179.94, -607.92, 406.712, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 44, 6181.06, -671.131, 402.657, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 45, 6169.77, -717.892, 397.477, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 46, 6187.36, -766.508, 401.148, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 47, 6221.8, -832.298, 404.688, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 48, 6258.85, -887.193, 406.175, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 49, 6306.02, -941.727, 410.591, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 50, 6329.22, -995.427, 414.636, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 51, 6341.63, -1093.04, 416.601, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 52, 6351.8, -1161.35, 426.35, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 53, 6390.75, -1220.95, 428.485, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 54, 6438.53, -1244.41, 449.509, 0, 0, 0, 0, 100, 0),                                                               
(@PATH, 55, 6473.51, -1253.46, 465.931, 0, 0, 0, 0, 100, 0);    

UPDATE `waypoint_data` SET `move_type`=1 WHERE `id`=@PATH;-- ('1485431484557653000');
-- Sentinell Hill - Westfall
-- Lumberjack

UPDATE `creature` SET spawndist = 0, MovementType = 2 WHERE guid IN (44296,45524,89861);
UPDATE `creature_addon` SET `emote`=0 WHERE  `guid`=89861;
UPDATE `creature_addon` SET `emote`=0 WHERE  `guid`=44296;
UPDATE `creature_addon` SET `emote`=234 WHERE  `guid`=45477;

SET @MAXGUID := 923; 
SET @SCRIPTID := 4429600; 
DELETE FROM `waypoint_scripts` WHERE id BETWEEN @Script AND @Script+3;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 3, 32, 308, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+1, 3, 1, 234, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+1, 97, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+1, 100, 32, 89, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+2, 2, 32, 89, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+3, 3, 1, 234, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+3, 97, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 44296;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `action`) VALUES 
(@PATH, 1, -10612.1, 1181.01, 34.5176, 5.11381, 5000, @SCRIPTID+2),                                                               
(@PATH, 2, -10614.8, 1180.44, 34.0654, 3.56192, 0, 0),                                                               
(@PATH, 3, -10625.5, 1172.63, 34.2415, 3.88393, 0, 0),                                                               
(@PATH, 4, -10636.7, 1159.96, 33.615, 3.9664, 0, 0),                                                               
(@PATH, 5, -10643.8, 1154.6, 33.3617, 3.49516, 0, 0),                                                               
(@PATH, 6, -10651, 1152.99, 33.4886, 3.77555, 0, 0),                                                               
(@PATH, 7, -10653.1, 1148.23, 33.7335, 4.94657, 0, 0),                                                               
(@PATH, 8, -10649.3, 1141.3, 33.7097, 4.53648, 0, 0),                                                               
(@PATH, 9, -10651.8, 1136.93, 34.2028, 3.85711, 0, 0),                                                               
(@PATH, 10, -10660.2, 1128.05, 34.197, 4.53255, 0, 0),                                                               
(@PATH, 11, -10660, 1124.38, 34.197, 5.25119, 0, 0),                                                               
(@PATH, 12, -10657.3, 1121.95, 34.197, 5.90698, 0, 0),                                                               
(@PATH, 13, -10654, 1120.34, 35.6411, 5.72634, 0, 0),                                                               
(@PATH, 14, -10650.7, 1118.12, 35.6286, 5.67922, 6000, @SCRIPTID+0),                                                               
(@PATH, 15, -10653.9, 1120.45, 35.6388, 2.69648, 0, 0),                                                               
(@PATH, 16, -10657.1, 1122.31, 34.1967, 2.65721, 0, 0),                                                               
(@PATH, 17, -10660.2, 1127.8, 34.1967, 1.20579, 0, 0),                                                               
(@PATH, 18, -10657.3, 1132.13, 34.1967, 0.718843, 0, 0),                                                               
(@PATH, 19, -10649.3, 1139.81, 33.7333, 1.45555, 0, 0),                                                               
(@PATH, 20, -10650.1, 1143.1, 33.7355, 2.14591, 0, 0),                                                               
(@PATH, 21, -10653, 1148.6, 33.737, 1.65425, 0, 0),                                                               
(@PATH, 22, -10651.6, 1152.36, 33.527, 0.97881, 0, 0),                                                               
(@PATH, 23, -10648.3, 1153.99, 33.4183, 0.24996, 0, 0),                                                               
(@PATH, 24, -10643.1, 1154.56, 33.3588, 0.440811, 0, 0),                                                               
(@PATH, 25, -10633.7, 1162.3, 34.1228, 0.952139, 0, 0),                                                               
(@PATH, 26, -10625.3, 1172.88, 34.2107, 0.930148, 0, 0),                                                               
(@PATH, 27, -10616.4, 1182.21, 33.7023, 0.34267, 0, 0),                                                               
(@PATH, 28, -10612.1, 1181.01, 34.5176, 5.11381, 97000, @SCRIPTID+3);                                                           
  

SET @NPC := 45524;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `orientation`, `action`) VALUES 
(@PATH, 1, -10628.2, 1125.08, 33.7849, 1.81801, 0, 0),                                                               
(@PATH, 2, -10631.9, 1139.7, 33.7312, 1.72611, 0, 0),                                                               
(@PATH, 3, -10629.8, 1152.02, 34.0399, 0.853538, 0, 0),                                                               
(@PATH, 4, -10624.8, 1156.86, 34.5346, 0.460053, 0, 0),                                                               
(@PATH, 5, -10597.5, 1160.64, 38.4133, 0.0390802, 103000, @SCRIPTID+1),                                                               
(@PATH, 6, -10616, 1156.68, 35.1913, 3.432, 0, 0),                                                               
(@PATH, 7, -10624.7, 1153.97, 34.3801, 3.68176, 0, 0),                                                               
(@PATH, 8, -10631.2, 1139.29, 33.7428, 4.53705, 0, 0),                                                               
(@PATH, 9, -10627.9, 1123.15, 33.7433, 4.92032, 0, 0),                                                               
(@PATH, 10, -10623.6, 1106.81, 33.839, 4.71298, 0, 0),                                                               
(@PATH, 11, -10624.1, 1100.77, 33.7959, 4.37573, 0, 0),                                                               
(@PATH, 12, -10626.3, 1098.61, 33.7164, 3.34293, 0, 0),                                                               
(@PATH, 13, -10630.2, 1098.87, 33.7023, 2.58109, 0, 0),                                                               
(@PATH, 14, -10636.6, 1103.93, 34.3049, 2.47899, 0, 0),                                                               
(@PATH, 15, -10638.7, 1105.6, 35.6183, 2.72796, 0, 0),                                                               
(@PATH, 16, -10644.3, 1107.04, 35.6515, 3.07197, 6000, @SCRIPTID+0),                                                               
(@PATH, 17, -10641.1, 1107.4, 35.6302, 5.73997, 0, 0),                                                               
(@PATH, 18, -10638.3, 1105.68, 35.6181, 5.5931, 0, 0),                                                               
(@PATH, 19, -10636.5, 1104.16, 34.3292, 5.5931, 0, 0),                                                               
(@PATH, 20, -10630.1, 1098.96, 33.7028, 5.92454, 0, 0),                                                               
(@PATH, 21, -10626.7, 1098.35, 33.7094, 0.0984525, 0, 0),                                                               
(@PATH, 22, -10624.6, 1100.14, 33.774, 0.868928, 0, 0),                                                               
(@PATH, 23, -10623.7, 1101.87, 33.8117, 1.58364, 0, 0),                                                               
(@PATH, 24, -10624, 1107.23, 33.8072, 1.68574, 0, 0);                                                              

SET @NPC := 89861;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `orientation`, `action`) VALUES 
(@PATH, 1, -10584.8, 1144.22, 40.2218, 3.85718, 103000, @SCRIPTID+1),                                                               
(@PATH, 2, -10582.4, 1140.78, 39.6677, 4.94343, 0, 0),                                                               
(@PATH, 3, -10583.4, 1137.05, 39.0197, 4.28134, 0, 0),                                                               
(@PATH, 4, -10599.1, 1117.84, 37.7277, 3.9986, 0, 0),                                                               
(@PATH, 5, -10611.2, 1105.3, 35.982, 3.79833, 0, 0),                                                               
(@PATH, 6, -10623.2, 1098.3, 33.8558, 3.27368, 0, 0),                                                               
(@PATH, 7, -10628.8, 1097.99, 33.7034, 2.77888, 0, 0),                                                               
(@PATH, 8, -10633.6, 1099.99, 34.1616, 2.51027, 0, 0),                                                               
(@PATH, 9, -10637.4, 1102.69, 34.1628, 2.53776, 0, 0),                                                               
(@PATH, 10, -10639.6, 1104.22, 35.6187, 2.53776, 0, 0),                                                               
(@PATH, 11, -10644.4, 1106.43, 35.651, 2.84799, 6000, @SCRIPTID+0),                                                               
(@PATH, 12, -10639.6, 1104.32, 35.6182, 5.79324, 0, 0),                                                               
(@PATH, 13, -10636.9, 1102.73, 34.2156, 5.75004, 0, 0),                                                               
(@PATH, 14, -10628.3, 1098.14, 33.7034, 6.14745, 0, 0),                                                               
(@PATH, 15, -10617.2, 1100.93, 34.7838, 0.495724, 0, 0),                                                               
(@PATH, 16, -10610.1, 1106.28, 36.1837, 0.739197, 0, 0),                                                               
(@PATH, 17, -10597.7, 1119.31, 37.9428, 0.845226, 0, 0),                                                               
(@PATH, 18, -10582.2, 1138.37, 39.1972, 1.1154, 0, 0),                                                               
(@PATH, 19, -10582.3, 1141.47, 39.7775, 1.75786, 0, 0),                                                               
(@PATH, 20, -10583.1, 1143.39, 40.0436, 2.16391, 0, 0);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` BETWEEN @SCRIPTID+0 AND @SCRIPTID+3;-- ('1485431717555979800');
-- SCRIPT 1
SET @MAXGUID := 919; 
SET @SCRIPTID := 8014900; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 1, 35, 1, 5, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 20, 35, 2, 0, 801490, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 80149;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `move_type`, `action`) VALUES
(@PATH, 1, -9008.89, -320.603, 75.8279, 2.8812, 1000, 1, 0),                                                               
(@PATH, 2, -8981.22, -335.138, 73.3474, 5.82645, 0, 1, 0),                                                               
(@PATH, 3, -8946.51, -338.891, 71.1134, 5.82409, 0, 1, 0),                                                               
(@PATH, 4, -8912.77, -352.085, 72.5823, 5.88143, 0, 1, 0),                                                               
(@PATH, 5, -8881.49, -355.84, 73.1462, 6.17595, 0, 1, 0),                                                               
(@PATH, 6, -8910.65, -346.602, 71.1023, 2.81837, 0, 0, 0),                                                               
(@PATH, 7, -8883.13, -352.739, 72.9499, 2.75397, 0, 0, 0),                                                               
(@PATH, 8, -8911.38, -347.166, 71.3269, 2.95582, 0, 0, 0),                                                               
(@PATH, 9, -8947.63, -337.566, 70.9275, 2.87728, 0, 0, 0),                                                               
(@PATH, 10, -9008.89, -320.603, 75.8279, 2.8812, 25000, 0, @SCRIPTID);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);

-- SCRIPT 2
-- Defias Thug SAI
SET @GUID := -80152;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=38;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,10000,10000,80,8015200,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - Out of Combat - Run Script"),
(@GUID,0,1,0,4,0,30,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Aggro - Say Line 0 (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 8015200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,80151,38,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1");

-- SCRIPT 3
SET @NPC := 80171;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `move_type`) VALUES
(@PATH, 1, -9120.29, -275.579, 72.9006, 1.03043, 2000, 1),                                                               
(@PATH, 2, -9112.23, -263.542, 74.4268, 1.06342, 3000, 0),                                                               
(@PATH, 3, -9110.18, -259.698, 74.7637, 3.91441, 0, 1),                                                               
(@PATH, 4, -9120.29, -269.848, 73.5204, 3.94322, 4000, 0);

-- SCRIPT 4
SET @NPC := 80181;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `move_type`) VALUES
(@PATH, 1, -9131.36, -306.832, 73.5301, 4.49767, 0, 1),                                                               
(@PATH, 2, -9132.83, -313.89, 73.306, 4.49767, 4000, 1),                                                               
(@PATH, 3, -9124.91, -379.208, 73.2856, 4.81183, 3000, 0),                                                               
(@PATH, 4, -9125.01, -372.703, 73.5785, 1.77234, 0, 1),                                                               
(@PATH, 5, -9138.42, -339.389, 72.5674, 1.2202, 0, 1),                                                               
(@PATH, 6, -9123.32, -311.799, 72.985, 1.2202, 4000, 0);

-- SCRIPT 5
-- Defias Thug SAI
SET @GUID := -80184;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=38;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,8000,8000,80,8018400,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - Out of Combat - Run Script"),
(@GUID,0,1,0,4,0,30,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Aggro - Say Line 0 (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 8018400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,80185,38,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1");

-- SCRIPT 6
-- Defias Thug SAI
SET @GUID := -80188;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=38;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,8000,8000,80,8018800,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - Out of Combat - Run Script"),
(@GUID,0,1,0,4,0,30,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Aggro - Say Line 0 (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 8018800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,80189,38,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1");

-- SCRIPT 7
-- Defias Thug SAI
SET @GUID := -80201;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=38;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,0,0,8000,8000,80,8020100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - Out of Combat - Run Script"),
(@GUID,0,1,0,4,0,30,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Aggro - Say Line 0 (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 8020100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,1,0,0,0,0,0,10,80200,38,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Thug - On Script - Play Emote 1");

-- SCRIPT 8
SET @MAXGUID := 921; 
SET @SCRIPTID := 8025100; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 1, 35, 1, 5, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 20, 35, 2, 0, 802510, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 80251;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `move_type`, `action`) VALUES
(@PATH, 1, -8878.29, -410.994, 65.6802, 4.63836, 1000, 1, 0),                                                               
(@PATH, 2, -8880.02, -399.363, 66.0983, 2.83464, 0, 1, 0),                                                               
(@PATH, 3, -8898.18, -391.582, 68.6285, 3.16417, 0, 1, 0),                                                               
(@PATH, 4, -8914.49, -391.059, 69.3006, 2.22326, 0, 1, 0),                                                               
(@PATH, 5, -8928.27, -375.636, 71.218, 3.22857, 0, 1, 0),                                                               
(@PATH, 6, -8958.87, -373.826, 72.3354, 3.34245, 5000, 1, 0),                                                               
(@PATH, 7, -8921.43, -376.858, 71.1848, 0.534655, 0, 1, 0),                                                               
(@PATH, 8, -8909.08, -366.763, 72.135, 6.05679, 0, 1, 0),                                                               
(@PATH, 9, -8870.04, -371.407, 71.997, 4.63836, 0, 1, 0),                                                               
(@PATH, 10, -8878.29, -410.994, 65.6802, 4.63836, 0, 1, 0),                                                               
(@PATH, 11, -8878.29, -410.994, 65.6802, 4.63836, 25000, 1, @SCRIPTID);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);-- ('1485431827424263900');
-- Zalduun <Priest Trainer>
SET @NPC := 57213;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 2, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 3, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 4, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 5, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 6, -4102.44, -13763.8, 74.5717, 2.63796, 0),
(@PATH, 7, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 8, -4129.88, -13764.2, 74.5865, 3.28513, 0),
(@PATH, 9, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 10, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 11, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 12, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 13, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 14, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 15, -4121.58, -13761.4, 73.5881, 0.0354084, 0),
(@PATH, 16, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 17, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 18, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 19, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 20, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 21, -4102.44, -13763.8, 74.5717, 2.63796, 12000),
(@PATH, 22, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 23, -4129.88, -13764.2, 74.5865, 3.28513, 0),
(@PATH, 24, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 25, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 26, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 27, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 28, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 29, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 30, -4121.58, -13761.4, 73.5881, 0.0354084, 0),
(@PATH, 31, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 32, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 33, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 34, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 35, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 36, -4102.44, -13763.8, 74.5717, 2.63796, 0),
(@PATH, 37, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 38, -4129.88, -13764.2, 74.5865, 3.28513, 0),
(@PATH, 39, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 40, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 41, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 42, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 43, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 44, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 45, -4121.58, -13761.4, 73.5881, 0.0354084, 0),
(@PATH, 46, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 47, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 48, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 49, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 50, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 51, -4102.44, -13763.8, 74.5717, 2.63796, 0),
(@PATH, 52, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 53, -4129.88, -13764.2, 74.5865, 3.28513, 0),
(@PATH, 54, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 55, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 56, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 57, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 58, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 59, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 60, -4121.58, -13761.4, 73.5881, 0.0354084, 0),
(@PATH, 61, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 62, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 63, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 64, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 65, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 66, -4102.44, -13763.8, 74.5717, 2.63796, 0),
(@PATH, 67, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 68, -4129.88, -13764.2, 74.5865, 3.28513, 12000),
(@PATH, 69, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 70, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 71, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 72, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 73, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 74, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 75, -4121.58, -13761.4, 73.5881, 0.0354084, 0),
(@PATH, 76, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 77, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 78, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 79, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 80, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 81, -4102.44, -13763.8, 74.5717, 2.63796, 0),
(@PATH, 82, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 83, -4129.88, -13764.2, 74.5865, 3.28513, 0),
(@PATH, 84, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 85, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 86, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 87, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 88, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 89, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 90, -4121.58, -13761.4, 73.5881, 0.0354084, 0),
(@PATH, 91, -4113.68, -13762, 73.5694, 5.80705, 0),
(@PATH, 92, -4110.51, -13765.2, 73.6102, 5.19209, 0),
(@PATH, 93, -4107.71, -13772.5, 74.6982, 5.80705, 0),
(@PATH, 94, -4102.51, -13772.3, 74.7185, 0.511104, 0),
(@PATH, 95, -4099.89, -13768, 74.7256, 1.36954, 0),
(@PATH, 96, -4102.44, -13763.8, 74.5717, 2.63796, 0),
(@PATH, 97, -4125.6, -13762, 74.1406, 3.4807, 0),
(@PATH, 98, -4129.88, -13764.2, 74.5865, 3.28513, 0),
(@PATH, 99, -4135.57, -13762.7, 74.657, 2.14081, 0),
(@PATH, 100, -4137.16, -13760, 74.6108, 1.35698, 0),
(@PATH, 101, -4135.66, -13756.6, 74.5907, 0.545662, 0),
(@PATH, 102, -4131.3, -13754.6, 74.6109, 6.14319, 0),
(@PATH, 103, -4127.9, -13756.6, 74.2825, 5.30675, 0),
(@PATH, 104, -4127.08, -13760.8, 74.2562, 5.74265, 0),
(@PATH, 105, -4121.58, -13761.4, 73.5881, 0.0354084, 0);

-- Zalduun SAI
SET @ENTRY := 16502;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,74,0,100,0,0,40,120000,120000,11,29170,0,0,0,0,0,9,0,0,0,0,0,0,0,"Zalduun - On Friendly Between 0-40% Health - Cast 'Lesser Heal'"),
(@ENTRY,0,1,0,34,0,100,0,2,20,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zalduun - On Reached Point 20 - Run Script"),
(@ENTRY,0,2,0,34,0,100,0,2,67,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zalduun - On Reached Point 67 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1650200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Zalduun - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.31173,"Zalduun - On Script - Set Orientation 4.31173"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,11,29170,0,0,0,0,0,10,59238,16971,0,0,0,0,0,"Zalduun - On Script - Cast 'Lesser Heal'");

-- Actionlist SAI
SET @ENTRY := 1650201;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Zalduun - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.157151,"Zalduun - On Script - Set Orientation 0.157151"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,11,29170,0,0,0,0,0,10,59240,16971,0,0,0,0,0,"Zalduun - On Script - Cast 'Lesser Heal'");

DELETE FROM `creature_text` WHERE `entry`=16502;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(16502, 0, 0, 'Oh no!  I\'m losing this one!', 12, 7, 100, 0, 0, 0, 13113, 'Zalduun');-- ('1485431926939955800');
-- Gothik the Harvester Entry 2 event
-- Scarlet Deserter
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (130402,130403,130404,130405);
UPDATE `creature` SET `position_x` = 2817.77, `position_y` = -5453.906, `position_z` = 159.4021, `orientation` = 1.937315 WHERE `guid` = 130405;

-- Scarlet Deserter SAI
SET @GUID := -130405;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29193;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,25,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Deserter - On Reset - Set Fly On");

-- Gothik the Harvester SAI
SET @ENTRY := 29112;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,2000,640000,640000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 2911200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,0,4000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,0,30000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,63000,63000,0,0,1,1,4000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,4000,4000,0,0,1,1,30000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,73000,73000,0,0,1,2,4000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,4000,4000,0,0,1,2,30000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 2"),
(@ENTRY,9,7,0,0,0,100,0,68000,68000,0,0,1,3,4000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 3"),
(@ENTRY,9,8,0,0,0,100,0,4000,4000,0,0,1,3,30000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 3"),
(@ENTRY,9,9,0,0,0,100,0,78000,78000,0,0,1,4,4000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 4"),
(@ENTRY,9,10,0,0,0,100,0,4000,4000,0,0,1,4,30000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 4"),
(@ENTRY,9,11,0,0,0,100,0,73000,73000,0,0,1,5,4000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 5"),
(@ENTRY,9,12,0,0,0,100,0,4000,4000,0,0,1,5,30000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 5"),
(@ENTRY,9,13,0,0,0,100,0,53000,53000,0,0,1,6,30000,0,0,0,0,10,130405,29193,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 6"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry` IN (29193, 29112);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
-- Scarlet Deserter
(29193, 0, 0, 'You\'re a monster!', 12, 0, 100, 0, 0, 0, 29644, 'Scarlet Deserter'),
(29193, 1, 0, 'Please! Spare me! I...', 12, 0, 100, 0, 0, 0, 29645, 'Scarlet Deserter'),
(29193, 2, 0, 'Wi... Will it hurt?', 12, 0, 100, 0, 0, 0, 29641, 'Scarlet Deserter'),
(29193, 3, 0, 'It tingles...', 12, 0, 100, 0, 0, 0, 29642, 'Scarlet Deserter'),
(29193, 4, 0, 'Why don\'t you Just Kill me Already', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Deserter'),
(29193, 5, 0, 'Is it too late to change my mind? How about you just kill me instead?', 12, 0, 100, 0, 0, 0, 29643, 'Scarlet Deserter'),
(29193, 6, 0, 'The horror! THE HORROR!', 12, 0, 100, 0, 0, 0, 29646, 'Scarlet Deserter'),
-- Gothik the Harvester
(29112, 0, 0, 'Flattery will get you nowhere.', 12, 0, 100, 1, 0, 0, 29650, 'Gothik the Harvester'),
(29112, 1, 0, 'Don\'t be ridiculous. Where would you even go if I did spare you? We just finished eradicating your civilization, remember?', 12, 0, 100, 1, 0, 0, 29651, 'Gothik the Harvester'),
(29112, 2, 0, 'Oh yes. Immensely. The pain will propably render you unconcious - hence the vat of slime you\'re floating in!', 12, 0, 100, 1, 0, 0, 0, 'Gothik the Harvester'), 
(29112, 3, 0, 'That\'s how you know it\'s working.', 12, 0, 100, 1, 0, 0, 29648, 'Gothik the Harvester'),
(29112, 4, 0, 'You idiot! That\'s What I\'m Doing Right Now!', 12, 0, 100, 5, 0, 0, 0, 'Gothik the Harvester'),
(29112, 5, 0, 'I AM going to kill you. What\'s the rush?', 12, 0, 100, 6, 0, 0, 29649, 'Gothik the Harvester');-- ('1485431991613655000');
-- Gothik the Harvester
UPDATE `creature_template` SET `Speed_Walk` = 1.6, `Speed_Run` = 1.714286 WHERE `entry` = 28890;
UPDATE `creature` SET `position_x` = 2107.563721, `position_y` = -5742.198730, `position_z` = 99.855499, `orientation` = 1.374185 WHERE `guid` = 130121;
SET @NPC := 130121;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, 2109.85, -5727.25, 100.257, 0.413397, 0),
(@PATH, 2, 2156.03, -5712.91, 102.291, 6.15937, 0),
(@PATH, 3, 2177.85, -5738.68, 101.921, 5.56012, 0),
(@PATH, 4, 2188.7, -5759.94, 101.649, 5.14936, 10000),
(@PATH, 5, 2225.29, -5781.82, 101.775, 5.67557, 0),
(@PATH, 6, 2252.21, -5806.7, 100.959, 5.36848, 0),
(@PATH, 7, 2265.43, -5827.23, 100.945, 5.03548, 0),
(@PATH, 8, 2267.51, -5839.93, 100.944, 5.03941, 0),
(@PATH, 9, 2284.81, -5845.79, 100.935, 5.98189, 10000),
(@PATH, 10, 2259.68, -5866.16, 101.605, 3.82989, 0),
(@PATH, 11, 2241.44, -5886.94, 100.764, 4.04195, 0),
(@PATH, 12, 2228.81, -5899.27, 100.89, 3.64925, 0),
(@PATH, 13, 2201.1, -5902.2, 100.88, 3.12696, 0),
(@PATH, 14, 2179.59, -5890.74, 101.109, 2.15307, 0),
(@PATH, 15, 2181.51, -5888.24, 100.93, 0.693798, 10000),
(@PATH, 16, 2165.13, -5866.72, 101.331, 2.28265, 0),
(@PATH, 17, 2143.17, -5825.25, 101.125, 1.94886, 0),
(@PATH, 18, 2130.2, -5789.78, 98.9462, 1.48547, 10000),
(@PATH, 19, 2115.31, -5769.12, 98.1968, 1.93551, 0),
(@PATH, 20, 2107.57, -5742.3, 99.8496, 1.70931, 0);

DELETE FROM `creature_text` WHERE `entry`=28890;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(28890, 0, 0, 'Rise, minion. Rise and fly for the Scourge!', 12, 0, 100, 5, 0, 0, 29045, 'Gothik the Harvester'),
(28890, 0, 1, 'You will fly again, beast...', 12, 0, 100, 5, 0, 0, 29043, 'Gothik the Harvester'),
(28890, 1, 0, 'Surprise, surprise! Another ghoul!', 12, 0, 100, 5, 0, 0, 29038, 'Gothik the Harvester'),
(28890, 1, 1, 'Is Gothik the Harvester going to have to choke a geist?', 12, 0, 100, 5, 0, 0, 29037, 'Gothik the Harvester'),
(28890, 2, 0, 'Death is the only escape!', 12, 0, 100, 5, 0, 0, 29039, 'Gothik the Harvester');

-- Gothik the Harvester SAI
SET @ENTRY := 28890;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,34,0,100,0,2,3,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Reached Point 3 - Run Script"),
(@ENTRY,0,1,0,34,0,100,0,2,8,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Reached Point 8 - Run Script"),
(@ENTRY,0,2,0,34,0,100,0,2,14,0,0,80,@ENTRY*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Reached Point 14 - Run Script"),
(@ENTRY,0,3,0,34,0,100,0,2,17,0,0,80,@ENTRY*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Reached Point 17 - Run Script"),
(@ENTRY,0,4,0,25,0,100,1,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Reset - Set Active On (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 2889000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,11,52685,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Scourge Gryphon'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,41,1,0,0,0,0,0,19,28893,10,0,0,0,0,0,"Gothik the Harvester - On Script - Despawn Instant"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,45,1,1,0,0,0,0,19,28906,20,0,0,0,0,0,"On Script - Set Data 1 1");

-- Actionlist SAI
SET @ENTRY := 2889001;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,11,52685,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Scourge Gryphon'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,41,1,0,0,0,0,0,19,28893,10,0,0,0,0,0,"Gothik the Harvester - On Script - Despawn Instant"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,45,2,2,0,0,0,0,19,28906,20,0,0,0,0,0,"On Script - Set Data 2 2");

-- Actionlist SAI
SET @ENTRY := 2889002;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,11,52683,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Cast 'Scarlet Ghoul'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,41,1,0,0,0,0,0,19,28896,10,0,0,0,0,0,"Gothik the Harvester - On Script - Despawn Instant"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,45,1,1,0,0,0,0,19,28897,20,0,0,0,0,0,"Gothik the Harvester - On Script - Set Data 1 1");

-- Actionlist SAI
SET @ENTRY := 2889003;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,11,52683,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Cast 'Scarlet Ghoul'"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,19,28898,10,0,0,0,0,0,"Gothik the Harvester - On Script - Despawn Instant"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,11,52672,0,0,0,0,0,10,130312,28905,0,0,0,0,0,"Gothik the Harvester - On Script - Cast 'Ghoulplosion'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Gothik the Harvester - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,45,1,1,0,0,0,0,19,28897,20,0,0,0,0,0,"Gothik the Harvester - On Script - Set Data 1 1");


-- Scourge Gryphon
UPDATE `creature_template` SET `MovementType` = 0, `InhabitType` = 4, `Speed_Walk` = 2.4, `Speed_Run` = 2.57143 WHERE `entry` = 28906;

-- Scarlet Gryphon SAI
SET @ENTRY := 28893;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,52685,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Gryphon - On Spellhit 'Scourge Gryphon' - Despawn Instant");

-- Scourge Gryphon SAI
SET @ENTRY := 28906;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Gryphon - On Data Set 1 1 - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,1,1,0,0,69,1,0,0,0,0,0,8,0,0,0,1781.18,-5818.34,114.383,0,"Scourge Gryphon - On Data Set 1 1 - Move To Position"),
(@ENTRY,0,2,0,34,0,100,0,8,1,0,0,49,0,0,0,0,0,0,19,28610,100,0,0,0,0,0,"Scourge Gryphon - On Reached Point 1 - Start Attacking"),
(@ENTRY,0,3,4,38,0,100,0,2,2,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Gryphon - On Data Set 2 2 - Set Active On"),
(@ENTRY,0,4,0,61,0,100,0,2,2,0,0,69,2,0,0,0,0,0,8,0,0,0,1818.18,-5930.02,113.669,0,"Scourge Gryphon - On Data Set 2 2 - Move To Position"),
(@ENTRY,0,5,0,34,0,100,0,8,2,0,0,49,0,0,0,0,0,0,19,28610,100,0,0,0,0,0,"Scourge Gryphon - On Reached Point 2 - Start Attacking"),
(@ENTRY,0,6,0,63,0,100,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Gryphon - On Just Created - Despawn In 300000 ms");

-- Scarlet Infantryman SAI
SET @ENTRY := 28896;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,52683,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Infantryman - On Spellhit 'Scarlet Ghoul' - Despawn Instant");

-- Scarlet Captain SAI
SET @ENTRY := 28898;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,52683,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Captain - On Spellhit 'Scarlet Ghoul' - Despawn Instant");

-- Scarlet Ghoul SAI
SET @ENTRY := 28897;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Ghoul - On Data Set 1 1 - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,1,1,0,0,53,1,28897,0,0,0,2,8,0,0,0,1783.51,-5818.18,113.877,3.19587,"Scarlet Ghoul - On Data Set 1 1 - Start Waypoint"),
(@ENTRY,0,2,3,63,0,100,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Ghoul - On Just Created - Despawn In 300000 ms"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Ghoul - On Just Created - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=28897;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(28897, 0, 0, 'So hungry...', 12, 0, 100, 0, 0, 0, 28955, 'Scarlet Ghoul'),
(28897, 0, 1, 'Must feed...', 12, 0, 100, 0, 0, 0, 28956, 'Scarlet Ghoul'),
(28897, 0, 2, 'Smell flesh... close...', 12, 0, 100, 0, 0, 0, 28958, 'Scarlet Ghoul');

UPDATE `creature_template` SET `MovementType` = 0, `InhabitType` = 3 WHERE `entry` = 28897;
DELETE FROM `waypoints` WHERE `entry`=28897;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(28897, 1, 2143.13, -5845.46, 101.335, 'Scarlet Ghoul'),
(28897, 2, 2112.23, -5869.67, 102.671, 'Scarlet Ghoul'),
(28897, 3, 2075.06, -5888.31, 104.169, 'Scarlet Ghoul'),
(28897, 4, 2047.48, -5901.68, 105.289, 'Scarlet Ghoul'),
(28897, 5, 2017.32, -5907.23, 104.617, 'Scarlet Ghoul'),
(28897, 6, 1962.61, -5905.59, 102.366, 'Scarlet Ghoul'),
(28897, 7, 1925.94, -5911, 101.514, 'Scarlet Ghoul'),
(28897, 8, 1884.37, -5910.29, 103.345, 'Scarlet Ghoul'),
(28897, 9, 1858.9, -5916.94, 104.525, 'Scarlet Ghoul'),
(28897, 10, 1840.21, -5923.29, 107.843, 'Scarlet Ghoul'),
(28897, 11, 1819.53, -5930.31, 113.439, 'Scarlet Ghoul'),
(28897, 12, 1800.91, -5936.87, 115.947, 'Scarlet Ghoul');

UPDATE `creature` SET `spawntimesecs`=30 WHERE  `id` IN (28893, 28896, 28898);
UPDATE `creature` SET `spawntimesecs`=30 WHERE  `guid`=130312;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND  `SourceGroup`=1 AND `SourceEntry` IN (52685, 52683);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 52685, 0, 0, 31, 0, 3, 28893, 0, 0, 0, 0, '', 'Scourge Gryphon only targets Scarlet Gryphon'),
(13, 1, 52683, 0, 0, 31, 0, 3, 28896, 0, 0, 0, 0, '', 'Scarlet Ghoul only targets Scarlet Infantryman'),
(13, 1, 52683, 0, 1, 31, 0, 3, 28898, 0, 0, 0, 0, '', 'Scarlet Ghoul only targets Scarlet Captain'),
(13, 1, 52683, 0, 2, 31, 0, 3, 28892, 0, 0, 0, 0, '', 'Scarlet Ghoul only targets Scarlet Peasant'),
(13, 1, 52683, 0, 3, 31, 0, 3, 28897, 0, 0, 0, 0, '', 'Scarlet Ghoul only targets Scarlet Ghoul'),
(13, 1, 52683, 0, 4, 31, 0, 3, 28886, 0, 0, 0, 0, '', 'Scarlet Ghoul only targets Scarlet Fleet Defender');-- ('1485432088863217300');
-- Lord Thorval - Rework Textevent
SET @NPC := 128506;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, 2527.73, -5549.21, 377.036, 3.735, 30000),
(@PATH, 2, 2524.61, -5545.03, 377.027, 2.21325, 0),
(@PATH, 3, 2524.61, -5545.03, 377.027, 4.06051, 15000),
(@PATH, 4, 2530.44, -5554.25, 377.056, 5.26204, 0),
(@PATH, 5, 2530.44, -5554.25, 377.056, 3.50275, 15000),
(@PATH, 6, 2524.61, -5545.03, 377.027, 2.21325, 0),
(@PATH, 7, 2524.61, -5545.03, 377.027, 4.06051, 15000),
(@PATH, 8, 2530.44, -5554.25, 377.056, 5.26204, 1000),
(@PATH, 9, 2524.61, -5545.03, 377.027, 2.21325, 1000),
(@PATH, 10, 2530.44, -5554.25, 377.056, 5.26204, 1000),
(@PATH, 11, 2524.61, -5545.03, 377.027, 2.21325, 0),
(@PATH, 12, 2524.61, -5545.03, 377.027, 4.06051, 15000),
(@PATH, 13, 2527.73, -5549.21, 377.036, 2.18866, 0),
(@PATH, 14, 2527.73, -5549.21, 377.036, 3.735, 330000);

-- Lord Thorval SAI
SET @ENTRY := 28472;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,34,0,100,0,2,2,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 2 - Run Script"),
(@ENTRY,0,1,0,34,0,100,0,2,4,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 4 - Run Script"),
(@ENTRY,0,2,0,34,0,100,0,2,6,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 6 - Run Script"),
(@ENTRY,0,3,0,34,0,100,0,2,7,0,0,80,@ENTRY*100+03,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 7 - Run Script"),
(@ENTRY,0,4,0,34,0,100,0,2,8,0,0,80,@ENTRY*100+04,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 8 - Run Script"),
(@ENTRY,0,5,0,34,0,100,0,2,9,0,0,80,@ENTRY*100+05,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 9 - Run Script"),
(@ENTRY,0,6,0,34,0,100,0,2,11,0,0,80,@ENTRY*100+06,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Reached Point 11 - Run Script");

-- Actionlist SAI
SET @ENTRY := 2847200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 0");

-- Actionlist SAI
SET @ENTRY := 2847201;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,9000,9000,0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 2");

-- Actionlist SAI
SET @ENTRY := 2847202;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,3,9000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 3"),
(@ENTRY,9,1,0,0,0,100,0,9000,9000,0,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 4");

-- Actionlist SAI
SET @ENTRY := 2847203;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,5,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 5");

-- Actionlist SAI
SET @ENTRY := 2847204;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,6,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 6");

-- Actionlist SAI
SET @ENTRY := 2847205;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,7,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 7");

-- Actionlist SAI
SET @ENTRY := 2847206;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,8,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Thorval - On Script - Say Line 8");

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `TextRange`) VALUES
(@ENTRY, 0, 0, 'As disciples of blood, you strive to master the very lifeforce of your enemies.',                                       12, 0, 100, 1, 0, 0, 'Lord Thorval', 29867),
(@ENTRY, 1, 0, 'Be it by blade or incantation, blood feeds our attacks and weakens our foes.',                                          12, 0, 100, 1, 0, 0, 'Lord Thorval', 29868),
(@ENTRY, 2, 0, 'True masters learn to make blood serve more than just their strength in battle.',                                       12, 0, 100, 1, 0, 0, 'Lord Thorval', 29869),
(@ENTRY, 3, 0, 'Stripping energy from our foes, both fighting and fallen, allows us to persevere where lesser beigns falls exhausted.', 12, 0, 100, 1, 0, 0, 'Lord Thorval', 29870),
(@ENTRY, 4, 0, 'And every foe that falls, energy sapped and stolen, only further fuels our assault.',                                   12, 0, 100, 1, 0, 0, 'Lord Thorval', 29871),
(@ENTRY, 5, 0, 'As masters of blood, we know battle without end...',                                                                    12, 0, 100, 1, 0, 0, 'Lord Thorval', 29872),
(@ENTRY, 6, 0, 'We know hunger never to be quenched...',                                                                                12, 0, 100, 1, 0, 0, 'Lord Thorval', 29873),
(@ENTRY, 7, 0, 'We know power never to be overcome...',                                                                                 12, 0, 100, 1, 0, 0, 'Lord Thorval', 29874),
(@ENTRY, 8, 0, 'As masters of blood, we are masters of life and death itself. Agains us, even hope falls drained and lifeless.',        12, 0, 100, 1, 0, 0, 'Lord Thorval', 29875);
-- Fruits of Our Labor - http://wotlk.openwow.com/quest=11904
-- Cart Release SAI
SET @ENTRY := 188104;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,19,25986,20,0,0,0,0,0,"Cart Release - On Gameobject State Changed - Set Data 1 1");

DELETE FROM `creature_text` WHERE `entry`=25986;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(25986, 0, 0, 'The Ore Cart squeaks against the rails as it is released.', 16, 0, 100, 0, 0, 0, 25416, 'Ore Cart');

UPDATE `creature` SET `spawntimesecs`=1 WHERE  `guid`=132773;

-- Ore Cart SAI
SET @ENTRY := 25986;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,1,1,1,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ore Cart - On Data Set 1 1 - Set Active On (No Repeat)"),
(@ENTRY,0,1,3,61,0,100,0,1,1,0,0,53,0,25986,0,0,0,0,1,0,0,0,0,0,0,0,"Ore Cart - On Data Set 1 1 - Start Waypoint (No Repeat)"),
(@ENTRY,0,2,4,40,0,100,0,15,25986,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ore Cart - On Waypoint 15 Reached - Despawn In 100 ms"),
(@ENTRY,0,3,0,61,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ore Cart - On Data Set 1 1 - Say Line 0 (No Repeat)"),
(@ENTRY,0,4,0,61,0,100,0,15,25986,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ore Cart - On Waypoint 15 Reached - Set Active Off");

DELETE FROM `waypoints` WHERE `entry`=25986;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(25986,1,2797.49,5277.37,22.0435, 'Ore Cart'),
(25986,2,2794.32,5281.92,22.4205, 'Ore Cart'),
(25986,3,2790.66,5285.51,21.9443, 'Ore Cart'),
(25986,4,2783.22,5291.11,22.7502, 'Ore Cart'),
(25986,5,2776.37,5297,24.6788, 'Ore Cart'),
(25986,6,2772.41,5299.31,25.5129, 'Ore Cart'),
(25986,7,2767.82,5300.13,26.1103, 'Ore Cart'),
(25986,8,2764.16,5299.4,26.2145, 'Ore Cart'),
(25986,9,2760.57,5297.91,26.187, 'Ore Cart'),
(25986,10,2757.37,5295.31,25.8549, 'Ore Cart'),
(25986,11,2755.49,5291.84,25.142, 'Ore Cart'),
(25986,12,2752.95,5288.89,24.7977, 'Ore Cart'),
(25986,13,2748.91,5286.94,24.7359, 'Ore Cart'),
(25986,14,2746.13,5285.9,24.8515, 'Ore Cart'),
(25986,15,2733.06,5284.92,27.2962, 'Ore Cart');-- ('1485432556104942000');
-- Mordenai -- http://wotlk.openwow.com/npc=22113
-- Mordenai SAI
SET @ENTRY := 22113;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,22113,1,0,0,2,1,0,0,0,0,0,0,0,"Mordenai - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mordenai - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,1,22113,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mordenai - On Waypoint 1 Reached - Pause Waypoint"),
(@ENTRY,0,3,0,61,0,100,0,1,22113,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.59702,"Mordenai - On Waypoint 1 Reached - Set Orientation 4.59702"),
(@ENTRY,0,4,0,40,0,100,0,2,22113,0,0,49,0,0,0,0,0,0,19,21478,80,0,0,0,0,0,"Mordenai - On Waypoint 2 Reached - Start Attacking"),
(@ENTRY,0,5,0,40,0,100,0,12,22113,0,0,49,0,0,0,0,0,0,19,21478,80,0,0,0,0,0,"Mordenai - On Waypoint 12 Reached - Start Attacking"),
(@ENTRY,0,6,0,0,0,100,0,0,0,2300,3900,11,41440,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mordenai - In Combat - Cast 'Shoot'"),
(@ENTRY,0,7,0,0,0,100,0,6000,9000,27000,28000,11,41448,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mordenai - In Combat - Cast 'Multi-Shot'"),
(@ENTRY,0,8,0,0,0,100,0,5000,5000,18000,18000,11,38370,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mordenai - In Combat - Cast 'Aimed Shot'");

DELETE FROM `waypoints` WHERE `entry`=22113;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(22113, 1, -4100.05, 969.276,  24.9571, 'Mordenai'),
(22113, 2, -4104.06, 931.187,  18.8469, 'Mordenai'),
(22113, 3, -4105.65, 911.224,  16.1353, 'Mordenai'),
(22113, 4, -4106.05, 889.833,  14.4649, 'Mordenai'),
(22113, 5, -4118.47, 857.928,  8.29486, 'Mordenai'),
(22113, 6, -4122.4, 839.518,   10.4151, 'Mordenai'),
(22113, 7, -4143.45, 803.2,    9.22043, 'Mordenai'),
(22113, 8, -4150.96, 769.769,  6.31908, 'Mordenai'),
(22113, 9, -4153.1, 760.191,   3.47747, 'Mordenai'),
(22113, 10, -4155.08, 747.368, 1.8985,  'Mordenai'),
(22113, 11, -4151.37, 769.929, 6.42453, 'Mordenai'),
(22113, 12, -4132.84, 797.355, 8.16607, 'Mordenai'),
(22113, 13, -4137.32, 823.672, 9.68296, 'Mordenai'),
(22113, 14, -4119.16, 842.164, 9.89524, 'Mordenai'),
(22113, 15, -4115.26, 851.276, 7.68533, 'Mordenai'),
(22113, 16, -4109.66, 883.088, 13.8876, 'Mordenai'),
(22113, 17, -4110.74, 914.769, 17.723,  'Mordenai'),
(22113, 18, -4106.89, 948.026, 23.0078, 'Mordenai');-- ('1485432620657634200');
-- Chancellor Bloodleaf -- http://wotlk.openwow.com/npc=22012
-- Chancellor Bloodleaf SAI
SET @ENTRY := 22012;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,15000,15000,130000,130000,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - Out of Combat - Run Script"),
(@ENTRY,0,1,0,0,0,100,0,5000,6000,5000,6000,11,34517,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - In Combat - Cast 'Arcane Explosion'");

-- Actionlist SAI
SET @ENTRY := 2201200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,8000,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - On Script - Play Emote 1"),
(@ENTRY,9,2,0,0,0,100,0,9000,9000,0,0,1,0,6000,0,0,0,0,10,77086,22011,0,0,0,0,0,"Chancellor Bloodleaf - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,1,1,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - On Script - Play Emote 1"),
(@ENTRY,9,5,0,0,0,100,0,6000,6000,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Chancellor Bloodleaf - On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry` IN (22011, 22012);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
-- Corok the Mighty 
(22011, 0, 0, 'And... if we do not?', 12, 0, 100, 0, 0, 0, 19695, 'Corok the Mighty'),
-- Chancellor Bloodleaf
(22012, 0, 0, 'Lend us the strength of the giants of Shadowmoon, Corok. The master is a just ruler. He will be sure to take care of those that assisted in subduing the dissidents of this world.', 12, 0, 100, 0, 0, 0, 19693, 'Chancellor Bloodleaf'),
(22012, 1, 0, 'Then you become enemies of my lord, Illidan. Enemies of Illidan are destroyed. Are your giants able to withstand an attack from the forces of Eclipse Point?', 12, 0, 100, 0, 0, 0, 19696, 'Chancellor Bloodleaf'),
(22012, 2, 0, 'No... I did not think so...', 12, 0, 100, 0, 0, 0, 19697, 'Chancellor Bloodleaf');-- ('1485432691232670900');
-- Painmistress Gabrissa -- http://wotlk.openwow.com/npc=21309
-- Painmistress Gabrissa SAI
SET @ENTRY := 21309;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,7000,20000,25000,11,38048,0,0,0,0,0,2,0,0,0,0,0,0,0,"Painmistress Gabrissa - In Combat - Cast 'Curse of Pain'"),
(@ENTRY,0,1,0,0,0,100,0,6000,7000,17000,20000,11,38169,0,0,0,0,0,2,0,0,0,0,0,0,0,"Painmistress Gabrissa - In Combat - Cast 'Subservience'"),
(@ENTRY,0,2,0,25,0,100,0,0,0,0,0,53,0,21309,1,0,0,2,0,0,0,0,0,0,0,0,"Painmistress Gabrissa - On Reset - Start Waypoint"),
(@ENTRY,0,3,0,40,0,100,0,5,21309,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Painmistress Gabrissa - On Waypoint 5 Reached - Run Script"),
(@ENTRY,0,4,5,40,0,100,0,9,21309,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Painmistress Gabrissa - On Waypoint 9 Reached - Pause Waypoint"),
(@ENTRY,0,5,0,61,0,100,0,9,21309,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.37533,"Painmistress Gabrissa - On Waypoint 9 Reached - Set Orientation 3.37533"),
(@ENTRY,0,6,0,4,0,100,0,0,0,0,0,49,0,0,0,0,0,0,2,0,0,0,0,0,0,0,"Painmistress Gabrissa - On Aggro - Start Attacking");

-- Actionlist SAI
SET @ENTRY := 2130900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Painmistress Gabrissa - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.60702,"Painmistress Gabrissa - On Script - Set Orientation 3,60702"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,11,36578,0,0,0,0,0,10,74619,21310,0,0,0,0,0,"Painmistress Gabrissa - On Script - Cast 'Fool's Fortune'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,92,0,36578,1,0,0,0,1,0,0,0,0,0,0,0,"Painmistress Gabrissa - On Script - Interrupt Spell 'Fool's Fortune'");

DELETE FROM `waypoints` WHERE `entry`=21309;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(21309, 1, -3697.1, 2669.77,  107.186, 'Painmistress Gabrissa'),
(21309, 2, -3697.68, 2673.34, 108.569, 'Painmistress Gabrissa'),
(21309, 3, -3692.22, 2678.74, 108.66,  'Painmistress Gabrissa'),
(21309, 4, -3690.04, 2682.79, 108.752, 'Painmistress Gabrissa'),
(21309, 5, -3692.89, 2684.18, 108.485, 'Painmistress Gabrissa'),
(21309, 6, -3690.92, 2682.03, 108.744, 'Painmistress Gabrissa'),
(21309, 7, -3694.07, 2677.51, 108.537, 'Painmistress Gabrissa'),
(21309, 8, -3697.53, 2673.77, 108.581, 'Painmistress Gabrissa'),
(21309, 9, -3693.46, 2668.44, 107.174, 'Painmistress Gabrissa');-- ('1485432759914599300');
-- Eye of the Citadel -- http://wotlk.openwow.com/npc=21134
-- Warlord Morkh SAI
SET @ENTRY := 16964;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,9000,17000,17000,11,34080,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Morkh - In Combat - Cast 'Riposte Stance'"),
(@ENTRY,0,1,0,0,0,100,0,7000,7000,8000,8000,11,11978,1,0,0,0,0,2,0,0,0,0,0,0,0,"Warlord Morkh - In Combat - Cast 'Kick'"),
(@ENTRY,0,2,3,2,0,100,1,0,20,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Morkh - Between 0-20% Health - Cast 'Enrage' (No Repeat)"),
(@ENTRY,0,3,0,61,0,100,0,0,20,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Morkh - Between 0-20% Health - Say Line 0 (No Repeat)"),
(@ENTRY,0,4,5,6,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Warlord Morkh - On Just Died - Store Targetlist"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,10,86039,21134,0,0,0,0,0,"Warlord Morkh - On Just Died - Send Target 1"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,86039,21134,0,0,0,0,0,"Warlord Morkh - On Just Died - Set Data 1 1");

-- Eye of the Citadel SAI
SET @ENTRY := 21134;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Eye of the Citadel - On Data Set 1 1 - Run Script"),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eye of the Citadel - On Reset - Set Visibility Off");

-- Actionlist SAI
SET @ENTRY := 2113400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Eye of the Citadel - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eye of the Citadel - On Script - Set Visibility On"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,1,4000,0,0,0,0,12,1,0,0,0,0,0,0,"Eye of the Citadel - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Eye of the Citadel - On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eye of the Citadel - On Script - Set Visibility Off");

DELETE FROM `creature_text` WHERE `entry`=21134;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(21134, 0, 0, 'A deep, bone chilling voice echoes from the %s...', 16, 0, 100, 0, 0, 0, 18774, 'Eye of the Citadel'),
(21134, 1, 0, 'How dare you trifle with my playthings, $n!', 12, 0, 100, 0, 0, 0, 18775, 'Eye of the Citadel'),
(21134, 2, 0, 'The orcs in my citadel will drink your blood and dovour you!', 12, 0, 100, 0, 0, 0, 18776, 'Eye of the Citadel');
-- Levixus SAI
SET @ENTRY := 19847;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,24313,0,0,0,0,0,1,0,0,0,0,0,0,0,"Levixus - On Respawn - Cast 'Shade' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,7000,13000,17000,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Levixus - In Combat - Cast 'Cripple'"),
(@ENTRY,0,2,0,0,0,100,0,9000,14000,13000,17000,11,7645,1,0,0,0,0,6,0,0,0,0,0,0,0,"Levixus - In Combat - Cast 'Dominate Mind'"),
(@ENTRY,0,3,0,0,0,100,0,10000,13000,18000,22000,11,38939,1,0,0,0,0,2,0,0,0,0,0,0,0,"Levixus - In Combat - Cast 'Inferno'"),
(@ENTRY,0,4,0,1,0,100,0,0,0,20000,20000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Levixus - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 1984700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,1000,0,0,0,0,1,0,0,0,0,0,0,0,"Levixus - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,8000,0,0,0,0,1,0,0,0,0,0,0,0,"Levixus - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,0,1000,0,0,0,0,1,0,0,0,0,0,0,0,"Levixus - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Levixus - On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=19847;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(19847, 0, 0, '%s reads from the book of the dead.', 16, 0, 100, 0, 0, 0, 17446, 'Levixus'),
-- 
(19847, 1, 0, 'Shane Dabiri, Lee, Alex T., Rob F., J. A. B.,  A. Mayberry!', 12, 8, 100, 15, 0, 0, 17454, 'Levixus'),
(19847, 1, 1, 'Jeffrey Kaplan! Tom Chilton! Rob Pardo!', 12, 8, 100, 15, 0, 0, 17447, 'Levixus'),
(19847, 1, 2, 'Justin Thavirat! Roman Kenney! Our entire awesome art and animation team!', 12, 8, 100, 15, 0, 0, 17448, 'Levixus'),
(19847, 1, 3, 'Kevin Jordan and Jonathan LeCraft!', 12, 8, 100, 15, 0, 0, 17453, 'Levixus'),
(19847, 1, 4, 'CHRIS METZEN!', 12, 8, 100, 15, 0, 0, 17449, 'Levixus'),
(19847, 1, 5, 'Pat Nagle! World design team! Cory Stockton, Paul C., Jim Chadwick, Staats, Ed Hanes, Morris, Gotcher, Jesse!, Sarah B., Victor C., Dave A.! All of our amazing exterior artists!', 12, 8, 100, 15, 0, 0, 17450, 'Levixus'),
(19847, 1, 6, 'Scott Mercer! Geoff, Wyatt, Joe, Travis, Kris, Steven! Brazie!', 12, 8, 100, 15, 0, 0, 17451, 'Levixus'),
(19847, 1, 7, 'Luis, Brianna and Eric! Blizzard QA team! Of course our fans!', 12, 8, 100, 15, 0, 0, 17452, 'Levixus');-- ('1485432952303603300');
-- Experimental Pilot -- http://wotlk.openwow.com/npc=19776

-- Experimental Pilot SAI
SET @ENTRY := 19776;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,19776,1,0,0,0,1,0,0,0,0,0,0,0,"Experimental Pilot - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Experimental Pilot - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,8,19776,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Experimental Pilot - On Waypoint 8 Reached - Run Script"),
(@ENTRY,0,3,4,40,0,100,0,15,19776,0,0,54,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Experimental Pilot - On Waypoint 15 Reached - Pause Waypoint"),
(@ENTRY,0,4,0,61,0,100,0,15,19776,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.0689,"Experimental Pilot - On Waypoint 15 Reached - Set Orientation 5,0689");

-- Actionlist SAI
SET @ENTRY := 1977600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,140000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.111339,"On Script - Set Orientation 2.111339"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,45,1,1,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Set Data 1 1"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,0,15000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,4,0,0,0,100,0,15000,15000,0,0,1,0,20000,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,5,0,0,0,100,0,20000,20000,0,0,1,1,20000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 6"),
(@ENTRY,9,7,0,0,0,100,0,20000,20000,0,0,1,1,15000,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,8,0,0,0,100,0,15000,15000,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 6"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,1,2,15000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,10,0,0,0,100,0,15000,15000,0,0,1,2,10000,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,11,0,0,0,100,0,10000,10000,0,0,1,3,15000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,12,0,0,0,100,0,0,0,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 6"),
(@ENTRY,9,13,0,0,0,100,0,15000,15000,0,0,1,3,10000,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,14,0,0,0,100,0,10000,10000,0,0,1,4,15000,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,15,0,0,0,100,0,15000,15000,0,0,1,4,0,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,45,2,2,0,0,0,0,10,70614,19737,0,0,0,0,0,"On Script - Set Data 2 2");

-- Buddy AI
-- Engineering Crewmember SAI
SET @GUID := -70614;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=19737;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,10,70731,19776,0,0,0,0,0,"Engineering Crewmember - On Data Set 1 1 - Set Orientation Closest Creature 'Experimental Pilot'"),
(@GUID,0,1,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.199120,"Engineering Crewmember - On Data Set 2 2 - Set Orientation 2,199120");

DELETE FROM `creature_text` WHERE `entry` IN (19737, 19776);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(19776, 0, 0, 'All my bags are packed, I''m ready to go.', 12, 0, 100, 0, 0, 0, 17413, 'Experimental Pilot'),
(19776, 1, 0, 'You need to do what? All this science, I don''t understand... Look, this is just my job, five days a week.', 12, 0, 100, 0, 0, 0, 17416, 'Experimental Pilot'),
(19776, 2, 0, 'I can''t. I''m not the man they think I am at home.  Besides, I didn''t bring them out here.', 12, 0, 100, 0, 0, 0, 17419, 'Experimental Pilot'),
(19776, 3, 0, 'This isn''t the kind of place to raise your kids. It''s cold, and there''d be no one to raise them.', 12, 0, 100, 0, 0, 0, 17421, 'Experimental Pilot'),
(19776, 4, 0, 'Oh no, no, no... I''m a rocket man.', 12, 0, 100, 0, 0, 0, 17423, 'Experimental Pilot'),
-- 
(19737, 0, 0, 'The ship''s not ready yet.  We still need to calibrate the fuse length to make sure that it doesn''t burn out and leave you up there alone.', 12, 0, 100, 0, 0, 0, 17414, 'Engineering Crewmember'),
(19737, 1, 0, 'Essentially, it''s going to be a long, long time till we are ready to launch.  Maybe you should just head back home to your family.', 12, 0, 100, 0, 0, 0, 17417, 'Engineering Crewmember'),
(19737, 2, 0, 'Why not? A family can give you strength.', 12, 0, 100, 0, 0, 0, 17420, 'Engineering Crewmember'),
(19737, 3, 0, 'Couldn''t you raise them?', 12, 0, 100, 0, 0, 0, 17422, 'Engineering Crewmember'),
(19737, 4, 0, 'Well, it''s like I said; it''s going to be a while before we get this ship ready for flight.  We''ll keep you informed.', 12, 0, 100, 0, 0, 0, 17424, 'Engineering Crewmember');

DELETE FROM `waypoints` WHERE `entry`=19776;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(19776, 1, 2976.31, 3709.67,  142.398, 'Experimental Pilot'),
(19776, 2, 2987.82, 3686.2,   142.681, 'Experimental Pilot'),
(19776, 3, 2987.82, 3652.62,  143.244, 'Experimental Pilot'),
(19776, 4, 2999.17, 3645.03,  143.849, 'Experimental Pilot'),
(19776, 5, 3006.7, 3648.63,   143.771, 'Experimental Pilot'),
(19776, 6, 3042.1, 3645.08,   142.808, 'Experimental Pilot'),
(19776, 7, 3047.12, 3648.91,  142.832, 'Experimental Pilot'),
(19776, 8, 3043.87, 3652.34,  142.88,  'Experimental Pilot'),
(19776, 9, 3026.43, 3641.43,  143.507, 'Experimental Pilot'),
(19776, 10, 2989.67, 3650.38, 143.486, 'Experimental Pilot'),
(19776, 11, 2988.99, 3685.32, 142.73,  'Experimental Pilot'),
(19776, 12, 2975.27, 3712.82, 142.309, 'Experimental Pilot'),
(19776, 13, 2975.12, 3725.84, 142.688, 'Experimental Pilot'),
(19776, 14, 2965.31, 3733.57, 143.503, 'Experimental Pilot'),
(19776, 15, 2966.14, 3733,    143.472, 'Experimental Pilot');-- ('1485433015636225700');
-- Consortium Nether Runner -- http://wotlk.openwow.com/npc=19667
UPDATE `creature` SET `position_x`=-2057.45, `position_y`=8528.71, `position_z`=24.6556, `orientation`=2.05449, `spawntimesecs`=120 WHERE  `guid`=70166;

-- Consortium Nether Runner SAI
SET @ENTRY := 19667;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,19667,0,0,0,1,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,1,19667,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Waypoint 1 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,5,19667,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Waypoint 5 Reached - Run Script"),
(@ENTRY,0,4,0,40,0,100,0,8,19667,0,0,80,@ENTRY*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Waypoint 8 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 1966700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.05449,"Consortium Nether Runner - On Script - Set Orientation 2.05449"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Script - Cast 'Ethereal Teleport'");

-- Actionlist SAI
SET @ENTRY := 1966701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,11000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.57111,"Consortium Nether Runner - On Script - Set Orientation 3.57111"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,45,1,1,0,0,0,0,10,65554,18265,0,0,0,0,0,"Consortium Nether Runner - On Script - Set Data 1 1"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,0,5000,0,0,0,0,10,65554,18265,0,0,0,0,0,"Consortium Nether Runner - On Script - Say Line 0"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Consortium Nether Runner - On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,45,2,2,0,0,0,0,10,65554,18265,0,0,0,0,0,"Consortium Nether Runner - On Script - Set Data 1 1");

-- Actionlist SAI
SET @ENTRY := 1966702;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.573574,"On Script - Set Orientation 0,573574"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Ethereal Teleport'"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Despawn Instant");

-- Buddy AI
-- Gezhe SAI
SET @ENTRY := 18265;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,10,70166,19667,0,0,0,0,0,"Gezhe - On Data Set 1 1 - Set Orientation Closest Creature 'Consortium Nether Runner'"),
(@ENTRY,0,1,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.513270,"Gezhe - On Data Set 2 2 - Set Orientation 2,513270");

DELETE FROM `creature_text` WHERE `entry` IN (19667, 18265);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
-- Consortium Nether Runner
(19667, 0, 0, 'Hail, Gezhe!  Seventeen more orders have been placed in the Hara''samid Sector.  The markets of heavy veldarite have all but collapsed, as you predicted.', 12, 0, 100, 0, 0, 0, 17184, 'Consortium Nether Runner'),
(19667, 0, 1, 'Heraazi exports are on the rise, sir.  We''ve already bribed the appropriate taxation officers and contraband will begin to arrive within days.', 12, 0, 100, 0, 0, 0, 17186, 'Consortium Nether Runner'),
(19667, 1, 0, 'By your leave, sir.', 12, 0, 100, 0, 0, 0, 17185, 'Consortium Nether Runner'),
-- Gezhe
(18265, 0, 0, 'Nothing surprising there.  Come back with some real news, will you?', 12, 0, 100, 0, 0, 0, 17191, 'Gezhe'),
(18265, 0, 1, 'As expected.  Very well, dismissed.', 12, 0, 100, 0, 0, 0, 17190, 'Gezhe');

DELETE FROM `waypoints` WHERE `entry`=19667;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(19667, 1, -2057.45, 8528.71, 24.6556, 'Consortium Nether Runner'),
(19667, 2, -2058.23, 8547.79, 24.0203, 'Consortium Nether Runner'),
(19667, 3, -2064.09, 8554.57, 23.9054, 'Consortium Nether Runner'),
(19667, 4, -2075.08, 8562.74, 22.9801, 'Consortium Nether Runner'),
(19667, 5, -2083.14, 8565.28, 22.0791, 'Consortium Nether Runner'),
(19667, 6, -2062.94, 8574.57, 23.1942, 'Consortium Nether Runner'),
(19667, 7, -2056.25, 8597.59, 21.3663, 'Consortium Nether Runner'),
(19667, 8, -2049.12, 8603.37, 22.7377, 'Consortium Nether Runner');-- ('1485433070640371800');
-- Nurse Judith -- http://wotlk.openwow.com/npc=19455
UPDATE `creature_template_addon` SET `bytes1`=0 WHERE  `entry`=19455;

-- Nurse Judith SAI
SET @ENTRY := 19455;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,19455,1,0,0,1,0,0,0,0,0,0,0,0,"Nurse Judith - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Gossip Hello - Pause Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,2,19455,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Waypoint 2 Reached - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,2,19455,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.76273,"Nurse Judith - On Waypoint 2 Reached - Set Orientation 2,76273"),
(@ENTRY,0,4,5,40,0,100,0,5,19455,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Waypoint 5 Reached - Run Script"),
(@ENTRY,0,5,0,61,0,100,0,5,19455,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.1529,"Nurse Judith - On Waypoint 5 Reached - Set Orientation 4,1529"),
(@ENTRY,0,5,6,40,0,100,0,7,19455,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Waypoint 7 Reached - Run Script"),
(@ENTRY,0,6,0,61,0,100,0,7,19455,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.25502,"Nurse Judith - On Waypoint 7 Reached - Set Orientation 4.25502"),
(@ENTRY,0,7,8,40,0,100,0,9,19455,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Waypoint 9 Reached - Run Script"),
(@ENTRY,0,8,0,61,0,100,0,9,19455,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.969,"Nurse Judith - On Waypoint 9 Reached - Set Orientation 2.969"),
(@ENTRY,0,9,10,40,0,100,0,12,19455,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Waypoint 12 Reached - Run Script"),
(@ENTRY,0,10,0,61,0,100,0,12,19455,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.17224,"Nurse Judith - On Waypoint 12 Reached - Set Orientation 4.17224"),
(@ENTRY,0,11,12,40,0,100,0,15,19455,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Waypoint 15 Reached - Run Script"),
(@ENTRY,0,12,0,61,0,100,0,15,19455,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.1529,"Nurse Judith - On Waypoint 15 Reached - Set Orientation 2.41624");

-- Actionlist SAI
SET @ENTRY := 1945500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Script - Set Flag Standstate Kneel"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nurse Judith - On Script - Remove Flag Standstate Kneel");

DELETE FROM `waypoints` WHERE `entry`=19455;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(19455, 1, -365.789, 981.419,   54.195, 'Nurse Judith'),
(19455, 2, -368.858, 982.56,   54.1727, 'Nurse Judith'),
(19455, 3, -363.252, 980.47,   54.2127, 'Nurse Judith'),
(19455, 4, -357.494, 978.322,  54.2425, 'Nurse Judith'),
(19455, 5, -358.948, 975.922,  54.243,  'Nurse Judith'),
(19455, 6, -357.512, 973.939,  54.2493, 'Nurse Judith'),
(19455, 7, -360.045, 968.102,  54.2344, 'Nurse Judith'),
(19455, 8, -358.571, 965.26,   54.2447, 'Nurse Judith'),
(19455, 9, -362.99, 962.005,   54.2135, 'Nurse Judith'),
(19455, 10, -352.415, 973.809, 54.2617, 'Nurse Judith'),
(19455, 11, -349.296, 971.591, 54.2724, 'Nurse Judith'),
(19455, 12, -349.964, 970.224, 54.2733, 'Nurse Judith'),
(19455, 13, -350.597, 974.797, 54.2635, 'Nurse Judith'),
(19455, 14, -362.665, 981.665, 54.2171, 'Nurse Judith'),
(19455, 15, -364.29, 984.89,   54.2066, 'Nurse Judith');-- ('1485433257771075000');
-- Eye of Naxxramas -- http://www.wowhead.com/npc=10411
SET @GUID := 73922; -- 3 creatures needed CONSECUTIVE
DELETE FROM `creature` WHERE `guid` BETWEEN (@GUID + 0) AND (@GUID + 2);
DELETE FROM `creature` WHERE `id`=10411;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
((@GUID + 0), 10411, 329, 4629, 0, 3479.085, -3306.330, 130.6843, 0.104871, 900, 0, 0, 0, 0, 2),
((@GUID + 1), 10411, 329, 4629, 0, 3582.750, -3465.926, 135.4136, 5.451532, 900, 0, 0, 0, 0, 2),
((@GUID + 2), 10411, 329, 4629, 0, 4068.063, -3534.750, 122.7475, 2.599249, 900, 0, 0, 0, 0, 2);

-- --------Pathing------------------------
SET @NPC := (@GUID + 0);
SET @PATH := @NPC * 10;
SET @POINT := 0;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, @POINT := @POINT + 1, 3496.611, -3304.485, 130.2477),
(@PATH, @POINT := @POINT + 1, 3501.017, -3320.939, 130.1988),
(@PATH, @POINT := @POINT + 1, 3516.886, -3321.310, 131.3028),
(@PATH, @POINT := @POINT + 1, 3533.510, -3325.740, 129.8950),
(@PATH, @POINT := @POINT + 1, 3563.853, -3333.576, 129.3590),
(@PATH, @POINT := @POINT + 1, 3587.316, -3335.419, 127.2169),
(@PATH, @POINT := @POINT + 1, 3555.287, -3343.082, 129.2272),
(@PATH, @POINT := @POINT + 1, 3541.950, -3368.319, 132.0300),
(@PATH, @POINT := @POINT + 1, 3539.138, -3390.615, 132.3763),
(@PATH, @POINT := @POINT + 1, 3546.026, -3421.109, 135.2656),
(@PATH, @POINT := @POINT + 1, 3528.616, -3392.653, 132.3763),
(@PATH, @POINT := @POINT + 1, 3519.140, -3387.130, 132.4560),
(@PATH, @POINT := @POINT + 1, 3493.885, -3381.469, 135.2286),
(@PATH, @POINT := @POINT + 1, 3456.239, -3378.636, 139.5714),
(@PATH, @POINT := @POINT + 1, 3419.620, -3378.933, 141.8746),
(@PATH, @POINT := @POINT + 1, 3456.239, -3378.636, 139.5714),
(@PATH, @POINT := @POINT + 1, 3493.732, -3381.419, 135.2316),
(@PATH, @POINT := @POINT + 1, 3519.140, -3387.130, 132.4560),
(@PATH, @POINT := @POINT + 1, 3528.616, -3392.653, 132.3763),
(@PATH, @POINT := @POINT + 1, 3546.026, -3421.109, 135.2656),
(@PATH, @POINT := @POINT + 1, 3539.138, -3390.615, 132.3763),
(@PATH, @POINT := @POINT + 1, 3541.950, -3368.319, 132.0300),
(@PATH, @POINT := @POINT + 1, 3555.287, -3343.082, 129.2272),
(@PATH, @POINT := @POINT + 1, 3587.316, -3335.419, 127.2169),
(@PATH, @POINT := @POINT + 1, 3563.853, -3333.576, 129.3590),
(@PATH, @POINT := @POINT + 1, 3533.510, -3325.740, 129.8950),
(@PATH, @POINT := @POINT + 1, 3516.886, -3321.310, 131.3028),
(@PATH, @POINT := @POINT + 1, 3501.017, -3320.939, 130.1988),
(@PATH, @POINT := @POINT + 1, 3496.611, -3304.485, 130.2477),
(@PATH, @POINT := @POINT + 1, 3480.393, -3307.106, 130.4128);

SET @NPC := (@GUID + 1);
SET @PATH := @NPC * 10;
SET @POINT := 0;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, @POINT := @POINT + 1, 3602.921, -3488.057, 135.8794),
(@PATH, @POINT := @POINT + 1, 3623.550, -3513.888, 136.9184),
(@PATH, @POINT := @POINT + 1, 3648.388, -3518.862, 136.6696),
(@PATH, @POINT := @POINT + 1, 3665.853, -3494.050, 136.3362),
(@PATH, @POINT := @POINT + 1, 3629.388, -3487.229, 137.5149),
(@PATH, @POINT := @POINT + 1, 3673.813, -3485.689, 135.8256),
(@PATH, @POINT := @POINT + 1, 3713.954, -3482.851, 129.7010),
(@PATH, @POINT := @POINT + 1, 3718.166, -3448.076, 129.3145),
(@PATH, @POINT := @POINT + 1, 3705.293, -3411.265, 132.1460),
(@PATH, @POINT := @POINT + 1, 3685.754, -3379.769, 129.8789),
(@PATH, @POINT := @POINT + 1, 3669.716, -3350.548, 125.2413),
(@PATH, @POINT := @POINT + 1, 3651.337, -3332.349, 123.5366),
(@PATH, @POINT := @POINT + 1, 3673.492, -3309.539, 126.4855),
(@PATH, @POINT := @POINT + 1, 3686.000, -3286.630, 128.0600),
(@PATH, @POINT := @POINT + 1, 3694.174, -3269.902, 127.8214),
(@PATH, @POINT := @POINT + 1, 3705.277, -3253.183, 127.0408),
(@PATH, @POINT := @POINT + 1, 3729.962, -3259.325, 127.9591),
(@PATH, @POINT := @POINT + 1, 3705.277, -3253.183, 127.0408),
(@PATH, @POINT := @POINT + 1, 3694.174, -3269.902, 127.8214),
(@PATH, @POINT := @POINT + 1, 3686.000, -3286.630, 128.0600),
(@PATH, @POINT := @POINT + 1, 3673.492, -3309.539, 126.4855),
(@PATH, @POINT := @POINT + 1, 3651.337, -3332.349, 123.5366),
(@PATH, @POINT := @POINT + 1, 3669.716, -3350.548, 125.2413),
(@PATH, @POINT := @POINT + 1, 3685.754, -3379.769, 129.8789),
(@PATH, @POINT := @POINT + 1, 3705.293, -3411.265, 132.1460),
(@PATH, @POINT := @POINT + 1, 3718.171, -3447.861, 129.3067),
(@PATH, @POINT := @POINT + 1, 3713.954, -3482.851, 129.7010),
(@PATH, @POINT := @POINT + 1, 3673.813, -3485.689, 135.8256),
(@PATH, @POINT := @POINT + 1, 3629.388, -3487.229, 137.5149),
(@PATH, @POINT := @POINT + 1, 3665.853, -3494.050, 136.3362),
(@PATH, @POINT := @POINT + 1, 3648.388, -3518.862, 136.6696),
(@PATH, @POINT := @POINT + 1, 3623.550, -3513.888, 136.9184),
(@PATH, @POINT := @POINT + 1, 3602.921, -3488.057, 135.8794),
(@PATH, @POINT := @POINT + 1, 3578.609, -3461.189, 135.2853);

SET @NPC := (@GUID + 2);
SET @POINT := 0;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, @POINT := @POINT + 1, 4044.845, -3520.759, 121.6993),
(@PATH, @POINT := @POINT + 1, 4021.720, -3529.522, 122.2696),
(@PATH, @POINT := @POINT + 1, 3997.682, -3556.203, 124.7969),
(@PATH, @POINT := @POINT + 1, 3955.195, -3556.644, 129.8793),
(@PATH, @POINT := @POINT + 1, 3979.817, -3586.936, 127.6629),
(@PATH, @POINT := @POINT + 1, 3999.419, -3604.702, 129.5177),
(@PATH, @POINT := @POINT + 1, 4008.615, -3629.069, 129.3868),
(@PATH, @POINT := @POINT + 1, 3986.416, -3626.187, 130.1212),
(@PATH, @POINT := @POINT + 1, 3963.268, -3642.394, 133.2446),
(@PATH, @POINT := @POINT + 1, 3945.813, -3645.609, 137.4449),
(@PATH, @POINT := @POINT + 1, 3935.039, -3652.638, 139.9641),
(@PATH, @POINT := @POINT + 1, 3905.511, -3672.499, 139.0567),
(@PATH, @POINT := @POINT + 1, 3880.139, -3682.546, 142.2288),
(@PATH, @POINT := @POINT + 1, 3871.972, -3695.018, 142.4928),
(@PATH, @POINT := @POINT + 1, 3860.894, -3677.064, 143.4627),
(@PATH, @POINT := @POINT + 1, 3843.936, -3691.934, 142.8869),
(@PATH, @POINT := @POINT + 1, 3846.652, -3671.873, 144.1723),
(@PATH, @POINT := @POINT + 1, 3834.103, -3652.026, 145.6312),
(@PATH, @POINT := @POINT + 1, 3822.230, -3633.550, 146.1223),
(@PATH, @POINT := @POINT + 1, 3795.741, -3609.456, 145.2505),
(@PATH, @POINT := @POINT + 1, 3823.748, -3625.020, 145.5289),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3887.829, -3545.449, 137.7642),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3823.748, -3625.020, 145.5289),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3887.829, -3545.449, 137.7642),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3823.748, -3625.020, 145.5289),
(@PATH, @POINT := @POINT + 1, 3795.741, -3609.456, 145.2505),
(@PATH, @POINT := @POINT + 1, 3822.230, -3633.550, 146.1223),
(@PATH, @POINT := @POINT + 1, 3834.079, -3651.989, 145.6344),
(@PATH, @POINT := @POINT + 1, 3846.652, -3671.873, 144.1723),
(@PATH, @POINT := @POINT + 1, 3843.936, -3691.934, 142.8869),
(@PATH, @POINT := @POINT + 1, 3860.894, -3677.064, 143.4627),
(@PATH, @POINT := @POINT + 1, 3871.972, -3695.018, 142.4928),
(@PATH, @POINT := @POINT + 1, 3880.139, -3682.546, 142.2288),
(@PATH, @POINT := @POINT + 1, 3905.511, -3672.499, 139.0567),
(@PATH, @POINT := @POINT + 1, 3935.039, -3652.638, 139.9641),
(@PATH, @POINT := @POINT + 1, 3945.559, -3645.736, 137.5213),
(@PATH, @POINT := @POINT + 1, 3963.268, -3642.394, 133.2446),
(@PATH, @POINT := @POINT + 1, 3986.416, -3626.187, 130.1212),
(@PATH, @POINT := @POINT + 1, 4008.615, -3629.069, 129.3868),
(@PATH, @POINT := @POINT + 1, 3999.419, -3604.702, 129.5177),
(@PATH, @POINT := @POINT + 1, 3979.817, -3586.936, 127.6629),
(@PATH, @POINT := @POINT + 1, 3955.195, -3556.644, 129.8793),
(@PATH, @POINT := @POINT + 1, 3997.682, -3556.203, 124.7969),
(@PATH, @POINT := @POINT + 1, 4021.720, -3529.522, 122.2696),
(@PATH, @POINT := @POINT + 1, 4044.845, -3520.759, 121.6993),
(@PATH, @POINT := @POINT + 1, 4067.240, -3534.060, 122.5621);-- ('1485433317271478300');
-- Durkot Wolfbrother -- http://wotlk.openwow.com/npc=26044
SET @MAXGUID := 911; 
SET @SCRIPTID := 12556600;
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 2, 15, 68442, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 10, 1, 1, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 18, 14, 68442, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 125566;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `orientation`) VALUES
(@PATH, 1, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 2, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 3, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 4, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 5, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 6, 2791.75, 6244.01, 84.6092, 22000, @SCRIPTID, 0.717889),
(@PATH, 7, 2786.42, 6245.35, 84.3805, 0, 0, 2.43222),
(@PATH, 8, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 9, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 10, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 11, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 12, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 13, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 14, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 15, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 16, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 17, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 18, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 19, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 20, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 21, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 22, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 23, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 24, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 25, 2775.46, 6252.13, 83.9431, 22000, @SCRIPTID, 3.87735),
(@PATH, 26, 2780.02, 6251.43, 84.0246, 0, 0, 5.66806),
(@PATH, 27, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 28, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 29, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 30, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 31, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 32, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 33, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 34, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 35, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 36, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 37, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 38, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 39, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 40, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 41, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 42, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 43, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 44, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 45, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 46, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);-- ('1485433480867835400');
DELETE FROM `spell_area` WHERE `quest_start` IN (13861, 13862, 13863, 13864) AND `area`=4522;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(64576, 4522, 13864, 13864, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13861, 13861, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13862, 13862, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13863, 13863, 0, 0, 2, 1, 74, 11);-- ('1485433649970507600');
-- At The Enemy's Gates - Phasing for Icecrown -- http://www.wowhead.com/quest=13847/at-the-enemys-gates
DELETE FROM `spell_area` WHERE `quest_start` IN (13847, 13851, 13852, 13854, 13855, 13856, 13857, 13858, 13859, 13860) AND `area`=4522;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(64576, 4522, 13847, 13847, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13851, 13851, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13852, 13852, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13854, 13854, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13855, 13855, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13856, 13856, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13857, 13857, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13858, 13858, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13859, 13859, 0, 0, 2, 1, 74, 11),
(64576, 4522, 13860, 13860, 0, 0, 2, 1, 74, 11);-- ('1485433783048119200');
DELETE FROM `creature_Loot_template` WHERE `item` = 23612 AND `entry` IN (21060,21061);-- ('1485433910197391700');
-- ======================================
-- All Bosses Are Immune To Crowd Control -- Daze, Horror, Shackle, Banish, Polymorph, Knockout, Freeze, Stun, Snare, Sleep, Silence, Pacify, Root, Fear, Distract, Disarm, Confused, Charm
-- ======================================
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|76234719 WHERE `entry` IN (647,645,639,626,1763,646,644,643,642);
-- Group 1 Pathing 
UPDATE `creature` SET `position_x` = -169.588608, `position_y` = -402.076477, `position_z` = 57.082920, `orientation` = 0.354403 WHERE `guid` = 79374;

UPDATE `creature_addon` SET `path_id`=0 WHERE  `guid`=79374;
DELETE FROM `waypoint_data` WHERE `id` IN (793740);

UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 0 WHERE `guid` IN (79374);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 2 WHERE `guid` IN (79373);
DELETE FROM `creature_formations` WHERE `leaderGUID`=79373;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79373, 79373, 0, 0, 2, 0, 0), -- Defias Evoker linked to Defias Overseer
(79373, 79374, 2, 0, 2, 0, 0); -- Defias Evoker linked to Defias Overseer

-- RhahkZor Pathing
SET @NPC := 79168;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -193.304, -440.544, 53.5319, 0),
(@PATH, 2, -192.834, -435.956, 53.2713, 15000),
(@PATH, 3, -193.565, -441.151, 53.568, 0),
(@PATH, 4, -191.926, -453.598, 54.4336, 0),
(@PATH, 5, -192.789, -447.285, 54.3726, 40000);

-- Remove Random Movement of 2 Miners
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 0 WHERE `guid` IN (79172,79180,79182,79184);

-- Fix an Defias Overseer Pathing (Removed bad waypoint)
SET @NPC := 79273;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -181.386, -491.686, 54.0401, 0),
(@PATH, 2, -180.97, -498.254, 53.4632, 0),
(@PATH, 3, -183.791, -502.539, 53.3808, 0),
(@PATH, 4, -193.579, -506.077, 53.1769, 0),
(@PATH, 5, -193.943, -496.426, 53.2004, 0),
(@PATH, 6, -192.601, -488.515, 54.0488, 0),
(@PATH, 7, -187.413, -492.182, 53.5523, 0);

-- Add Random NPC Movement to Defias Evoker
UPDATE `creature` SET `SpawnDist` = 5, `MovementType` = 1 WHERE `guid` IN (79177);

-- Group 2 Pathing 
UPDATE `creature` SET `position_x` = -206.025070, `position_y` = -505.739960, `position_z` = 51.897705, `orientation` = 3.121361 WHERE `guid` = 79245;
UPDATE `creature_addon` SET `path_id`=0 WHERE  `guid`=79245;
DELETE FROM `waypoint_data` WHERE `id` IN (792450);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 0 WHERE `guid` IN (79245);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 2 WHERE `guid` IN (79244);
DELETE FROM `creature_formations` WHERE `leaderGUID`=79244;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79244, 79244, 0, 0, 2, 0, 0), -- Defias Evoker linked to Defias Overseer
(79244, 79245, 2, 0, 2, 0, 0); -- Defias Evoker linked to Defias Overseer

-- Fix Gilnid Movement
UPDATE `creature` SET `SpawnDist` = 5, `MovementType` = 1 WHERE `guid` IN (79206);
-- Group 3 Pathing
UPDATE `creature_addon` SET `path_id`=0 WHERE  `guid`=79229;
DELETE FROM `waypoint_data` WHERE `id` IN (792290);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 0 WHERE `guid` IN (79229);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 2 WHERE `guid` IN (79230);
DELETE FROM `creature_formations` WHERE `leaderGUID`=79230;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79230, 79230, 0, 0, 2, 0, 0), -- Defias Wizard linked to Defias Taskmaster
(79230, 79229, 2, 0, 2, 0, 0); -- Defias Wizard linked to Defias Taskmaster

-- Fix NPC Z Problem
UPDATE `creature` SET `position_z` = 28.4 WHERE `guid` IN (79242);
-- Fix NPC Placement
UPDATE `creature` SET `position_x` = -209.043808, `position_y` = -590.668701, `position_z` = 20.976866, `orientation` = 2.302266 WHERE `guid` = 79212;
UPDATE `creature` SET `position_x` = -196.753937, `position_y` = -582.341492, `position_z` = 20.976866, `orientation` = 1.217631 WHERE `guid` = 79209;

-- Group  Pathing 
UPDATE `creature` SET `position_x` = -112.329689, `position_y` = -645.826172, `position_z` = 8.976121, `orientation` = 5.168961 WHERE `guid` = 79260;
UPDATE `creature_addon` SET `path_id`=0 WHERE  `guid`=79260;
DELETE FROM `waypoint_data` WHERE `id` IN (792600);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 0 WHERE `guid` IN (79260);
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 2 WHERE `guid` IN (79361);

DELETE FROM `creature_formations` WHERE `leaderGUID`=79361;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79361, 79361, 0, 0, 2, 0, 0), -- Defias Wizard linked to Defias Overseer
(79361, 79260, 2, 0, 2, 0, 0); -- Defias Wizard linked to Defias Overseer

-- Delete Humans in Foundry (source: https://youtu.be/Jm_5e3UEPq4?t=133 )
DELETE FROM `creature` WHERE `guid` IN (79285,79283,79284,79380,79378,79379);
DELETE FROM `creature_addon` WHERE `guid` IN (79285,79283,79284,79380,79378,79379);
DELETE FROM `waypoint_data` WHERE `id` IN (792850,792830,792840,793800,793780,793790);

-- Fix NPC Random Movement
UPDATE `creature` SET `SpawnDist` = 5, `MovementType` = 1 WHERE `guid` IN (79296);

-- Linked Aggro Between Mr. Smite and 2 Defias Blackguards
DELETE FROM `creature_formations` WHERE `leaderGUID`=79337;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79337, 79337, 0, 0, 2, 0, 0),
(79337, 79345, 0, 0, 2, 0, 0),
(79337, 79346, 0, 0, 2, 0, 0);

-- Linked Aggro Between Defias Pirate and Defias Squallshaper Behind Mr. Smite
DELETE FROM `creature_formations` WHERE `leaderGUID`=79338;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79338, 79338, 0, 0, 2, 0, 0),
(79338, 79330, 0, 0, 2, 0, 0);

-- MOVE NPC BACK SO THEY DO NOT PULL
UPDATE `creature` SET `position_x` = -22.056364, `position_y` = -809.104553, `position_z` = 19.543686, `orientation` = 1.330994 WHERE `guid` = 79338;
UPDATE `creature` SET `position_x` = -34.434910, `position_y` = -796.904114, `position_z` = 18.909523, `orientation` = 6.229524 WHERE `guid` = 79330;

-- Fix NPC Random Movement of Pirates on the Ship
UPDATE `creature` SET `SpawnDist`=3, `MovementType`=1 WHERE `guid` IN (79323,79325,79305,79327);

-- Remove 2 Defias Blackguards On Deck (They Do Not Exist As Per Videos)
DELETE FROM `creature` WHERE `guid` IN (79368,79383);

-- Linked Aggro Between VanCleef and 2 Defias Blackguard Adds
DELETE FROM `creature_formations` WHERE `leaderGUID`=79336;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(79336, 79336, 0, 0, 2, 0, 0),
(79336, 79369, 0, 0, 2, 0, 0), -- Defias Blackguard
(79336, 79370, 0, 0, 2, 0, 0); -- Defias Blackguard

-- VanCleef Adds (Should Not Random Move)
UPDATE `creature` SET `SpawnDist` = 0, `MovementType` = 0 WHERE `guid` IN (79369,79370);-- ('1485434129254921100');
-- ========================================
-- Caverns of Time: Old Hillsbrad Foothills
-- ========================================

-- ========================================================
-- All Bosses and Heroic Bosses Are Immune To Crowd Control -- Daze, Horror, Shackle, Banish, Polymorph, Knockout, Freeze, Stun, Snare, Sleep, Silence, Pacify, Root, Fear, Distract, Disarm, Confused, Charm
-- ========================================================
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|16384 WHERE `entry` IN (17848,20535,17862,20521,18096,20531);
-- =========================================
-- REMOVE NPC SPAWNS (WILL REUSE GUID)
-- =========================================
-- Removed Spawns - Reuse GUID
DELETE FROM `creature` WHERE `guid` IN (83932,83972,84001);
DELETE FROM `creature_addon` WHERE `guid` IN (83932,83972,84001);
-- =========================================
-- Dungeon Aggro Linking and Missing Pathing
-- =========================================
-- First Sentry
UPDATE `creature` SET `position_x` = 2076.810547, `position_y` = 221.063431, `position_z` = 64.874046, `orientation` = 2.525145 WHERE `guid` = 83909;

-- Group Inside Left Side
UPDATE `creature` SET `position_x` = 2120.338867, `position_y` = 218.720917, `position_z` = 64.943527, `orientation` = 1.668277 WHERE `guid` = 83904;
UPDATE `creature` SET `position_x` = 2119.321777, `position_y` = 223.663712, `position_z` = 64.875153, `orientation` = 4.992080 WHERE `guid` = 83903;

DELETE FROM `creature_formations` WHERE `leaderGUID`=83904;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83904, 83904, 0, 0, 2, 0, 0),
(83904, 83903, 0, 0, 2, 0, 0);

-- Patrol Left Side
DELETE FROM `creature_formations` WHERE `leaderGUID`=83910;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83910, 83910, 0, 0, 2, 0, 0),
(83910, 83911, 3, 0, 2, 0, 0);

SET @NPC := 83910;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2125.69, 244.969, 64.8252, 0),
(@PATH, 2, 2131.14, 252.046, 64.6015, 0),
(@PATH, 3, 2139.33, 256.24, 64.7451, 0),
(@PATH, 4, 2150.85, 267.235, 64.6691, 0),
(@PATH, 5, 2155.83, 274.518, 64.5514, 0),
(@PATH, 6, 2163.31, 279.487, 64.169, 0),
(@PATH, 7, 2175.15, 282.002, 64.6837, 0),
(@PATH, 8, 2163.53, 279.529, 64.0731, 0),
(@PATH, 9, 2155.76, 274, 64.4975, 0),
(@PATH, 10, 2150.68, 266.361, 64.7104, 0),
(@PATH, 11, 2139.27, 255.903, 64.7643, 0),
(@PATH, 12, 2131.48, 252.035, 64.5098, 0),
(@PATH, 13, 2125.25, 244.493, 64.8279, 0),
(@PATH, 14, 2119.97, 233.879, 64.8725, 0),
(@PATH, 15, 2112.98, 230.424, 65.0613, 0),
(@PATH, 16, 2106.37, 226.722, 65.8853, 0),
(@PATH, 17, 2120.01, 233.507, 64.8737, 0);

-- 2 Guards on Bridge
DELETE FROM `creature_formations` WHERE `leaderGUID`=83901;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83901, 83901, 0, 0, 2, 0, 0),
(83901, 83902, 0, 0, 2, 0, 0);

-- 2 Guards on Bridge
DELETE FROM `creature_formations` WHERE `leaderGUID`=83912;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83912, 83912, 0, 0, 2, 0, 0),
(83912, 83913, 0, 0, 2, 0, 0);

-- NPC Pathing Over Bridge Up Hill
DELETE FROM `creature_formations` WHERE `leaderGUID`=83907;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83907, 83907, 0, 0, 2, 0, 0),
(83907, 83906, 3, 0, 2, 0, 0);

SET @NPC := 83907;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2133.25, 175.897, 68.2518, 0),
(@PATH, 2, 2142.45, 168.965, 66.2217, 0),
(@PATH, 3, 2143.95, 162.492, 65.283, 0),
(@PATH, 4, 2139.32, 154.392, 67.4044, 0),
(@PATH, 5, 2138.23, 143.395, 70.7358, 0),
(@PATH, 6, 2139.97, 132.573, 74.0745, 0),
(@PATH, 7, 2142.59, 126.72, 75.6225, 0),
(@PATH, 8, 2146.19, 125.347, 76.3226, 0),
(@PATH, 9, 2153.81, 128.848, 79.1896, 0),
(@PATH, 10, 2161.36, 135.221, 83.6257, 0),
(@PATH, 11, 2169.32, 144.168, 87.0686, 0),
(@PATH, 12, 2176.57, 157.486, 87.5667, 0),
(@PATH, 13, 2182.25, 166.023, 88.0925, 0),
(@PATH, 14, 2190.15, 171.974, 88.9953, 0),
(@PATH, 15, 2198.18, 175.07, 90.0099, 0),
(@PATH, 16, 2211.11, 177.332, 93.1255, 0),
(@PATH, 17, 2218.76, 179.856, 96.8824, 0),
(@PATH, 18, 2211.71, 177.317, 93.3128, 0),
(@PATH, 19, 2198.41, 175.057, 90.0273, 0),
(@PATH, 20, 2190.48, 171.961, 89.0125, 0),
(@PATH, 21, 2182.36, 165.732, 88.0739, 0),
(@PATH, 22, 2176.82, 157.265, 87.5719, 0),
(@PATH, 23, 2169.84, 144.243, 87.1995, 0),
(@PATH, 24, 2161.79, 135.187, 83.7742, 0),
(@PATH, 25, 2153.85, 128.339, 79.1086, 0),
(@PATH, 26, 2146.26, 125.303, 76.3378, 0),
(@PATH, 27, 2142.64, 126.864, 75.6126, 0),
(@PATH, 28, 2139.95, 133.04, 73.9752, 0),
(@PATH, 29, 2138.51, 143.182, 70.7858, 0),
(@PATH, 30, 2139.87, 154.51, 67.3187, 0),
(@PATH, 31, 2144.53, 162.434, 65.2721, 0),
(@PATH, 32, 2142.94, 168.955, 66.2216, 0),
(@PATH, 33, 2133.65, 175.448, 68.0162, 0),
(@PATH, 34, 2121.96, 184.319, 69.1957, 0),
(@PATH, 35, 2111.52, 191.525, 66.2216, 0),
(@PATH, 36, 2105.32, 194.886, 65.1854, 0),
(@PATH, 37, 2097.08, 196.945, 65.2138, 0),
(@PATH, 38, 2087.51, 206.91, 64.8803, 0),
(@PATH, 39, 2073.1, 218.576, 64.8744, 0),
(@PATH, 40, 2087.7, 206.877, 64.8792, 0),
(@PATH, 41, 2097.34, 196.53, 65.2196, 0),
(@PATH, 42, 2106.11, 194.526, 65.4583, 0),
(@PATH, 43, 2111.96, 191.221, 66.2215, 0),
(@PATH, 44, 2119.36, 186.393, 68.9396, 0);

-- Spectator Pit
UPDATE `creature` SET `position_x` = 2175.081055, `position_y` = 53.507755, `position_z` = 66.141853, `orientation` = 4.365011 WHERE `guid` = 83979;
UPDATE `creature` SET `position_x` = 2179.469482, `position_y` = 52.001755, `position_z` = 66.185760, `orientation` = 4.242488 WHERE `guid` = 83978;
UPDATE `creature` SET `position_x` = 2184.879639, `position_y` = 50.181683, `position_z` = 66.242325, `orientation` = 4.201647 WHERE `guid` = 83981;
UPDATE `creature` SET `position_x` = 2192.822998, `position_y` = 12.869001, `position_z` = 66.117027, `orientation` = 2.702322 WHERE `guid` = 83983;
UPDATE `creature` SET `position_x` = 2175.076904, `position_y` = 1.1307310, `position_z` = 66.122726, `orientation` = 1.262686 WHERE `guid` = 83984;
UPDATE `creature` SET `position_x` = 2171.402344, `position_y` = 5.1749520, `position_z` = 64.843498, `orientation` = 1.235983 WHERE `guid` = 83985;

-- Rifleman Pathing In First Pit
DELETE FROM `creature_formations` WHERE `leaderGUID`=83930;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83930, 83930, 0, 0, 2, 0, 0),
(83930, 83931, 3, 0, 2, 0, 0);

SET @NPC := 83930;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2097.15, 78.6796, 53.0115, 0),
(@PATH, 2, 2084, 97.0058, 53.0813, 0),
(@PATH, 3, 2085.25, 114.295, 52.441, 0),
(@PATH, 4, 2095.02, 133.882, 52.9715, 0),
(@PATH, 5, 2093.37, 143.542, 52.4456, 0),
(@PATH, 6, 2086.79, 145.567, 52.562, 0),
(@PATH, 7, 2078.89, 146.163, 52.8694, 0),
(@PATH, 8, 2070.16, 149.051, 55.0808, 0),
(@PATH, 9, 2063.53, 144.524, 54.8516, 0),
(@PATH, 10, 2056.3, 129.417, 54.886, 0),
(@PATH, 11, 2051.2, 117.43, 55.0246, 0),
(@PATH, 12, 2048.74, 106.082, 53.8027, 0),
(@PATH, 13, 2048.45, 90.0419, 53.1851, 0),
(@PATH, 14, 2050.02, 77.0256, 52.9052, 0),
(@PATH, 15, 2054.85, 66.9206, 52.6482, 0),
(@PATH, 16, 2061.25, 59.5255, 53.1247, 0),
(@PATH, 17, 2069.13, 53.5553, 53.9244, 0),
(@PATH, 18, 2080.77, 46.2151, 54.041, 0),
(@PATH, 19, 2092.03, 40.4852, 52.8246, 0),
(@PATH, 20, 2105.15, 34.4171, 52.6789, 0),
(@PATH, 21, 2114.6, 29.6927, 53.7685, 0),
(@PATH, 22, 2123.67, 31.693, 52.861, 0),
(@PATH, 23, 2132.42, 42.8707, 52.6342, 0),
(@PATH, 24, 2131.65, 53.1806, 52.441, 0),
(@PATH, 25, 2120.27, 60.1946, 52.4814, 0),
(@PATH, 26, 2112.77, 67.7052, 52.5274, 0);

SET @NPC := 83934;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2068.01, 74.9858, 53.7438, 0),
(@PATH, 2, 2064.53, 81.5845, 54.0444, 0),
(@PATH, 3, 2061.73, 86.8158, 54.1236, 0),
(@PATH, 4, 2059.31, 88.1866, 54.1046, 0),
(@PATH, 5, 2055.28, 86.614, 54.1177, 0),
(@PATH, 6, 2065.6, 90.6067, 54.099, 0),
(@PATH, 7, 2067.63, 84.4378, 54.0945, 0),
(@PATH, 8, 2065.46, 78.7869, 53.9266, 0),
(@PATH, 9, 2069.08, 72.6753, 53.646, 0),
(@PATH, 10, 2071.68, 67.8529, 53.761, 0),
(@PATH, 11, 2075.62, 68.0539, 53.7892, 0),
(@PATH, 12, 2081.12, 70.4489, 53.7591, 0),
(@PATH, 13, 2076.01, 68.0177, 53.7933, 0),
(@PATH, 14, 2072.07, 67.7785, 53.767, 0);

-- Third Hut Guards
UPDATE `creature` SET `position_x` = 2066.639893, `position_y` = 142.899033, `position_z` = 53.258968, `orientation` = 2.797679 WHERE `guid` = 83924;
UPDATE `creature` SET `position_x` = 2072.268311, `position_y` = 105.922432, `position_z` = 53.294781, `orientation` = 5.891366 WHERE `guid` = 83922;

-- Guards Under The Bridge
UPDATE `creature` SET `position_x` = 2126.438477, `position_y` = 175.292297, `position_z` = 53.516026, `orientation` = 1.561665 WHERE `guid` = 83945;
UPDATE `creature` SET `position_x` = 2129.196533, `position_y` = 177.595200, `position_z` = 54.084316, `orientation` = 3.192937 WHERE `guid` = 83944;
UPDATE `creature` SET `position_x` = 2121.649658, `position_y` = 179.502533, `position_z` = 53.181751, `orientation` = 0.586199 WHERE `guid` = 83942;
UPDATE `creature` SET `position_x` = 2124.063232, `position_y` = 183.331512, `position_z` = 52.779934, `orientation` = 4.016817 WHERE `guid` = 83943;

DELETE FROM `creature_formations` WHERE `leaderGUID`=83945;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83945, 83945, 0, 0, 2, 0, 0),
(83945, 83942, 0, 0, 2, 0, 0),
(83945, 83943, 0, 0, 2, 0, 0),
(83945, 83944, 0, 0, 2, 0, 0);

-- Pathing Sentry in Orc Pit
DELETE FROM `creature_formations` WHERE `leaderGUID`=83950;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83950, 83950, 0, 0, 2, 0, 0),
(83950, 83951, 3, 0, 2, 0, 0);

SET @NPC := 83950;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2194.76, 228.093, 53.2216, 0),
(@PATH, 2, 2177.35, 222.908, 52.5617, 0),
(@PATH, 3, 2155.81, 211.125, 52.9491, 0),
(@PATH, 4, 2136.14, 190.397, 52.6035, 0),
(@PATH, 5, 2123.86, 177.449, 52.5751, 0),
(@PATH, 6, 2118.74, 164.827, 52.473, 0),
(@PATH, 7, 2111.26, 150.577, 52.441, 0),
(@PATH, 8, 2109.52, 133.664, 52.441, 0),
(@PATH, 9, 2112.11, 113.823, 52.5069, 0),
(@PATH, 10, 2116.1, 88.3774, 52.5566, 0),
(@PATH, 11, 2119.94, 64.779, 52.668, 0),
(@PATH, 12, 2126.07, 55.7297, 52.4422, 0),
(@PATH, 13, 2142.26, 44.6962, 52.5726, 0),
(@PATH, 14, 2126.15, 55.8954, 52.441, 0),
(@PATH, 15, 2119.89, 64.841, 52.6693, 0),
(@PATH, 16, 2119.19, 77.1831, 52.6315, 0),
(@PATH, 17, 2114.45, 101.229, 52.4411, 0),
(@PATH, 18, 2110.13, 129.652, 52.4412, 0),
(@PATH, 19, 2109.8, 142.596, 52.4415, 0),
(@PATH, 20, 2111.71, 151, 52.4422, 0),
(@PATH, 21, 2118.62, 163.934, 52.4958, 0),
(@PATH, 22, 2124.02, 177.071, 52.6379, 0),
(@PATH, 23, 2128.47, 184.045, 52.8829, 0),
(@PATH, 24, 2141.11, 193.758, 52.4788, 0),
(@PATH, 25, 2155.71, 210.856, 52.963, 0),
(@PATH, 26, 2166.12, 216.871, 52.784, 0);


-- Pathing Sentry in Orc Pit
DELETE FROM `creature_formations` WHERE `leaderGUID`=83962;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83962, 83962, 0, 0, 2, 0, 0),
(83962, 83963, 3, 0, 2, 0, 0);

SET @NPC := 83962;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2179.58, 272.553, 53.7907, 0),
(@PATH, 2, 2174.51, 273.75, 54.7804, 0),
(@PATH, 3, 2167.73, 270.116, 53.8525, 0),
(@PATH, 4, 2158.07, 262.467, 54.2476, 0),
(@PATH, 5, 2148.58, 254.01, 53.6444, 0),
(@PATH, 6, 2142.06, 248.19, 54.5281, 0),
(@PATH, 7, 2141.05, 241.971, 54.0081, 0),
(@PATH, 8, 2151.24, 228.01, 52.5662, 0),
(@PATH, 9, 2157.59, 225.422, 52.5796, 0),
(@PATH, 10, 2163.86, 228.987, 52.4411, 0),
(@PATH, 11, 2171.11, 238.58, 52.4803, 0),
(@PATH, 12, 2186.56, 250.708, 52.672, 0),
(@PATH, 13, 2195.97, 250.156, 52.441, 0),
(@PATH, 14, 2204.23, 245.158, 53.3357, 0),
(@PATH, 15, 2220.32, 235.855, 52.5448, 0),
(@PATH, 16, 2225.11, 237.303, 53.2101, 0),
(@PATH, 17, 2231.1, 247.145, 53.7591, 0),
(@PATH, 18, 2233.59, 253.688, 54.8861, 0),
(@PATH, 19, 2233.58, 256.145, 55.5751, 0),
(@PATH, 20, 2228.66, 260.389, 54.1031, 0),
(@PATH, 21, 2226.51, 259.921, 53.4273, 0),
(@PATH, 22, 2222.34, 253.34, 53.7322, 0),
(@PATH, 23, 2206.44, 263.036, 54.0515, 0),
(@PATH, 24, 2196.3, 260.947, 54.0427, 0),
(@PATH, 25, 2194.69, 256.858, 54.0644, 0),
(@PATH, 26, 2191.63, 251.755, 52.4522, 0),
(@PATH, 27, 2189.27, 255.95, 52.4471, 0),
(@PATH, 28, 2184.46, 262.837, 52.4412, 0),
(@PATH, 29, 2187.25, 272.681, 52.8813, 0);

-- Fifth Hut Guards
UPDATE `creature` SET `position_x` = 2224.243652, `position_y` = 261.026978, `position_z` = 52.870918, `orientation` = 1.083381 WHERE `guid` = 83956;
UPDATE `creature` SET `position_x` = 2228.397461, `position_y` = 258.271484, `position_z` = 53.144829, `orientation` = 1.235748 WHERE `guid` = 83955;

SET @NPC := 83958;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2202.6, 261.304, 54.0827, 0),
(@PATH, 2, 2210.13, 261.506, 53.8936, 0),
(@PATH, 3, 2222.63, 253.593, 53.7344, 0),
(@PATH, 4, 2226.35, 258.649, 53.6825, 0),
(@PATH, 5, 2222.54, 252.893, 53.7423, 0),
(@PATH, 6, 2215.13, 253.523, 53.6058, 0),
(@PATH, 7, 2203.69, 260.036, 54.0857, 0),
(@PATH, 8, 2196.83, 260.845, 54.0447, 0),
(@PATH, 9, 2194.18, 256.059, 54.0261, 0),
(@PATH, 10, 2196.6, 259.593, 54.0522, 0);

-- Group of 4 NPC at Top of Hill
DELETE FROM `creature_formations` WHERE `leaderGUID`=83966;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83966, 83966, 0, 0, 2, 0, 0),
(83966, 83967, 0, 0, 2, 0, 0),
(83966, 83968, 0, 0, 2, 0, 0),
(83966, 83969, 0, 0, 2, 0, 0);

-- Group of 4 NPC In Front of Castle
DELETE FROM `creature_formations` WHERE `leaderGUID`=83935;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83935, 83935, 0, 0, 2, 0, 0),
(83935, 83936, 0, 0, 2, 0, 0),
(83935, 83937, 0, 0, 2, 0, 0),
(83935, 83938, 0, 0, 2, 0, 0);

-- Sentry Pathing in Castle
DELETE FROM `creature_formations` WHERE `leaderGUID`=83940;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83940, 83940, 0, 0, 2, 0, 0),
(83940, 83941, 3, 0, 2, 0, 0);

SET @NPC := 83940;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2205.2, 105.548, 89.4549, 0),
(@PATH, 2, 2198.16, 109.399, 89.4549, 0),
(@PATH, 3, 2203.92, 119.75, 89.4549, 0),
(@PATH, 4, 2208.63, 128.602, 87.9559, 0),
(@PATH, 5, 2197.29, 135.558, 88.2163, 0),
(@PATH, 6, 2177.38, 147.178, 88.2163, 0),
(@PATH, 7, 2197.46, 135.325, 88.2164, 0),
(@PATH, 8, 2209.19, 128.465, 87.9552, 0),
(@PATH, 9, 2214.03, 138.222, 89.4554, 0),
(@PATH, 10, 2219.53, 148.379, 89.4554, 0),
(@PATH, 11, 2230.54, 142.295, 89.4554, 0),
(@PATH, 12, 2224.32, 132.35, 89.4554, 0),
(@PATH, 13, 2221.97, 128.721, 89.4554, 0),
(@PATH, 14, 2229.83, 124.014, 89.4554, 0),
(@PATH, 15, 2234.85, 117.573, 89.4554, 0),
(@PATH, 16, 2230.33, 109.712, 93.3835, 0),
(@PATH, 17, 2217.21, 116.93, 98.2768, 0),
(@PATH, 18, 2211.69, 106.844, 98.2768, 0),
(@PATH, 19, 2195.58, 116.127, 103.378, 0),
(@PATH, 20, 2204.6, 131.978, 103.378, 0),
(@PATH, 21, 2213.31, 147.498, 103.378, 0),
(@PATH, 22, 2229.43, 138.021, 98.2767, 0),
(@PATH, 23, 2217.65, 116.955, 98.2767, 0),
(@PATH, 24, 2230.53, 109.677, 93.3836, 0),
(@PATH, 25, 2234.87, 117.489, 89.455, 0),
(@PATH, 26, 2229.99, 124.125, 89.455, 0),
(@PATH, 27, 2222.32, 128.306, 89.455, 0),
(@PATH, 28, 2209.61, 106.255, 89.455, 0);

-- Guards Sleeping In Castle
UPDATE `creature` SET `position_x` = 2230.499756, `position_y` = 96.335007, `position_z` = 91.719383, `orientation` = 1.130164 WHERE `guid` = 83457;
UPDATE `creature` SET `position_x` = 2222.566895, `position_y` = 88.888351, `position_z` = 91.591484, `orientation` = 2.629882 WHERE `guid` = 83977;

DELETE FROM `creature_formations` WHERE `leaderGUID`=83457;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83457, 83457, 0, 0, 2, 0, 0),
(83457, 83977, 0, 0, 2, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (83457,83977);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83457,0,0,3,0,0, ''),
(83977,0,0,3,0,0, '');

-- NPC Upstairs in Castle
UPDATE `creature` SET `position_x` = 2207.863525, `position_y` = 125.211838, `position_z` = 103.378456, `orientation` = 1.097563 WHERE `guid` = 83976;
UPDATE `creature` SET `position_x` = 2209.415283, `position_y` = 126.366081, `position_z` = 103.378456, `orientation` = 4.006677 WHERE `guid` = 83975;

DELETE FROM `creature_formations` WHERE `leaderGUID`=83976;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83976, 83976, 0, 0, 2, 0, 0),
(83976, 83975, 0, 0, 2, 0, 0),
(83976, 83973, 0, 0, 2, 0, 0),
(83976, 83974, 0, 0, 2, 0, 0);

-- Group of 4 NPC Main Floor of Castle
UPDATE `creature` SET `position_x` = 2218.045166, `position_y` = 125.936539, `position_z` = 89.454872, `orientation` = 5.212229 WHERE `guid` = 83997;
UPDATE `creature` SET `position_x` = 2224.622559, `position_y` = 123.511497, `position_z` = 89.454872, `orientation` = 4.141731 WHERE `guid` = 83996;

-- Guards In Tower Near Castle
DELETE FROM `creature_formations` WHERE `leaderGUID`=42939;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(42939, 42939, 0, 0, 2, 0, 0),
(42939, 48019, 0, 0, 2, 0, 0),
(42939, 48020, 0, 0, 2, 0, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=41813;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(41813, 41813, 0, 0, 2, 0, 0),
(41813, 48017, 0, 0, 2, 0, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=48015;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(48015, 48015, 0, 0, 2, 0, 0),
(48015, 48016, 0, 0, 2, 0, 0);

-- ONLY USE THESE GUIDS PLEASE :) (already rechecked them on clean tc with free-guid-searcher, some spawns in the instance had to be removed and reinserted again)
-- the used guids are assigned to some waypoints later
DELETE FROM `creature` WHERE `guid` IN (83932, 83972, 83933, 77820, 77854, 83959, 77819, 83923, 77818, 83926, 77817, 77816, 83928, 83929, 6998, 77806);
DELETE FROM `creature_addon` WHERE `guid` IN (83932, 83972, 83933, 77820, 77854, 83959, 77819, 83923, 77818, 83926, 77817, 77816, 83928, 83929, 6998, 77806);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES 
(6998, 17819, 560, 3, 0, 0, 2257.46, 259.449, 65.0975, 1.53443, 86400, 0, 0, 17736, 0, 0),
(77806, 17819, 560, 3, 0, 0, 2256.79, 264.135, 64.8945, 4.74278, 86400, 0, 0, 17736, 0, 0),
(77816, 17819, 560, 3, 0, 0, 2090.35, 44.7203, 52.4421, 4.33673, 86400, 0, 0, 18345, 0, 0),
(77817, 17819, 560, 3, 0, 0, 2055.22, 83.8672, 52.4861, 3.67686, 86400, 0, 0, 18345, 0, 0),
(77818, 17820, 560, 3, 0, 0, 2068.6, 112.257, 54.68, 1.89859, 86400, 0, 0, 17736, 0, 0),
(77819, 17833, 560, 3, 0, 0, 2160.93, 236.505, 53.8958, 2.18764, 86400, 0, 0, 14674, 14665, 0),
(77820, 17820, 560, 3, 0, 0, 2191.83, 256.39, 52.4411, 4.17236, 86400, 0, 0, 18345, 0, 0),
(77854, 17833, 560, 3, 0, 0, 2195.78, 253.736, 52.441, 4.13466, 86400, 0, 0, 14674, 14665, 0),
(83923, 17833, 560, 3, 0, 0, 2074.58, 110.82, 53.3224, 5.9597, 86400, 0, 0, 14674, 14665, 0),
(83926, 17833, 560, 3, 0, 0, 2082.72, 73.9288, 52.442, 0.525837, 86400, 0, 0, 14674, 14665, 0),
(83928, 17820, 560, 3, 0, 0, 2117.43, 54.716, 52.5916, 1.17158, 86400, 0, 0, 17736, 0, 0),
(83929, 17833, 560, 3, 0, 0, 2122.75, 52.3503, 52.441, 1.11189, 86400, 0, 0, 14674, 14665, 0),
(83932, 18598, 560, 3, 0, 0, 2086.52, 95.0915, 52.9514, 5.15978, 86400, 10, 0, 5914, 0, 1),
(83933, 17860, 560, 3, 0, 0, 2217.04, 123.922, 89.4549, 0.339619, 86400, 0, 0, 18345, 0, 0),
(83959, 17819, 560, 3, 0, 0, 2170.79, 268.471, 52.9163, 2.42404, 86400, 0, 0, 17736, 0, 0),
(83972, 17815, 560, 3, 0, 0, 2321.19, 886.26, 92.7589, 5.98453, 86400, 0, 0, 17151, 0, 2);

DELETE FROM `creature_formations` WHERE `leaderGUID`=6998;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(6998, 6998, 0, 0, 2, 0, 0),
(6998, 77806, 0, 0, 2, 0, 0);

-- enable movement for these fuckers
-- Durnholde Rifleman SAI
SET @ENTRY := 17820;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,0,0,2300,5000,11,16100,64,0,0,0,0,2,0,0,0,0,0,0,0,"Durnholde Rifleman - In Combat CMC - Cast 'Shoot' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,4,0,0,2300,5000,11,22907,64,0,0,0,0,2,0,0,0,0,0,0,0,"Durnholde Rifleman - In Combat CMC - Cast 'Shoot' (Heroic Dungeon)"),
(@ENTRY,0,2,0,9,0,100,2,5,30,9000,15000,11,31942,1,0,0,0,0,2,0,0,0,0,0,0,0,"Durnholde Rifleman - Within 5-30 Range - Cast 'Multi-Shot' (Normal Dungeon)"),
(@ENTRY,0,3,0,9,0,100,4,5,30,9000,15000,11,38383,1,0,0,0,0,2,0,0,0,0,0,0,0,"Durnholde Rifleman - Within 5-30 Range - Cast 'Multi-Shot' (Heroic Dungeon)"),
(@ENTRY,0,4,0,2,0,100,7,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Durnholde Rifleman - Between 0-15% Health - Flee For Assist (No Repeat) (Dungeon)");

DELETE FROM `creature_formations` WHERE `leaderGUID`=83929;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83929, 83929, 0, 0, 2, 0, 0),
(83929, 83928, 0, 0, 2, 0, 0),
(83929, 83986, 0, 0, 2, 0, 0),
(83929, 77816, 0, 0, 2, 0, 0);

SET @NPC := 77818;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2067.58, 120.639, 54.6068, 0),
(@PATH, 2, 2068.65, 124.579, 54.4448, 0),
(@PATH, 3, 2073.17, 136.186, 54.3431, 0),
(@PATH, 4, 2067.19, 140.195, 54.3051, 0),
(@PATH, 5, 2074.04, 136.275, 54.3549, 0),
(@PATH, 6, 2069.37, 129.214, 54.2632, 0),
(@PATH, 7, 2065.92, 119.088, 54.6917, 0),
(@PATH, 8, 2067.54, 110.605, 54.6653, 0),
(@PATH, 9, 2071.76, 108.894, 54.6828, 0),
(@PATH, 10, 2069.07, 110.515, 54.6717, 0);

SET @NPC := 77819;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2157.48, 240.365, 53.8761, 0),
(@PATH, 2, 2157.15, 245.379, 53.9002, 0),
(@PATH, 3, 2163.3, 256.598, 53.5643, 0),
(@PATH, 4, 2172.27, 263.614, 53.5644, 0),
(@PATH, 5, 2169.42, 266.65, 53.5095, 0),
(@PATH, 6, 2176.24, 257.534, 53.5725, 0),
(@PATH, 7, 2166.49, 248.773, 53.6714, 0),
(@PATH, 8, 2157.53, 240.79, 53.88, 0),
(@PATH, 9, 2161.49, 235.735, 53.8969, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=83971;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83971, 83971, 0, 0, 2, 0, 0),
(83971, 83996, 0, 0, 2, 0, 0),
(83971, 83997, 0, 0, 2, 0, 0),
(83971, 83933, 0, 0, 2, 0, 0);

-- The Cook in the Castle
SET @NPC := 83970;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,69, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2200.8, 154.304, 89.4549, 0),
(@PATH, 2, 2201.31, 153.99, 89.455, 10000),
(@PATH, 3, 2201.6, 156.055, 89.455, 0),
(@PATH, 4, 2201.02, 156.09, 89.455, 10000),
(@PATH, 5, 2202.06, 156.634, 89.455, 0),
(@PATH, 6, 2204.48, 160.807, 89.455, 0),
(@PATH, 7, 2204.82, 160.47, 89.4549, 10000);

-- Armorer Pathing in Castle
SET @NPC := 83939;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,69, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2186.46, 118.12, 89.4552, 0),
(@PATH, 2, 2188.81, 120.799, 89.4552, 12000),
(@PATH, 3, 2180.05, 118.042, 89.4552, 12000),
(@PATH, 4, 2183.88, 115.816, 89.4552, 0),
(@PATH, 5, 2182.72, 111.643, 89.4552, 12000);

-- =======================
-- Outside of Castle Stuff
-- =======================

-- enable movement for these fuckers
-- Lordaeron Sentry SAI
SET @ENTRY := 17815;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,0,0,2300,5000,11,15620,64,0,0,0,0,2,0,0,0,0,0,0,0,"Lordaeron Sentry - In Combat CMC - Cast 'Shoot' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,4,0,0,2300,5000,11,16100,64,0,0,0,0,2,0,0,0,0,0,0,0,"Lordaeron Sentry - In Combat CMC - Cast 'Shoot' (Heroic Dungeon)"),
(@ENTRY,0,2,0,2,0,100,7,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lordaeron Sentry - Between 0-15% Health - Flee For Assist (No Repeat) (Dungeon)");

-- On Castle
SET @NPC := 83972;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2325.11, 885.167, 90.6113, 0),
(@PATH, 2, 2331.89, 884.099, 87.1758, 0),
(@PATH, 3, 2332.94, 887.052, 86.7539, 0),
(@PATH, 4, 2331.14, 890.154, 85.6413, 0),
(@PATH, 5, 2327.28, 892.536, 83.7337, 0),
(@PATH, 6, 2323.33, 892.184, 81.9012, 0),
(@PATH, 7, 2318.98, 887.176, 81.6081, 0),
(@PATH, 8, 2318.69, 882.293, 79.2719, 0),
(@PATH, 9, 2320.56, 879.062, 77.5579, 0),
(@PATH, 10, 2325.94, 876.844, 76.9868, 0),
(@PATH, 11, 2330.77, 877.674, 75.7722, 0),
(@PATH, 12, 2335, 882.021, 72.2668, 0),
(@PATH, 13, 2333.83, 889.01, 71.3798, 0),
(@PATH, 14, 2332.53, 893.004, 70.1646, 0),
(@PATH, 15, 2326.51, 894.765, 67.1477, 0),
(@PATH, 16, 2322.01, 894.088, 65.5546, 0),
(@PATH, 17, 2317.43, 890.326, 65.1353, 0),
(@PATH, 18, 2316.2, 886.194, 63.7357, 0),
(@PATH, 19, 2318.93, 879.756, 62.315, 0),
(@PATH, 20, 2323.42, 876.041, 59.9463, 0),
(@PATH, 21, 2328.9, 876.302, 57.6755, 0),
(@PATH, 22, 2333.22, 882.887, 57.671, 0),
(@PATH, 23, 2330.23, 891.656, 57.6677, 0),
(@PATH, 24, 2330.97, 895.891, 57.6647, 0),
(@PATH, 25, 2333.62, 903.478, 57.6647, 0),
(@PATH, 26, 2327.67, 905.549, 57.6647, 0),
(@PATH, 27, 2316.2, 902.56, 57.569, 0),
(@PATH, 28, 2310.06, 898.124, 57.6648, 0),
(@PATH, 29, 2306.3, 891.68, 57.6648, 0),
(@PATH, 30, 2305.38, 884.853, 57.6648, 0),
(@PATH, 31, 2306.64, 877.848, 57.5939, 0),
(@PATH, 32, 2311.01, 870.276, 57.6642, 0),
(@PATH, 33, 2318.98, 865.217, 57.5566, 0),
(@PATH, 34, 2328.33, 863.818, 57.6633, 0),
(@PATH, 35, 2336.48, 867.295, 57.574, 0),
(@PATH, 36, 2343.45, 873.318, 57.663, 0),
(@PATH, 37, 2346.58, 879.571, 57.663, 0),
(@PATH, 38, 2346.54, 888.088, 57.5692, 0),
(@PATH, 39, 2343.96, 895.954, 57.6645, 0),
(@PATH, 40, 2339.83, 900.705, 57.6645, 0),
(@PATH, 41, 2333.78, 903.467, 57.6645, 0),
(@PATH, 42, 2330.4, 896.083, 57.6645, 0),
(@PATH, 43, 2329.77, 889.734, 57.6676, 0),
(@PATH, 44, 2331.14, 878.867, 57.6683, 0),
(@PATH, 45, 2328.35, 875.736, 57.8588, 0),
(@PATH, 46, 2323.37, 875.52, 59.9245, 0),
(@PATH, 47, 2319.42, 878.762, 61.8416, 0),
(@PATH, 48, 2316.99, 883.931, 62.4409, 0),
(@PATH, 49, 2316.51, 886.569, 63.8636, 0),
(@PATH, 50, 2318.53, 890.77, 65.1821, 0),
(@PATH, 51, 2322.68, 893.593, 65.555, 0),
(@PATH, 52, 2327.67, 893.958, 67.6509, 0),
(@PATH, 53, 2331.42, 891.878, 69.8271, 0),
(@PATH, 54, 2334.07, 888.412, 71.3795, 0),
(@PATH, 55, 2334.68, 882.853, 71.8615, 0),
(@PATH, 56, 2333.31, 879.767, 73.7331, 0),
(@PATH, 57, 2329.96, 877.462, 76.232, 0),
(@PATH, 58, 2326.87, 877.048, 76.9683, 0),
(@PATH, 59, 2321.05, 879.39, 77.3211, 0),
(@PATH, 60, 2319.01, 882.819, 79.3952, 0),
(@PATH, 61, 2319.14, 886.792, 81.5905, 0),
(@PATH, 62, 2323.52, 891.644, 81.8, 0),
(@PATH, 63, 2326.09, 892.595, 83.1418, 0),
(@PATH, 64, 2329.49, 891.449, 84.9086, 0),
(@PATH, 65, 2331.62, 888.864, 86.2302, 0),
(@PATH, 66, 2332.31, 886.586, 87.176, 0),
(@PATH, 67, 2331.76, 884.452, 87.176, 0),
(@PATH, 68, 2322.23, 885.951, 92.7589, 0);

-- Group of 3 walking on Path Near Castle
DELETE FROM `creature_formations` WHERE `leaderGUID`=31799;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(31799, 31799, 0, 0, 2, 0, 0),
(31799, 48021, 3, 60, 2, 0, 0),
(31799, 48022, 3, 300, 2, 0, 0);

SET @NPC := 31799;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2018.19, 313.412, 66.0958, 0),
(@PATH, 2, 2027.78, 329.65, 66.0986, 0),
(@PATH, 3, 2039.14, 346.798, 66.072, 0),
(@PATH, 4, 2050.96, 374.133, 65.9613, 0),
(@PATH, 5, 2058.06, 390.457, 66.0772, 0),
(@PATH, 6, 2068.54, 411.057, 66.0615, 0),
(@PATH, 7, 2073.09, 421.154, 66.1363, 0),
(@PATH, 8, 2079.13, 440.491, 66.2517, 0),
(@PATH, 9, 2087.18, 466.869, 65.9002, 0),
(@PATH, 10, 2093.36, 483.083, 64.6249, 0),
(@PATH, 11, 2100.55, 496.159, 62.1489, 0),
(@PATH, 12, 2111.38, 509.983, 59.3541, 0),
(@PATH, 13, 2124.28, 522.055, 56.8856, 0),
(@PATH, 14, 2136.51, 535.415, 54.6722, 0),
(@PATH, 15, 2151.66, 551.229, 50.4063, 0),
(@PATH, 16, 2161.32, 566.353, 46.8987, 0),
(@PATH, 17, 2168.07, 588.288, 42.1267, 0),
(@PATH, 18, 2171.31, 606.029, 39.5882, 0),
(@PATH, 19, 2172.69, 622.375, 36.9113, 0),
(@PATH, 20, 2175.5, 641.143, 33.8056, 0),
(@PATH, 21, 2172.7, 627.72, 35.6883, 0),
(@PATH, 22, 2170.41, 607.085, 39.4374, 0),
(@PATH, 23, 2167.23, 590.177, 41.9199, 0),
(@PATH, 24, 2161.95, 569.422, 46.211, 0),
(@PATH, 25, 2158.41, 562.069, 48.0236, 0),
(@PATH, 26, 2148.92, 549.403, 50.956, 0),
(@PATH, 27, 2136.91, 535.789, 54.5421, 0),
(@PATH, 28, 2130.16, 527.157, 56.0405, 0),
(@PATH, 29, 2108.82, 509.232, 59.6871, 0),
(@PATH, 30, 2098.32, 493.48, 62.7374, 0),
(@PATH, 31, 2087.92, 471.897, 65.8437, 0),
(@PATH, 32, 2083.84, 458.354, 66.1229, 0),
(@PATH, 33, 2078.36, 437.542, 66.2739, 0),
(@PATH, 34, 2072.13, 419.858, 66.1159, 0),
(@PATH, 35, 2057.47, 392.51, 66.058, 0),
(@PATH, 36, 2047.37, 367.993, 66.0416, 0),
(@PATH, 37, 2037.51, 345.576, 66.064, 0),
(@PATH, 38, 2023.41, 323.477, 66.0973, 0),
(@PATH, 39, 2014.63, 305.342, 66.0953, 0),
(@PATH, 40, 2002.65, 287.829, 66.1836, 0),
(@PATH, 41, 1991.13, 272.215, 66.9844, 0),
(@PATH, 42, 1975.02, 253.234, 67.4879, 0),
(@PATH, 43, 1987.19, 267.878, 67.0954, 0),
(@PATH, 44, 2001.88, 284.088, 66.153, 0),
(@PATH, 45, 2011.98, 301.219, 66.0991, 0);

-- Group of 3 walking on Path From Southshore
DELETE FROM `creature_formations` WHERE `leaderGUID`=40161;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(40161, 40161, 0, 0, 2, 0, 0),
(40161, 48010, 3, 60, 2, 0, 0),
(40161, 48011, 3, 300, 2, 0, 0);

SET @NPC := 40161;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2033.7, 1037.71, 27.2622, 0),
(@PATH, 2, 2052.69, 1027.51, 29.9964, 0),
(@PATH, 3, 2064.05, 1024.49, 31.3459, 0),
(@PATH, 4, 2081.15, 1024.77, 32.6441, 0),
(@PATH, 5, 2094.54, 1028.74, 32.789, 0),
(@PATH, 6, 2111.75, 1036.15, 34.8223, 0),
(@PATH, 7, 2127.78, 1039.11, 37.3397, 0),
(@PATH, 8, 2142.51, 1040.35, 39.4863, 0),
(@PATH, 9, 2151.24, 1038.85, 40.903, 0),
(@PATH, 10, 2163.97, 1033.92, 43.0773, 0),
(@PATH, 11, 2179.02, 1029.86, 45.5233, 0),
(@PATH, 12, 2193.08, 1024.2, 48.0107, 0),
(@PATH, 13, 2209.97, 1019.79, 50.8105, 0),
(@PATH, 14, 2232.14, 1015.33, 53.6278, 0),
(@PATH, 15, 2236.86, 1000.05, 54.3589, 0),
(@PATH, 16, 2239.94, 983.671, 54.5024, 0),
(@PATH, 17, 2243.15, 967.012, 54.4995, 0),
(@PATH, 18, 2250.3, 950.466, 54.4995, 0),
(@PATH, 19, 2257.66, 929.562, 54.5, 0),
(@PATH, 20, 2266.9, 907.928, 54.5, 0),
(@PATH, 21, 2272.49, 895.354, 54.5, 0),
(@PATH, 22, 2277.79, 879.701, 54.5, 0),
(@PATH, 23, 2283.3, 862.612, 54.5, 0),
(@PATH, 24, 2286.78, 846.443, 54.5038, 0),
(@PATH, 25, 2287.27, 836.662, 54.5816, 0),
(@PATH, 26, 2285.96, 818.884, 54.5465, 0),
(@PATH, 27, 2300.59, 826.601, 54.2136, 0),
(@PATH, 28, 2315.28, 833.688, 54.0844, 0),
(@PATH, 29, 2329.23, 838.29, 53.7169, 0),
(@PATH, 30, 2338.8, 843.829, 53.9952, 0),
(@PATH, 31, 2360.41, 850.112, 55.0492, 0),
(@PATH, 32, 2374.82, 854.797, 56.1393, 0),
(@PATH, 33, 2389.13, 859.729, 56.593, 0),
(@PATH, 34, 2406.24, 863.134, 57.4308, 0),
(@PATH, 35, 2425.77, 870.367, 59.3746, 0),
(@PATH, 36, 2440.46, 874.494, 60.7434, 0),
(@PATH, 37, 2455.4, 877.09, 61.6139, 0),
(@PATH, 38, 2468.96, 879.393, 62.7986, 0),
(@PATH, 39, 2481.63, 882.154, 63.3108, 0),
(@PATH, 40, 2500.23, 883.53, 63.8125, 0),
(@PATH, 41, 2524.92, 884.253, 64.5644, 0),
(@PATH, 42, 2549.01, 885.228, 65.2615, 0),
(@PATH, 43, 2570.57, 885.702, 66.6194, 0),
(@PATH, 44, 2590.25, 883.441, 68.0443, 0),
(@PATH, 45, 2609.47, 883.434, 68.4157, 0),
(@PATH, 46, 2627.08, 883.115, 68.7522, 0),
(@PATH, 47, 2638.72, 884.668, 69.4879, 0),
(@PATH, 48, 2647.3, 886.344, 69.9081, 0),
(@PATH, 49, 2648.6, 864.03, 66.5179, 0),
(@PATH, 50, 2644.51, 848.334, 63.7446, 0),
(@PATH, 51, 2644.42, 832.861, 61.2474, 0),
(@PATH, 52, 2650, 812.135, 59.5327, 0),
(@PATH, 53, 2648.28, 798.034, 58.7606, 0),
(@PATH, 54, 2641, 787.92, 57.6733, 0),
(@PATH, 55, 2626.84, 778.887, 57.2837, 0),
(@PATH, 56, 2617.82, 770.64, 56.741, 0),
(@PATH, 57, 2612.9, 757.971, 56.3436, 0),
(@PATH, 58, 2612.32, 742.239, 56.0196, 0),
(@PATH, 59, 2618.59, 729.8, 55.5448, 0),
(@PATH, 60, 2631.64, 717.81, 56.124, 0),
(@PATH, 61, 2637.24, 709.656, 56.0667, 0),
(@PATH, 62, 2640.55, 701.856, 55.9947, 0),
(@PATH, 63, 2637.22, 712.487, 56.1679, 0),
(@PATH, 64, 2623.09, 726.894, 55.695, 0),
(@PATH, 65, 2615.24, 734.875, 55.5676, 0),
(@PATH, 66, 2612.66, 743.85, 56.0761, 0),
(@PATH, 67, 2612.93, 755.628, 56.358, 0),
(@PATH, 68, 2616.75, 766.374, 56.679, 0),
(@PATH, 69, 2621.31, 773.14, 57.0131, 0),
(@PATH, 70, 2630.75, 781.124, 57.4799, 0),
(@PATH, 71, 2640.96, 787.68, 57.6649, 0),
(@PATH, 72, 2650.15, 800.171, 58.9708, 0),
(@PATH, 73, 2650.52, 811.561, 59.5219, 0),
(@PATH, 74, 2645.37, 829.821, 60.8724, 0),
(@PATH, 75, 2643.37, 842.616, 62.7975, 0),
(@PATH, 76, 2644.93, 852.378, 64.4211, 0),
(@PATH, 77, 2649.51, 864.861, 66.7019, 0),
(@PATH, 78, 2648.1, 877.58, 68.9693, 0),
(@PATH, 79, 2644.34, 884.823, 69.6378, 0),
(@PATH, 80, 2635.53, 884.284, 69.2843, 0),
(@PATH, 81, 2620.1, 883.128, 68.5394, 0),
(@PATH, 82, 2595.87, 882.61, 67.9833, 0),
(@PATH, 83, 2574.96, 885.401, 67.11, 0),
(@PATH, 84, 2547.6, 885.501, 65.1863, 0),
(@PATH, 85, 2517.31, 884.012, 64.3204, 0),
(@PATH, 86, 2487.24, 883.374, 63.4703, 0),
(@PATH, 87, 2467.93, 880.227, 62.7723, 0),
(@PATH, 88, 2446.76, 875.248, 61.0426, 0),
(@PATH, 89, 2431.02, 873.251, 60.0043, 0),
(@PATH, 90, 2411.9, 865.704, 57.8424, 0),
(@PATH, 91, 2403.27, 862.833, 57.1985, 0),
(@PATH, 92, 2385.71, 860.395, 56.5602, 0),
(@PATH, 93, 2359.36, 850.036, 54.9632, 0),
(@PATH, 94, 2335.95, 842.985, 53.888, 0),
(@PATH, 95, 2311.06, 831.342, 54.1764, 0),
(@PATH, 96, 2298.28, 825.996, 54.2442, 0),
(@PATH, 97, 2284.59, 818.734, 54.5651, 0),
(@PATH, 98, 2286.06, 833.548, 54.6597, 0),
(@PATH, 99, 2284.14, 854.313, 54.4979, 0),
(@PATH, 100, 2280.29, 869.203, 54.4995, 0),
(@PATH, 101, 2271, 892.06, 54.4995, 0),
(@PATH, 102, 2259.09, 921.511, 54.501, 0),
(@PATH, 103, 2249.62, 946.579, 54.5057, 0),
(@PATH, 104, 2243.4, 964.173, 54.5007, 0),
(@PATH, 105, 2235.9, 989.626, 54.5012, 0),
(@PATH, 106, 2232.97, 1005.62, 54.1029, 0),
(@PATH, 107, 2227.72, 1015.88, 53.4782, 0),
(@PATH, 108, 2211.84, 1020.49, 51.1169, 0),
(@PATH, 109, 2192.95, 1024.61, 47.9657, 0),
(@PATH, 110, 2172.81, 1032.27, 44.4531, 0),
(@PATH, 111, 2153.53, 1037.24, 41.3712, 0),
(@PATH, 112, 2140.79, 1040.89, 39.1775, 0),
(@PATH, 113, 2123.12, 1039.6, 36.6713, 0),
(@PATH, 114, 2103.49, 1035.02, 33.4594, 0),
(@PATH, 115, 2086.92, 1026.77, 32.6743, 0),
(@PATH, 116, 2072.26, 1023.99, 31.9935, 0),
(@PATH, 117, 2056.05, 1025.72, 30.5415, 0),
(@PATH, 118, 2040.42, 1032.48, 27.9721, 0),
(@PATH, 119, 2027.22, 1039.55, 26.6217, 0),
(@PATH, 120, 2009.61, 1041, 25.8193, 0),
(@PATH, 121, 1994.01, 1036.6, 25.2784, 0),
(@PATH, 122, 1978.52, 1028.8, 24.9676, 0),
(@PATH, 123, 1966.82, 1030.89, 24.0734, 0),
(@PATH, 124, 1958.48, 1036.2, 22.866, 0),
(@PATH, 125, 1947.24, 1048.57, 20.7007, 0),
(@PATH, 126, 1937.04, 1052.57, 20.1663, 0),
(@PATH, 127, 1912.11, 1051.93, 18.6749, 0),
(@PATH, 128, 1887.93, 1055.78, 18.1049, 0),
(@PATH, 129, 1877.56, 1060.81, 17.4922, 0),
(@PATH, 130, 1861.06, 1069.78, 15.7649, 0),
(@PATH, 131, 1846.73, 1077.79, 13.6887, 0),
(@PATH, 132, 1833.61, 1077.49, 11.9939, 0),
(@PATH, 133, 1817.89, 1071.35, 10.6397, 0),
(@PATH, 134, 1792.63, 1059.22, 7.83287, 0),
(@PATH, 135, 1774.94, 1059.42, 6.82387, 0),
(@PATH, 136, 1795.92, 1060.08, 8.12069, 0),
(@PATH, 137, 1808.4, 1064.97, 9.29659, 0),
(@PATH, 138, 1826.46, 1074.14, 11.2145, 0),
(@PATH, 139, 1837.32, 1077.6, 12.5392, 0),
(@PATH, 140, 1847.23, 1077.42, 13.785, 0),
(@PATH, 141, 1858.66, 1071.86, 15.5919, 0),
(@PATH, 142, 1872.94, 1061.59, 16.8176, 0),
(@PATH, 143, 1889.64, 1056.42, 18.0499, 0),
(@PATH, 144, 1900.68, 1053.04, 17.9079, 0),
(@PATH, 145, 1926.7, 1051.99, 19.5382, 0),
(@PATH, 146, 1940.56, 1051.1, 20.25, 0),
(@PATH, 147, 1954.66, 1042.69, 21.7026, 0),
(@PATH, 148, 1966.41, 1032.81, 23.8429, 0),
(@PATH, 149, 1978.57, 1029.18, 24.9264, 0),
(@PATH, 150, 1984.57, 1030.46, 25.3086, 0),
(@PATH, 151, 2003.85, 1040.57, 25.4607, 0);

-- Group of 3 NPC pathing main Path between Southshore and Tarren Mill
DELETE FROM `creature_formations` WHERE `leaderGUID`=31931;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(31931, 31931, 0, 0, 2, 0, 0),
(31931, 47895, 3, 300, 2, 0, 0),
(31931, 47896, 3, 60, 2, 0, 0);

SET @NPC := 31931;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2297.26, 826.454, 54.2536, 0),
(@PATH, 2, 2318.02, 835.456, 53.9879, 0),
(@PATH, 3, 2341.06, 844.537, 54.0672, 0),
(@PATH, 4, 2368.06, 853.36, 55.6975, 0),
(@PATH, 5, 2388.34, 859.967, 56.5967, 0),
(@PATH, 6, 2407.29, 863.278, 57.523, 0),
(@PATH, 7, 2429.46, 871.776, 59.8363, 0),
(@PATH, 8, 2451.91, 876.067, 61.3264, 0),
(@PATH, 9, 2474.39, 881.111, 63.0555, 0),
(@PATH, 10, 2501.4, 883.295, 63.8419, 0),
(@PATH, 11, 2526.21, 885.033, 64.6203, 0),
(@PATH, 12, 2551.5, 885.4, 65.2762, 0),
(@PATH, 13, 2570.97, 885.675, 66.6719, 0),
(@PATH, 14, 2591.48, 882.584, 68.0358, 0),
(@PATH, 15, 2628.4, 884.012, 68.849, 0),
(@PATH, 16, 2658.91, 888.509, 71.2081, 0),
(@PATH, 17, 2672.56, 890.768, 72.7702, 0),
(@PATH, 18, 2693.86, 885.752, 74.1806, 0),
(@PATH, 19, 2713.38, 884.501, 76.1029, 0),
(@PATH, 20, 2732.82, 888.404, 78.4829, 0),
(@PATH, 21, 2755.95, 883.583, 81.4612, 0),
(@PATH, 22, 2785.64, 885.325, 86.028, 0),
(@PATH, 23, 2804.28, 891.622, 89.6307, 0),
(@PATH, 24, 2814.42, 899.85, 91.8807, 0),
(@PATH, 25, 2830.66, 915.238, 96.5334, 0),
(@PATH, 26, 2866.3, 920.68, 105.739, 0),
(@PATH, 27, 2899.02, 946.215, 117.103, 0),
(@PATH, 28, 2941.42, 947.916, 130.207, 0),
(@PATH, 29, 2952.49, 953.108, 133.123, 0),
(@PATH, 30, 2933.55, 946.743, 127.665, 0),
(@PATH, 31, 2912.45, 947.439, 120.768, 0),
(@PATH, 32, 2894.96, 944.572, 115.928, 0),
(@PATH, 33, 2887.02, 939.921, 113.319, 0),
(@PATH, 34, 2870.86, 923.593, 107.219, 0),
(@PATH, 35, 2860.04, 919.649, 103.829, 0),
(@PATH, 36, 2832.34, 917.115, 97.0985, 0),
(@PATH, 37, 2823.7, 912.33, 94.8206, 0),
(@PATH, 38, 2811.53, 898.344, 91.292, 0),
(@PATH, 39, 2798.25, 888.481, 88.2803, 0),
(@PATH, 40, 2786.07, 884.969, 86.0852, 0),
(@PATH, 41, 2768.53, 883.895, 83.3232, 0),
(@PATH, 42, 2750.42, 885.691, 80.8465, 0),
(@PATH, 43, 2731.02, 888.331, 78.2216, 0),
(@PATH, 44, 2708.53, 885.886, 75.4766, 0),
(@PATH, 45, 2692.26, 885.711, 74.0608, 0),
(@PATH, 46, 2674.56, 891.05, 72.9436, 0),
(@PATH, 47, 2656.87, 890.577, 71.0586, 0),
(@PATH, 48, 2643.22, 886.547, 69.736, 0),
(@PATH, 49, 2620.6, 882.848, 68.5394, 0),
(@PATH, 50, 2601.61, 882.172, 68.1294, 0),
(@PATH, 51, 2582.66, 883.452, 67.743, 0),
(@PATH, 52, 2569.63, 886.578, 66.4967, 0),
(@PATH, 53, 2539.69, 885.352, 64.7605, 0),
(@PATH, 54, 2518.36, 884.463, 64.3804, 0),
(@PATH, 55, 2501.75, 884.356, 63.7759, 0),
(@PATH, 56, 2476.52, 882.351, 63.1364, 0),
(@PATH, 57, 2457.38, 877.412, 61.8321, 0),
(@PATH, 58, 2437.14, 874.718, 60.5453, 0),
(@PATH, 59, 2416.18, 867.191, 58.1515, 0),
(@PATH, 60, 2405.78, 863.337, 57.3958, 0),
(@PATH, 61, 2385.29, 859.648, 56.5073, 0),
(@PATH, 62, 2366.22, 853.921, 55.574, 0),
(@PATH, 63, 2340.44, 844.064, 54.0407, 0),
(@PATH, 64, 2321.49, 836.288, 53.8379, 0),
(@PATH, 65, 2304.05, 828.219, 54.167, 0),
(@PATH, 66, 2284.63, 819.081, 54.5629, 0),
(@PATH, 67, 2276.49, 806.015, 54.5062, 0),
(@PATH, 68, 2259.45, 782.432, 53.9581, 0),
(@PATH, 69, 2248.1, 764.237, 52.6681, 0),
(@PATH, 70, 2227.61, 742.088, 47.3814, 0),
(@PATH, 71, 2211.48, 719.391, 41.8384, 0),
(@PATH, 72, 2196.17, 701.104, 37.2442, 0),
(@PATH, 73, 2186.72, 682.881, 34.477, 0),
(@PATH, 74, 2183.15, 671.171, 34.0323, 0),
(@PATH, 75, 2191.46, 692.237, 35.6717, 0),
(@PATH, 76, 2204.3, 712.019, 39.6665, 0),
(@PATH, 77, 2223.15, 734.204, 45.6636, 0),
(@PATH, 78, 2238.43, 754.221, 50.8206, 0),
(@PATH, 79, 2252.94, 770.293, 53.2999, 0),
(@PATH, 80, 2271.29, 798.227, 54.5908, 0),
(@PATH, 81, 2284.63, 817.792, 54.572, 0),
(@PATH, 82, 2286.83, 831.371, 54.5761, 0),
(@PATH, 83, 2285.96, 848.028, 54.5205, 0),
(@PATH, 84, 2283.72, 858.862, 54.4995, 0),
(@PATH, 85, 2277.61, 875.464, 54.4994, 0),
(@PATH, 86, 2266.79, 902.231, 54.4994, 0),
(@PATH, 87, 2258.17, 922.595, 54.5014, 0),
(@PATH, 88, 2254.14, 937.694, 54.5014, 0),
(@PATH, 89, 2247.62, 954.305, 54.4998, 0),
(@PATH, 90, 2241.64, 970.8, 54.4998, 0),
(@PATH, 91, 2236.29, 990.011, 54.5018, 0),
(@PATH, 92, 2230.51, 1015.88, 53.58, 0),
(@PATH, 93, 2226.99, 1040.78, 52.9566, 0),
(@PATH, 94, 2225.38, 1066.21, 50.8387, 0),
(@PATH, 95, 2224.57, 1092.67, 47.9604, 0),
(@PATH, 96, 2221.17, 1118.32, 47.3289, 0),
(@PATH, 97, 2215.23, 1142.62, 47.3363, 0),
(@PATH, 98, 2206.52, 1160.95, 47.3294, 0),
(@PATH, 99, 2191.01, 1180.19, 47.3334, 0),
(@PATH, 100, 2176.06, 1200.97, 47.3576, 0),
(@PATH, 101, 2153.58, 1232.91, 47.3083, 0),
(@PATH, 102, 2137.4, 1265.68, 47.3415, 0),
(@PATH, 103, 2117.78, 1296.4, 47.2391, 0),
(@PATH, 104, 2105.55, 1331, 47.311, 0),
(@PATH, 105, 2099.06, 1343.26, 47.3169, 0),
(@PATH, 106, 2106.72, 1327.73, 47.2684, 0),
(@PATH, 107, 2118.71, 1298.89, 47.2623, 0),
(@PATH, 108, 2129.37, 1279.65, 47.3572, 0),
(@PATH, 109, 2142, 1260.53, 47.3312, 0),
(@PATH, 110, 2151.32, 1240.71, 47.2761, 0),
(@PATH, 111, 2163.63, 1218.81, 47.3292, 0),
(@PATH, 112, 2181.68, 1197.19, 47.3568, 0),
(@PATH, 113, 2201.05, 1172.65, 47.3118, 0),
(@PATH, 114, 2211.89, 1155.51, 47.3104, 0),
(@PATH, 115, 2218.39, 1140.43, 47.3378, 0),
(@PATH, 116, 2225.45, 1110.72, 47.206, 0),
(@PATH, 117, 2226.69, 1088.6, 48.2767, 0),
(@PATH, 118, 2227.51, 1061.13, 51.162, 0),
(@PATH, 119, 2229.3, 1040.74, 52.9542, 0),
(@PATH, 120, 2232.73, 1016.29, 53.6401, 0),
(@PATH, 121, 2238.52, 992.95, 54.498, 0),
(@PATH, 122, 2244.92, 960.982, 54.501, 0),
(@PATH, 123, 2256.49, 934.401, 54.5, 0),
(@PATH, 124, 2272.51, 894.714, 54.5, 0),
(@PATH, 125, 2279.98, 869.234, 54.5, 0),
(@PATH, 126, 2286.45, 846.302, 54.5178, 0),
(@PATH, 127, 2287.17, 829.612, 54.5198, 0),
(@PATH, 128, 2285.48, 818.834, 54.5455, 0);

-- Group of 3 NPC pathing main Path between Tarren Mill and Southshore
DELETE FROM `creature_formations` WHERE `leaderGUID`=38051;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(38051, 38051, 0, 0, 2, 0, 0),
(38051, 48006, 3, 60, 2, 0, 0),
(38051, 48007, 3, 300, 2, 0, 0);

SET @NPC := 38051;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2405.29, 863.545, 57.358, 0),
(@PATH, 2, 2389.6, 860.732, 56.6579, 0),
(@PATH, 3, 2370.87, 854.003, 55.8788, 0),
(@PATH, 4, 2342.21, 845.899, 54.1098, 0),
(@PATH, 5, 2322.7, 836.199, 53.8074, 0),
(@PATH, 6, 2302.11, 828.377, 54.1732, 0),
(@PATH, 7, 2285.29, 818.678, 54.5502, 0),
(@PATH, 8, 2286.14, 836.791, 54.6453, 0),
(@PATH, 9, 2284.46, 852.418, 54.509, 0),
(@PATH, 10, 2279.3, 869.348, 54.498, 0),
(@PATH, 11, 2269.94, 893.051, 54.5021, 0),
(@PATH, 12, 2263.07, 909.73, 54.5019, 0),
(@PATH, 13, 2255.3, 934.26, 54.501, 0),
(@PATH, 14, 2247.8, 950.238, 54.4582, 0),
(@PATH, 15, 2243.19, 964.782, 54.4998, 0),
(@PATH, 16, 2237.24, 983.533, 54.5095, 0),
(@PATH, 17, 2233.59, 1000.86, 54.3187, 0),
(@PATH, 18, 2229.28, 1014.61, 53.5769, 0),
(@PATH, 19, 2221.45, 1018.46, 52.9309, 0),
(@PATH, 20, 2203, 1022.28, 49.5684, 0),
(@PATH, 21, 2180.63, 1029.22, 45.8132, 0),
(@PATH, 22, 2163.91, 1033.35, 43.1132, 0),
(@PATH, 23, 2147.39, 1039.4, 40.2942, 0),
(@PATH, 24, 2130.86, 1040.3, 37.7083, 0),
(@PATH, 25, 2114.52, 1037.05, 35.2203, 0),
(@PATH, 26, 2099.97, 1032.09, 33.0175, 0),
(@PATH, 27, 2085.48, 1024.85, 32.7897, 0),
(@PATH, 28, 2067.1, 1023.42, 31.5893, 0),
(@PATH, 29, 2053.53, 1026.31, 30.1988, 0),
(@PATH, 30, 2030.91, 1038.02, 27.0364, 0),
(@PATH, 31, 2017.57, 1040.71, 25.9681, 0),
(@PATH, 32, 2004.12, 1039.63, 25.5061, 0),
(@PATH, 33, 1993.23, 1036.26, 25.2964, 0),
(@PATH, 34, 1980, 1030.16, 25.0028, 0),
(@PATH, 35, 1971.42, 1030.94, 24.2482, 0),
(@PATH, 36, 1959.98, 1036.36, 22.9669, 0),
(@PATH, 37, 1948.68, 1047.78, 20.8565, 0),
(@PATH, 38, 1937.34, 1052.4, 20.1837, 0),
(@PATH, 39, 1925.76, 1053.7, 19.4854, 0),
(@PATH, 40, 1905.6, 1053.15, 18.1491, 0),
(@PATH, 41, 1888.62, 1055.3, 18.0517, 0),
(@PATH, 42, 1868.76, 1064.87, 16.3555, 0),
(@PATH, 43, 1846.84, 1077.65, 13.7145, 0),
(@PATH, 44, 1835.61, 1078.54, 12.2458, 0),
(@PATH, 45, 1817.8, 1071.93, 10.6522, 0),
(@PATH, 46, 1796.05, 1060.56, 8.13385, 0),
(@PATH, 47, 1789.08, 1059.15, 7.65879, 0),
(@PATH, 48, 1774.32, 1059.31, 6.80622, 0),
(@PATH, 49, 1788.97, 1058.6, 7.63011, 0),
(@PATH, 50, 1801.99, 1062.31, 8.54349, 0),
(@PATH, 51, 1823.33, 1073.43, 11.1419, 0),
(@PATH, 52, 1837.23, 1076.53, 12.5762, 0),
(@PATH, 53, 1851.52, 1075.54, 14.5757, 0),
(@PATH, 54, 1862.81, 1069.95, 15.9675, 0),
(@PATH, 55, 1877.71, 1059.18, 17.4732, 0),
(@PATH, 56, 1888.84, 1054.67, 18.0092, 0),
(@PATH, 57, 1904.79, 1052.51, 18.12, 0),
(@PATH, 58, 1939.39, 1050.96, 20.2504, 0),
(@PATH, 59, 1951.26, 1045.59, 21.1385, 0),
(@PATH, 60, 1965.78, 1032.34, 23.8575, 0),
(@PATH, 61, 1986.59, 1028.48, 25.645, 0),
(@PATH, 62, 2002.26, 1037.34, 25.438, 0),
(@PATH, 63, 2014.81, 1040.37, 25.9989, 0),
(@PATH, 64, 2033.74, 1037.58, 27.2585, 0),
(@PATH, 65, 2050.87, 1029.07, 29.6277, 0),
(@PATH, 66, 2063.27, 1024.33, 31.3215, 0),
(@PATH, 67, 2072.66, 1023.3, 32.046, 0),
(@PATH, 68, 2086.48, 1026.12, 32.7105, 0),
(@PATH, 69, 2106.57, 1033.64, 34.0726, 0),
(@PATH, 70, 2121.53, 1039.27, 36.4285, 0),
(@PATH, 71, 2141.18, 1040.22, 39.2886, 0),
(@PATH, 72, 2149.33, 1039.93, 40.538, 0),
(@PATH, 73, 2166.01, 1033.61, 43.3866, 0),
(@PATH, 74, 2192.56, 1024.79, 47.8952, 0),
(@PATH, 75, 2223.67, 1018.16, 53.1731, 0),
(@PATH, 76, 2232.56, 1009.46, 53.865, 0),
(@PATH, 77, 2240.66, 982.041, 54.5019, 0),
(@PATH, 78, 2247.14, 957.74, 54.5019, 0),
(@PATH, 79, 2254.1, 940.466, 54.4827, 0),
(@PATH, 80, 2264.73, 913.689, 54.5, 0),
(@PATH, 81, 2275.35, 886.915, 54.5, 0),
(@PATH, 82, 2282.61, 864.421, 54.5, 0),
(@PATH, 83, 2286.83, 848.53, 54.5075, 0),
(@PATH, 84, 2286.98, 836.984, 54.5962, 0),
(@PATH, 85, 2285.43, 818.579, 54.5534, 0),
(@PATH, 86, 2299.92, 826.916, 54.2152, 0),
(@PATH, 87, 2323.04, 836.71, 53.7918, 0),
(@PATH, 88, 2342.12, 844.995, 54.1024, 0),
(@PATH, 89, 2369.56, 854.127, 55.7927, 0),
(@PATH, 90, 2401.18, 863.514, 57.0901, 0),
(@PATH, 91, 2413.96, 866.099, 57.992, 0),
(@PATH, 92, 2460.26, 878.534, 62.1424, 0),
(@PATH, 93, 2477.08, 882.264, 63.1521, 0),
(@PATH, 94, 2496.16, 884.711, 63.766, 0),
(@PATH, 95, 2526.3, 884.571, 64.6078, 0),
(@PATH, 96, 2549.14, 885.522, 65.2781, 0),
(@PATH, 97, 2570.91, 884.899, 66.6748, 0),
(@PATH, 98, 2593.72, 883.698, 68.0105, 0),
(@PATH, 99, 2611.25, 881.574, 68.365, 0),
(@PATH, 100, 2623.99, 883.132, 68.6387, 0),
(@PATH, 101, 2647.38, 885.993, 69.8835, 0),
(@PATH, 102, 2648.69, 863.374, 66.4059, 0),
(@PATH, 103, 2643.39, 846.464, 63.4591, 0),
(@PATH, 104, 2645.2, 828.609, 60.7574, 0),
(@PATH, 105, 2650.3, 807.324, 59.3795, 0),
(@PATH, 106, 2647.34, 796.666, 58.6261, 0),
(@PATH, 107, 2636.73, 784.647, 57.6502, 0),
(@PATH, 108, 2622.12, 774.868, 57.0314, 0),
(@PATH, 109, 2614.77, 761.206, 56.4657, 0),
(@PATH, 110, 2613.46, 745.3, 56.1324, 0),
(@PATH, 111, 2617.36, 732.602, 55.5625, 0),
(@PATH, 112, 2626.33, 723.16, 55.8659, 0),
(@PATH, 113, 2634.97, 714.328, 56.1839, 0),
(@PATH, 114, 2640.5, 701.619, 55.9892, 0),
(@PATH, 115, 2634.83, 714.57, 56.1825, 0),
(@PATH, 116, 2616.87, 732.558, 55.5504, 0),
(@PATH, 117, 2613.24, 745.347, 56.1345, 0),
(@PATH, 118, 2615.79, 763.247, 56.5672, 0),
(@PATH, 119, 2621.52, 774.199, 57.0032, 0),
(@PATH, 120, 2635.18, 782.875, 57.5838, 0),
(@PATH, 121, 2649.14, 799.158, 58.8695, 0),
(@PATH, 122, 2651.07, 809.314, 59.4608, 0),
(@PATH, 123, 2644.77, 833.17, 61.2945, 0),
(@PATH, 124, 2645.05, 850.54, 64.1148, 0),
(@PATH, 125, 2648.81, 862.532, 66.2628, 0),
(@PATH, 126, 2648.37, 877.794, 69.0155, 0),
(@PATH, 127, 2644.96, 885.466, 69.7138, 0),
(@PATH, 128, 2630.96, 883.18, 68.9351, 0),
(@PATH, 129, 2610.28, 881.989, 68.3692, 0),
(@PATH, 130, 2585.17, 884.121, 67.9368, 0),
(@PATH, 131, 2552.44, 885.579, 65.2571, 0),
(@PATH, 132, 2531.61, 884.104, 64.6916, 0),
(@PATH, 133, 2504.17, 883.352, 63.879, 0),
(@PATH, 134, 2485.41, 883.278, 63.4378, 0),
(@PATH, 135, 2463.75, 879.443, 62.4912, 0),
(@PATH, 136, 2445.75, 875.207, 60.9997, 0),
(@PATH, 137, 2429.46, 871.952, 59.8412, 0);

-- Group of 3 NPC pathing main Path between Tarren Mill and Southshore
DELETE FROM `creature_formations` WHERE `leaderGUID`=38497;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(38497, 38497, 0, 0, 2, 0, 0),
(38497, 48008, 3, 60, 2, 0, 0),
(38497, 48009, 3, 300, 2, 0, 0);

SET @NPC := 38497;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2623.64, 882.626, 68.6133, 0),
(@PATH, 2, 2600.13, 882.822, 68.0922, 0),
(@PATH, 3, 2580.55, 883.611, 67.6017, 0),
(@PATH, 4, 2567.45, 885.735, 66.2376, 0),
(@PATH, 5, 2532.34, 884.413, 64.6915, 0),
(@PATH, 6, 2504.99, 883.813, 63.8629, 0),
(@PATH, 7, 2484.41, 882.641, 63.4126, 0),
(@PATH, 8, 2464.69, 879.085, 62.5522, 0),
(@PATH, 9, 2438.99, 875.143, 60.6649, 0),
(@PATH, 10, 2412.51, 866.219, 57.8843, 0),
(@PATH, 11, 2400.56, 862.671, 57.0296, 0),
(@PATH, 12, 2381.6, 858.764, 56.4373, 0),
(@PATH, 13, 2361.56, 851.541, 55.1672, 0),
(@PATH, 14, 2342.78, 845.588, 54.1166, 0),
(@PATH, 15, 2324.92, 837.409, 53.7317, 0),
(@PATH, 16, 2305.99, 829.468, 54.1501, 0),
(@PATH, 17, 2296.63, 825.295, 54.2967, 0),
(@PATH, 18, 2282.82, 816.84, 54.5995, 0),
(@PATH, 19, 2285.59, 830.712, 54.6387, 0),
(@PATH, 20, 2285.34, 850.387, 54.5222, 0),
(@PATH, 21, 2279.74, 868.564, 54.4983, 0),
(@PATH, 22, 2271.64, 888.568, 54.4999, 0),
(@PATH, 23, 2262.19, 911.921, 54.5229, 0),
(@PATH, 24, 2253.29, 935.335, 54.5011, 0),
(@PATH, 25, 2246.47, 955.744, 54.4992, 0),
(@PATH, 26, 2240.17, 975.643, 54.4938, 0),
(@PATH, 27, 2236.17, 997.163, 54.4527, 0),
(@PATH, 28, 2231.74, 1016.9, 53.6181, 0),
(@PATH, 29, 2210.78, 1020.64, 50.9163, 0),
(@PATH, 30, 2189.62, 1026.27, 47.3583, 0),
(@PATH, 31, 2155.27, 1036.57, 41.6736, 0),
(@PATH, 32, 2137.13, 1040.63, 38.6119, 0),
(@PATH, 33, 2117.75, 1037.24, 35.7503, 0),
(@PATH, 34, 2099.38, 1030.87, 33.0353, 0),
(@PATH, 35, 2076.36, 1024.7, 32.3428, 0),
(@PATH, 36, 2058.17, 1025.24, 30.8303, 0),
(@PATH, 37, 2040.36, 1033.63, 27.92, 0),
(@PATH, 38, 2022.57, 1039.79, 26.231, 0),
(@PATH, 39, 2005.44, 1039.58, 25.6047, 0),
(@PATH, 40, 1990.56, 1034.27, 25.3473, 0),
(@PATH, 41, 1978.21, 1029.65, 24.8705, 0),
(@PATH, 42, 1967.42, 1032.02, 23.9704, 0),
(@PATH, 43, 1954.63, 1041.74, 21.7939, 0),
(@PATH, 44, 1942.43, 1050.73, 20.3123, 0),
(@PATH, 45, 1933.61, 1052.95, 20.0561, 0),
(@PATH, 46, 1911.5, 1053.02, 18.556, 0),
(@PATH, 47, 1890.89, 1055.17, 17.9183, 0),
(@PATH, 48, 1873.91, 1063.11, 16.998, 0),
(@PATH, 49, 1852.8, 1075.69, 14.7824, 0),
(@PATH, 50, 1835.4, 1077.69, 12.2362, 0),
(@PATH, 51, 1822.26, 1073.72, 11.1149, 0),
(@PATH, 52, 1807.7, 1066.44, 9.26395, 0),
(@PATH, 53, 1792.85, 1059.36, 7.84803, 0),
(@PATH, 54, 1774.69, 1059.29, 6.81798, 0),
(@PATH, 55, 1792.6, 1059.07, 7.8329, 0),
(@PATH, 56, 1808.74, 1067.03, 9.4278, 0),
(@PATH, 57, 1823.02, 1073.86, 11.1345, 0),
(@PATH, 58, 1836.03, 1077.81, 12.3188, 0),
(@PATH, 59, 1849.01, 1076.66, 14.1002, 0),
(@PATH, 60, 1861.43, 1069.11, 15.7692, 0),
(@PATH, 61, 1874.49, 1062.7, 17.0596, 0),
(@PATH, 62, 1890.24, 1055.5, 17.9729, 0),
(@PATH, 63, 1904.57, 1053.95, 18.0479, 0),
(@PATH, 64, 1916.55, 1053.18, 18.9363, 0),
(@PATH, 65, 1933.4, 1052.95, 20.0517, 0),
(@PATH, 66, 1943.01, 1050.55, 20.3518, 0),
(@PATH, 67, 1955.44, 1041.45, 21.9159, 0),
(@PATH, 68, 1967.87, 1031.84, 24.0051, 0),
(@PATH, 69, 1979.65, 1030.46, 24.9749, 0),
(@PATH, 70, 1991.58, 1035.13, 25.3171, 0),
(@PATH, 71, 2004.26, 1040.18, 25.5059, 0),
(@PATH, 72, 2017.05, 1040.72, 25.9712, 0),
(@PATH, 73, 2029.5, 1038.99, 26.9065, 0),
(@PATH, 74, 2042.05, 1032.85, 28.1192, 0),
(@PATH, 75, 2055.96, 1026.3, 30.4824, 0),
(@PATH, 76, 2070.42, 1024.65, 31.8006, 0),
(@PATH, 77, 2086.33, 1025.68, 32.7406, 0),
(@PATH, 78, 2100.96, 1032, 33.1382, 0),
(@PATH, 79, 2114.52, 1037.04, 35.2198, 0),
(@PATH, 80, 2132.59, 1039.75, 37.9587, 0),
(@PATH, 81, 2144.46, 1040.52, 39.7703, 0),
(@PATH, 82, 2153.53, 1037.96, 41.3082, 0),
(@PATH, 83, 2167.6, 1033.48, 43.6209, 0),
(@PATH, 84, 2187.08, 1026.78, 46.943, 0),
(@PATH, 85, 2204.22, 1021.93, 49.7543, 0),
(@PATH, 86, 2223.61, 1017.27, 53.1783, 0),
(@PATH, 87, 2232.01, 1015.26, 53.6222, 0),
(@PATH, 88, 2236.23, 999.343, 54.3852, 0),
(@PATH, 89, 2239.38, 984.686, 54.5012, 0),
(@PATH, 90, 2242.49, 971.639, 54.5014, 0),
(@PATH, 91, 2248.3, 955.438, 54.5014, 0),
(@PATH, 92, 2254.99, 938.768, 54.4779, 0),
(@PATH, 93, 2261.07, 922.135, 54.5, 0),
(@PATH, 94, 2266.88, 905.883, 54.5, 0),
(@PATH, 95, 2274.21, 888.239, 54.5, 0),
(@PATH, 96, 2279.37, 874.616, 54.5, 0),
(@PATH, 97, 2284.17, 858.54, 54.5, 0),
(@PATH, 98, 2287.07, 842.492, 54.5179, 0),
(@PATH, 99, 2285.06, 822.339, 54.5329, 0),
(@PATH, 100, 2280.85, 810.904, 54.6746, 0),
(@PATH, 101, 2271.04, 797.561, 54.6055, 0),
(@PATH, 102, 2259.76, 781.45, 53.8876, 0),
(@PATH, 103, 2248.5, 765.984, 52.8455, 0),
(@PATH, 104, 2236.45, 751.637, 50.1543, 0),
(@PATH, 105, 2225.2, 738.288, 46.4978, 0),
(@PATH, 106, 2213.97, 724.141, 42.9242, 0),
(@PATH, 107, 2202.25, 709.473, 39.0475, 0),
(@PATH, 108, 2194.26, 696.874, 36.4775, 0),
(@PATH, 109, 2186.81, 684.001, 34.5315, 0),
(@PATH, 110, 2183.46, 671.279, 34.0336, 0),
(@PATH, 111, 2187.66, 685.597, 34.7246, 0),
(@PATH, 112, 2193.64, 696.274, 36.3443, 0),
(@PATH, 113, 2201.04, 707.84, 38.69, 0),
(@PATH, 114, 2211.41, 720.413, 41.9614, 0),
(@PATH, 115, 2220.05, 732.154, 44.9148, 0),
(@PATH, 116, 2231.68, 746.231, 48.6348, 0),
(@PATH, 117, 2243.47, 759.741, 51.9549, 0),
(@PATH, 118, 2255.85, 775.368, 53.5629, 0),
(@PATH, 119, 2266.82, 791.228, 54.4124, 0),
(@PATH, 120, 2279.62, 808.93, 54.6154, 0),
(@PATH, 121, 2288.49, 820.299, 54.508, 0),
(@PATH, 122, 2303.16, 828.045, 54.171, 0),
(@PATH, 123, 2322.33, 836.623, 53.8113, 0),
(@PATH, 124, 2338.3, 843.771, 53.9838, 0),
(@PATH, 125, 2356.31, 849.242, 54.7057, 0),
(@PATH, 126, 2372.63, 855.509, 56.0487, 0),
(@PATH, 127, 2392.92, 860.918, 56.7245, 0),
(@PATH, 128, 2403.8, 863.428, 57.2484, 0),
(@PATH, 129, 2417.72, 868.716, 58.2846, 0),
(@PATH, 130, 2431.94, 873.159, 60.0873, 0),
(@PATH, 131, 2453.95, 877.012, 61.4676, 0),
(@PATH, 132, 2471.19, 880.03, 62.9147, 0),
(@PATH, 133, 2488.42, 883.049, 63.5039, 0),
(@PATH, 134, 2513.13, 884.144, 64.1431, 0),
(@PATH, 135, 2534.12, 884.568, 64.6657, 0),
(@PATH, 136, 2555.08, 885.304, 65.2048, 0),
(@PATH, 137, 2569.07, 885.554, 66.4459, 0),
(@PATH, 138, 2582.07, 884.088, 67.696, 0),
(@PATH, 139, 2593.98, 882.95, 68.0114, 0),
(@PATH, 140, 2614.98, 882.582, 68.4484, 0),
(@PATH, 141, 2625.81, 882.393, 68.6676, 0),
(@PATH, 142, 2633.1, 883.922, 69.0972, 0),
(@PATH, 143, 2646.96, 884.471, 69.7285, 0),
(@PATH, 144, 2648.23, 865.67, 66.7963, 0),
(@PATH, 145, 2644.19, 848.839, 63.8337, 0),
(@PATH, 146, 2644.26, 834.261, 61.4547, 0),
(@PATH, 147, 2650.22, 812.238, 59.5396, 0),
(@PATH, 148, 2648.97, 801.635, 59.0204, 0),
(@PATH, 149, 2640.9, 787.801, 57.6706, 0),
(@PATH, 150, 2626.1, 777.72, 57.2633, 0),
(@PATH, 151, 2616.67, 767.457, 56.6651, 0),
(@PATH, 152, 2613.49, 757.029, 56.3742, 0),
(@PATH, 153, 2613.37, 741.667, 55.9822, 0),
(@PATH, 154, 2619.74, 729.303, 55.5678, 0),
(@PATH, 155, 2630.88, 717.435, 56.0887, 0),
(@PATH, 156, 2639.41, 707.385, 56.074, 0),
(@PATH, 157, 2640.33, 701.769, 56.002, 0),
(@PATH, 158, 2638, 711.757, 56.1583, 0),
(@PATH, 159, 2627.47, 721.829, 55.9278, 0),
(@PATH, 160, 2618, 732.662, 55.6043, 0),
(@PATH, 161, 2612.4, 747.203, 56.2022, 0),
(@PATH, 162, 2615.04, 762.187, 56.5118, 0),
(@PATH, 163, 2619.29, 771.77, 56.8562, 0),
(@PATH, 164, 2626.66, 778.108, 57.286, 0),
(@PATH, 165, 2644.28, 790.759, 57.9907, 0),
(@PATH, 166, 2649.74, 800.614, 58.9864, 0),
(@PATH, 167, 2650.19, 813.604, 59.6128, 0),
(@PATH, 168, 2647.7, 823.968, 60.3343, 0),
(@PATH, 169, 2644.31, 836.22, 61.7544, 0),
(@PATH, 170, 2644.69, 847.637, 63.6237, 0),
(@PATH, 171, 2648.54, 860.659, 65.9248, 0),
(@PATH, 172, 2646.93, 878.184, 69.0024, 0),
(@PATH, 173, 2644.64, 885.239, 69.6836, 0);

-- Aged Dalaran Wizard pathing main Path between Tarren Mill and Southshore
DELETE FROM `creature_formations` WHERE `leaderGUID`=83476;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(83476, 83476, 0, 0, 2, 0, 0),
(83476, 83477, 2, 270, 2, 0, 0);

SET @NPC := 83476;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2484.44, 882.836, 63.4156, 0),
(@PATH, 2, 2510.93, 884.306, 63.9832, 0),
(@PATH, 3, 2539.44, 884.782, 64.7488, 0),
(@PATH, 4, 2564.57, 885.359, 65.7858, 0),
(@PATH, 5, 2580.22, 884.448, 67.5697, 0),
(@PATH, 6, 2600.64, 882.524, 68.1024, 0),
(@PATH, 7, 2618.57, 882.459, 68.4928, 0),
(@PATH, 8, 2646.56, 885.349, 69.7791, 0),
(@PATH, 9, 2647.94, 862.361, 66.1963, 0),
(@PATH, 10, 2644.15, 843.683, 62.9245, 0),
(@PATH, 11, 2645.15, 829.603, 60.8501, 0),
(@PATH, 12, 2649.89, 809.554, 59.4495, 0),
(@PATH, 13, 2647.55, 798.667, 58.7754, 0),
(@PATH, 14, 2638.41, 786, 57.6675, 0),
(@PATH, 15, 2625.34, 776.466, 57.2481, 0),
(@PATH, 16, 2615.74, 765.931, 56.5869, 0),
(@PATH, 17, 2611.94, 751.53, 56.3252, 0),
(@PATH, 18, 2613.24, 738.202, 55.7307, 0),
(@PATH, 19, 2621.66, 727.464, 55.6185, 0),
(@PATH, 20, 2635.37, 713.483, 56.1676, 0),
(@PATH, 21, 2640.86, 702.72, 56.0097, 0),
(@PATH, 22, 2639.43, 692.111, 55.5087, 0),
(@PATH, 23, 2633.71, 674.388, 54.4811, 0),
(@PATH, 24, 2619.19, 672.633, 54.8655, 0),
(@PATH, 25, 2624.72, 672.28, 54.4806, 300000),
(@PATH, 26, 2634.5, 674.4, 54.4789, 0),
(@PATH, 27, 2640.02, 686.749, 55.1281, 0),
(@PATH, 28, 2641.53, 699.248, 55.8583, 0),
(@PATH, 29, 2639.61, 708.263, 56.0874, 0),
(@PATH, 30, 2630.65, 719.151, 56.0962, 0),
(@PATH, 31, 2620.88, 728.317, 55.5883, 0),
(@PATH, 32, 2614.01, 737.448, 55.7114, 0),
(@PATH, 33, 2612.71, 746.896, 56.1872, 0),
(@PATH, 34, 2614.34, 758.087, 56.4286, 0),
(@PATH, 35, 2620.39, 771.216, 56.9779, 0),
(@PATH, 36, 2630.91, 779.742, 57.4555, 0),
(@PATH, 37, 2642.88, 791.11, 57.9629, 0),
(@PATH, 38, 2650.38, 802.874, 59.1506, 0),
(@PATH, 39, 2649.7, 812.675, 59.575, 0),
(@PATH, 40, 2644.98, 829.942, 60.8814, 0),
(@PATH, 41, 2644.41, 840.724, 62.4603, 0),
(@PATH, 42, 2646.98, 855.456, 64.9715, 0),
(@PATH, 43, 2648.87, 870.519, 67.7707, 0),
(@PATH, 44, 2646.21, 884.709, 69.7036, 0),
(@PATH, 45, 2631.29, 884.261, 69.0209, 0),
(@PATH, 46, 2615.04, 883.348, 68.4797, 0),
(@PATH, 47, 2597.47, 883.854, 68.0493, 0),
(@PATH, 48, 2583.38, 884.076, 67.7796, 0),
(@PATH, 49, 2569.03, 885.343, 66.4438, 0),
(@PATH, 50, 2551.47, 885.757, 65.2873, 0),
(@PATH, 51, 2529.49, 884.877, 64.7253, 0),
(@PATH, 52, 2515.88, 884.324, 64.27, 0),
(@PATH, 53, 2494.9, 883.438, 63.7383, 0),
(@PATH, 54, 2476.21, 882.07, 63.1265, 0),
(@PATH, 55, 2463.86, 879.17, 62.4931, 0),
(@PATH, 56, 2437.2, 874.755, 60.551, 0),
(@PATH, 57, 2415.99, 867.724, 58.1546, 0),
(@PATH, 58, 2401.85, 862.609, 57.106, 0),
(@PATH, 59, 2384.78, 859.055, 56.4635, 0),
(@PATH, 60, 2365.69, 852.577, 55.5241, 0),
(@PATH, 61, 2347.16, 847.12, 54.2153, 0),
(@PATH, 62, 2324.49, 837.671, 53.7492, 0),
(@PATH, 63, 2305.17, 829.589, 54.1504, 0),
(@PATH, 64, 2283.7, 819.391, 54.5816, 0),
(@PATH, 65, 2285.78, 832.717, 54.6634, 0),
(@PATH, 66, 2285.61, 848.997, 54.5251, 0),
(@PATH, 67, 2281.22, 866.684, 54.4996, 0),
(@PATH, 68, 2274.42, 886.65, 54.4996, 0),
(@PATH, 69, 2271.8, 896.994, 54.4996, 0),
(@PATH, 70, 2283.58, 912.005, 54.3671, 0),
(@PATH, 71, 2293.96, 921.826, 55.279, 0),
(@PATH, 72, 2309.65, 924.832, 56.0533, 0),
(@PATH, 73, 2326.83, 928.12, 55.0895, 0),
(@PATH, 74, 2338.55, 925.683, 54.7203, 0),
(@PATH, 75, 2338.17, 915.167, 55.198, 0),
(@PATH, 76, 2334.54, 907.066, 57.6645, 0),
(@PATH, 77, 2328.35, 889.876, 57.6674, 0),
(@PATH, 78, 2321.92, 887.23, 57.6692, 0),
(@PATH, 79, 2323.55, 888.326, 57.6692, 300000),
(@PATH, 80, 2329.57, 892.875, 57.6662, 0),
(@PATH, 81, 2334.01, 903.506, 57.6648, 0),
(@PATH, 82, 2340.36, 921.749, 54.5965, 0),
(@PATH, 83, 2334.77, 929.846, 54.9493, 0),
(@PATH, 84, 2316.57, 926.323, 55.4144, 0),
(@PATH, 85, 2300.02, 923.086, 55.9156, 0),
(@PATH, 86, 2282.16, 920.261, 54.368, 0),
(@PATH, 87, 2258.17, 928.854, 54.4995, 0),
(@PATH, 88, 2252.08, 944.634, 54.4912, 0),
(@PATH, 89, 2245.8, 960.966, 54.4995, 0),
(@PATH, 90, 2240.95, 978.309, 54.4996, 0),
(@PATH, 91, 2235.7, 999.538, 54.3791, 0),
(@PATH, 92, 2229.54, 1016.37, 53.5518, 0),
(@PATH, 93, 2213.16, 1020.04, 51.3927, 0),
(@PATH, 94, 2189.38, 1025.91, 47.3435, 0),
(@PATH, 95, 2171.27, 1032.24, 44.2345, 0),
(@PATH, 96, 2148.13, 1040.17, 40.3426, 0),
(@PATH, 97, 2127.85, 1040.17, 37.3234, 0),
(@PATH, 98, 2110.52, 1036.07, 34.628, 0),
(@PATH, 99, 2090.02, 1027.34, 32.6423, 0),
(@PATH, 100, 2072.19, 1024.75, 31.9712, 0),
(@PATH, 101, 2053.09, 1027.53, 30.0452, 0),
(@PATH, 102, 2029.54, 1038.47, 26.9195, 0),
(@PATH, 103, 2009.98, 1040.73, 25.853, 0),
(@PATH, 104, 2001.2, 1039.51, 25.2896, 0),
(@PATH, 105, 1979.32, 1030.49, 24.9552, 0),
(@PATH, 106, 1965.54, 1033.01, 23.7563, 0),
(@PATH, 107, 1951.36, 1045.57, 21.1473, 0),
(@PATH, 108, 1939.54, 1052.06, 20.2084, 0),
(@PATH, 109, 1920.73, 1052.65, 19.2175, 0),
(@PATH, 110, 1904.22, 1053.3, 18.0501, 0),
(@PATH, 111, 1886.72, 1055.3, 18.0974, 0),
(@PATH, 112, 1871.29, 1064.12, 16.6739, 0),
(@PATH, 113, 1846.86, 1076.66, 13.798, 0),
(@PATH, 114, 1837.21, 1077.89, 12.5072, 0),
(@PATH, 115, 1821.72, 1073.54, 11.108, 0),
(@PATH, 116, 1805.24, 1065.43, 8.95542, 0),
(@PATH, 117, 1790.37, 1058.89, 7.72108, 0),
(@PATH, 118, 1765.72, 1060.38, 6.87971, 0),
(@PATH, 119, 1770.31, 1059.76, 6.87971, 120000),
(@PATH, 120, 1783.56, 1058.86, 7.42003, 0),
(@PATH, 121, 1794.47, 1058.99, 7.97726, 0),
(@PATH, 122, 1807.51, 1065.96, 9.21146, 0),
(@PATH, 123, 1825.51, 1074.67, 11.1986, 0),
(@PATH, 124, 1836.73, 1077.79, 12.4331, 0),
(@PATH, 125, 1848.64, 1076.24, 14.0606, 0),
(@PATH, 126, 1858.05, 1071.44, 15.4975, 0),
(@PATH, 127, 1880.12, 1058.81, 17.7728, 0),
(@PATH, 128, 1894.45, 1053.66, 17.8059, 0),
(@PATH, 129, 1913.2, 1053.16, 18.6841, 0),
(@PATH, 130, 1931.36, 1052.92, 19.8936, 0),
(@PATH, 131, 1944.75, 1049.13, 20.5239, 0),
(@PATH, 132, 1954, 1042.49, 21.6457, 0),
(@PATH, 133, 1964.44, 1033.57, 23.6144, 0),
(@PATH, 134, 1975.82, 1029.8, 24.6549, 0),
(@PATH, 135, 1983.12, 1030.86, 25.2257, 0),
(@PATH, 136, 1993.08, 1035.62, 25.3041, 0),
(@PATH, 137, 2007.14, 1040.49, 25.6891, 0),
(@PATH, 138, 2018.65, 1039.88, 26.0706, 0),
(@PATH, 139, 2032.41, 1037.2, 27.1894, 0),
(@PATH, 140, 2047.44, 1029.89, 29.103, 0),
(@PATH, 141, 2062.67, 1025.82, 31.2087, 0),
(@PATH, 142, 2076.92, 1025.55, 32.3808, 0),
(@PATH, 143, 2095.31, 1029.02, 32.8091, 0),
(@PATH, 144, 2105.21, 1033.11, 33.8701, 0),
(@PATH, 145, 2119.91, 1038.25, 36.1388, 0),
(@PATH, 146, 2135.67, 1040.77, 38.3721, 0),
(@PATH, 147, 2145.66, 1040.17, 39.9787, 0),
(@PATH, 148, 2163.14, 1034.74, 42.9007, 0),
(@PATH, 149, 2176.48, 1030.5, 45.1048, 0),
(@PATH, 150, 2193.16, 1025.21, 47.957, 0),
(@PATH, 151, 2206.78, 1021.86, 50.168, 0),
(@PATH, 152, 2217.89, 1019.03, 52.3635, 0),
(@PATH, 153, 2230.66, 1015.18, 53.5869, 0),
(@PATH, 154, 2234.51, 999.913, 54.3663, 0),
(@PATH, 155, 2239.39, 979.488, 54.5038, 0),
(@PATH, 156, 2242.45, 967.077, 54.4997, 0),
(@PATH, 157, 2249.13, 949.697, 54.4922, 0),
(@PATH, 158, 2256.55, 926.348, 54.4994, 0),
(@PATH, 159, 2264.17, 904.88, 54.5049, 0),
(@PATH, 160, 2271.78, 885.601, 54.5015, 0),
(@PATH, 161, 2278.94, 865.297, 54.4758, 0),
(@PATH, 162, 2282.9, 846.983, 54.6272, 0),
(@PATH, 163, 2283.47, 830.009, 54.7596, 0),
(@PATH, 164, 2281.13, 816.505, 54.6117, 0),
(@PATH, 165, 2276.22, 806.486, 54.5153, 0),
(@PATH, 166, 2265.45, 790.047, 54.3814, 0),
(@PATH, 167, 2256.38, 776.214, 53.6021, 0),
(@PATH, 168, 2246.84, 764.769, 52.64, 0),
(@PATH, 169, 2232.98, 748.998, 49.2838, 0),
(@PATH, 170, 2221.36, 734.463, 45.4158, 0),
(@PATH, 171, 2210.83, 720.879, 41.9219, 0),
(@PATH, 172, 2198.42, 706.344, 38.1333, 0),
(@PATH, 173, 2190.49, 692.252, 35.5654, 0),
(@PATH, 174, 2184.56, 676.787, 34.1533, 0),
(@PATH, 175, 2179.64, 658.68, 34.6227, 0),
(@PATH, 176, 2175.14, 641.688, 33.7795, 0),
(@PATH, 177, 2171.76, 621.264, 37.1826, 0),
(@PATH, 178, 2169.33, 603.94, 40.0493, 0),
(@PATH, 179, 2164.37, 580.871, 43.7035, 0),
(@PATH, 180, 2159.85, 568.293, 46.738, 0),
(@PATH, 181, 2151.5, 554.339, 50.1121, 0),
(@PATH, 182, 2139.26, 538.204, 53.8114, 0),
(@PATH, 183, 2124.7, 524.492, 56.6386, 0),
(@PATH, 184, 2112.09, 512.415, 58.9956, 0),
(@PATH, 185, 2101.86, 500.054, 61.4978, 0),
(@PATH, 186, 2093.21, 485.163, 64.4652, 0),
(@PATH, 187, 2087.71, 474.389, 65.8823, 0),
(@PATH, 188, 2081.22, 453.773, 66.213, 0),
(@PATH, 189, 2075.88, 433.463, 66.2423, 0),
(@PATH, 190, 2069.13, 416.607, 66.1058, 0),
(@PATH, 191, 2060.92, 398.711, 66.0681, 0),
(@PATH, 192, 2052.46, 379.493, 65.8712, 0),
(@PATH, 193, 2043.56, 358.103, 66.1094, 0),
(@PATH, 194, 2032.41, 336.363, 66.0943, 0),
(@PATH, 195, 2021.8, 319.675, 66.0953, 0),
(@PATH, 196, 2008.19, 296.626, 66.1349, 0),
(@PATH, 197, 1998.81, 281.854, 66.3684, 0),
(@PATH, 198, 1988.77, 269.184, 67.0842, 0),
(@PATH, 199, 1974.87, 253.446, 67.4902, 0),
(@PATH, 200, 1964.27, 238.185, 67.6519, 0),
(@PATH, 201, 1951.3, 219.171, 68.1409, 0),
(@PATH, 202, 1960.73, 232.116, 67.995, 0),
(@PATH, 203, 1971.48, 247.189, 67.5766, 0),
(@PATH, 204, 1983.39, 261.055, 67.2802, 0),
(@PATH, 205, 1993.67, 273.103, 66.8403, 0),
(@PATH, 206, 2005.65, 288.315, 66.0724, 0),
(@PATH, 207, 2017.05, 307.801, 66.096, 0),
(@PATH, 208, 2028.96, 327.909, 66.1042, 0),
(@PATH, 209, 2037.46, 342.5, 66.0831, 0),
(@PATH, 210, 2042.81, 354.123, 66.1165, 0),
(@PATH, 211, 2051.01, 372.133, 65.9799, 0),
(@PATH, 212, 2059.64, 391.626, 66.0603, 0),
(@PATH, 213, 2067.55, 408.235, 66.0527, 0),
(@PATH, 214, 2073.75, 420.632, 66.1428, 0),
(@PATH, 215, 2076.29, 429.107, 66.2477, 0),
(@PATH, 216, 2080.9, 442.242, 66.309, 0),
(@PATH, 217, 2086.34, 460.101, 66.0378, 0),
(@PATH, 218, 2091.98, 476.118, 65.3368, 0),
(@PATH, 219, 2099.79, 491.783, 62.9201, 0),
(@PATH, 220, 2107.42, 503.331, 60.6828, 0),
(@PATH, 221, 2118.76, 515.219, 58.1502, 0),
(@PATH, 222, 2131.15, 527.571, 55.8886, 0),
(@PATH, 223, 2140.79, 537.176, 53.7152, 0),
(@PATH, 224, 2144.44, 542.761, 52.4192, 0),
(@PATH, 225, 2154.29, 554.481, 49.7551, 0),
(@PATH, 226, 2162.78, 568.52, 46.297, 0),
(@PATH, 227, 2167.29, 582.38, 43.1949, 0),
(@PATH, 228, 2170.78, 595.639, 41.1054, 0),
(@PATH, 229, 2172.34, 615.971, 38.0711, 0),
(@PATH, 230, 2175.06, 634.978, 34.2314, 0),
(@PATH, 231, 2175.95, 643.187, 33.7847, 0),
(@PATH, 232, 2179.23, 655.55, 34.7027, 0),
(@PATH, 233, 2183.32, 670.979, 34.0321, 0),
(@PATH, 234, 2187.82, 683.788, 34.6194, 0),
(@PATH, 235, 2195.17, 695.803, 36.5461, 0),
(@PATH, 236, 2202.93, 707.461, 38.9909, 0),
(@PATH, 237, 2210.51, 717.339, 41.4097, 0),
(@PATH, 238, 2219.58, 728.004, 44.3297, 0),
(@PATH, 239, 2228.47, 739.519, 47.1595, 0),
(@PATH, 240, 2237.1, 750.536, 50.0677, 0),
(@PATH, 241, 2245.74, 761.556, 52.2765, 0),
(@PATH, 242, 2253.97, 771.231, 53.3686, 0),
(@PATH, 243, 2263.02, 783.428, 54.0886, 0),
(@PATH, 244, 2272.15, 797.066, 54.6196, 0),
(@PATH, 245, 2280.73, 809.495, 54.6687, 0),
(@PATH, 246, 2289.92, 821.383, 54.4901, 0),
(@PATH, 247, 2301.29, 827.138, 54.2022, 0),
(@PATH, 248, 2317.03, 833.522, 54.0437, 0),
(@PATH, 249, 2330.66, 838.962, 53.6741, 0),
(@PATH, 250, 2343.41, 845.529, 54.1241, 0),
(@PATH, 251, 2356.85, 849.453, 54.7519, 0),
(@PATH, 252, 2370.29, 853.377, 55.8436, 0),
(@PATH, 253, 2385.63, 858.48, 56.4489, 0),
(@PATH, 254, 2395.35, 860.76, 56.7646, 0),
(@PATH, 255, 2407.88, 863.791, 57.5737, 0),
(@PATH, 256, 2423.09, 869.003, 59.0037, 0),
(@PATH, 257, 2434.44, 872.88, 60.3057, 0),
(@PATH, 258, 2449.86, 876.148, 61.1585, 0),
(@PATH, 259, 2464.5, 879.114, 62.5365, 0);

SET @NPC := 48018;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2051.33, 534.764, 73.7314, 0),
(@PATH, 2, 2051.37, 537.969, 75.5968, 0),
(@PATH, 3, 2052.96, 540.417, 76.9039, 0),
(@PATH, 4, 2055.73, 542.917, 79.0258, 0),
(@PATH, 5, 2062.07, 543.762, 79.1671, 0),
(@PATH, 6, 2065.1, 542.501, 80.8321, 0),
(@PATH, 7, 2067.21, 540.755, 82.38, 0),
(@PATH, 8, 2068.8, 537.769, 84.3815, 0),
(@PATH, 9, 2068.38, 534.491, 84.7589, 0),
(@PATH, 10, 2065.29, 529.092, 85.5457, 0),
(@PATH, 11, 2061.58, 528.074, 87.6418, 0),
(@PATH, 12, 2058.9, 528.056, 89.2877, 0),
(@PATH, 13, 2056.76, 529.256, 89.4443, 0),
(@PATH, 14, 2053.23, 533.893, 89.8688, 0),
(@PATH, 15, 2053.36, 536.69, 91.3677, 0),
(@PATH, 16, 2055.02, 539.629, 92.9179, 0),
(@PATH, 17, 2056.98, 541.084, 93.927, 0),
(@PATH, 18, 2059.3, 541.865, 94.5266, 0),
(@PATH, 19, 2061.57, 541.285, 94.9473, 0),
(@PATH, 20, 2060.64, 535.156, 97.747, 0),
(@PATH, 21, 2059.31, 530.842, 100.531, 0),
(@PATH, 22, 2060.54, 535.707, 97.4071, 0),
(@PATH, 23, 2061.93, 541.194, 94.9474, 0),
(@PATH, 24, 2059.73, 541.924, 94.9474, 0),
(@PATH, 25, 2057.16, 541.141, 94.0179, 0),
(@PATH, 26, 2055.08, 539.1, 92.7484, 0),
(@PATH, 27, 2053.35, 535.673, 90.6795, 0),
(@PATH, 28, 2053.57, 533.008, 89.5515, 0),
(@PATH, 29, 2056.91, 529.125, 89.4441, 0),
(@PATH, 30, 2059.6, 527.72, 88.9857, 0),
(@PATH, 31, 2062.49, 528.05, 87.0064, 0),
(@PATH, 32, 2066.5, 529.085, 85.2376, 0),
(@PATH, 33, 2068.44, 534.399, 84.7585, 0),
(@PATH, 34, 2068.97, 537.733, 84.4412, 0),
(@PATH, 35, 2067.32, 540.688, 82.4334, 0),
(@PATH, 36, 2065.05, 542.714, 80.7385, 0),
(@PATH, 37, 2061.49, 543.768, 79.1515, 0),
(@PATH, 38, 2056.66, 542.996, 79.1417, 0),
(@PATH, 39, 2052.79, 540.14, 76.7666, 0),
(@PATH, 40, 2051.49, 537.149, 75.2349, 0),
(@PATH, 41, 2051.51, 534, 73.454, 0),
(@PATH, 42, 2053.59, 529.433, 73.3263, 0),
(@PATH, 43, 2056.51, 526.283, 72.3833, 0),
(@PATH, 44, 2059.3, 525.417, 71.1581, 0),
(@PATH, 45, 2065.27, 527.393, 70.1031, 0),
(@PATH, 46, 2065.1, 541.582, 65.4417, 0),
(@PATH, 47, 2051.87, 540.313, 65.4373, 0),
(@PATH, 48, 2038.58, 546.649, 65.4359, 0),
(@PATH, 49, 2052.26, 540.102, 65.4373, 0),
(@PATH, 50, 2065.8, 541.531, 65.4401, 0),
(@PATH, 51, 2070, 536.38, 65.7323, 0),
(@PATH, 52, 2069.49, 531.268, 67.8543, 0),
(@PATH, 53, 2065.26, 526.944, 70.2077, 0),
(@PATH, 54, 2059.02, 525.775, 71.3116, 0),
(@PATH, 55, 2056.32, 527.167, 72.5036, 0),
(@PATH, 56, 2053.58, 529.718, 73.3264, 0);

-- -------------Guard
-- Guards In Tower Near Southshore and Terran Mill
DELETE FROM `creature_formations` WHERE `leaderGUID`=44653;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(44653, 44653, 0, 0, 2, 0, 0),
(44653, 44656, 0, 0, 2, 0, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=46842;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(46842, 46842, 0, 0, 2, 0, 0),
(46842, 46850, 0, 0, 2, 0, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=31908;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(31908, 31908, 0, 0, 2, 0, 0),
(31908, 47583, 0, 0, 2, 0, 0),
(31908, 47894, 0, 0, 2, 0, 0);

-- Innkeeper in Terran Mill
SET @NPC := 83455;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2659.13, 661.505, 57.1724, 0),
(@PATH, 2, 2666.43, 656.46, 57.6475, 0),
(@PATH, 3, 2665.61, 653.988, 57.6495, 0),
(@PATH, 4, 2666.8, 656.365, 57.6495, 0),
(@PATH, 5, 2662.14, 659.49, 57.1598, 0),
(@PATH, 6, 2659.78, 661.332, 57.1711, 0),
(@PATH, 7, 2656.51, 662.994, 57.1711, 0),
(@PATH, 8, 2661.96, 673.283, 57.1711, 0),
(@PATH, 9, 2657.29, 664.071, 57.1711, 0),
(@PATH, 10, 2651.64, 666.535, 57.1711, 0),
(@PATH, 11, 2654.13, 671.54, 57.1711, 0),
(@PATH, 12, 2651.96, 667.148, 57.1711, 0),
(@PATH, 13, 2654.05, 665.667, 57.1711, 0),
(@PATH, 14, 2653.07, 662.969, 57.1724, 5000),
(@PATH, 15, 2654.46, 665.262, 57.1724, 0),
(@PATH, 16, 2658.31, 661.64, 57.1724, 0),
(@PATH, 17, 2666.47, 656.886, 57.6466, 8000),
(@PATH, 18, 2661.97, 659.914, 57.1601, 0),
(@PATH, 19, 2659.86, 657.466, 57.1623, 5000),
(@PATH, 20, 2661.44, 662.396, 57.1711, 8000),
(@PATH, 21, 2657.02, 663.077, 57.1711, 0);

-- ===========
-- Orcs In Pit
-- ===========
UPDATE `creature` SET `position_x` = 2115.998779, `position_y` = 42.767368, `position_z` = 54.557854, `orientation` = 3.667591 WHERE `guid` = 83918;
DELETE FROM `creature_addon` WHERE `guid` IN (83918);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83918,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2104.535889, `position_y` = 56.620735, `position_z` = 54.242908, `orientation` = 4.917089 WHERE `guid` = 83916;
DELETE FROM `creature_addon` WHERE `guid` IN (83916);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83916,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2066.981934, `position_y` = 67.596283, `position_z` = 54.343513, `orientation` = 6.107752 WHERE `guid` = 83925;
DELETE FROM `creature_addon` WHERE `guid` IN (83925);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83925,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2072.802490, `position_y` = 88.352287, `position_z` = 54.845284, `orientation` = 3.299170 WHERE `guid` = 83946;
DELETE FROM `creature_addon` WHERE `guid` IN (83946);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83946,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2062.651367, `position_y` = 112.068413, `position_z` = 55.389854, `orientation` = 1.968705 WHERE `guid` = 83919;
DELETE FROM `creature_addon` WHERE `guid` IN (83919);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83919,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2058.154053, `position_y` = 117.512825, `position_z` = 55.403820, `orientation` = 5.780243 WHERE `guid` = 83920;
DELETE FROM `creature_addon` WHERE `guid` IN (83920);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83920,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2208.021240, `position_y` = 267.573883, `position_z` = 54.778271, `orientation` = 4.669735 WHERE `guid` = 83964;
DELETE FROM `creature_addon` WHERE `guid` IN (83964);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83964,0,0,3,0,0, '');

UPDATE `creature` SET `position_x` = 2224.651367, `position_y` = 247.469345, `position_z` = 53.833801, `orientation` = 2.452557 WHERE `guid` = 83965;
DELETE FROM `creature_addon` WHERE `guid` IN (83965);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83965,0,0,1,0,0, '');

UPDATE `creature` SET `position_x` = 2105.004150, `position_y` = 90.833382, `position_z` = 53.709354, `orientation` = 2.033894 WHERE `guid` = 83456;
DELETE FROM `creature_addon` WHERE `guid` IN (83456);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83456,0,0,1,0,0, '');

UPDATE `creature` SET `position_x` = 2106.529785, `position_y` = 99.617836, `position_z` = 53.004929, `orientation` = 3.877224 WHERE `guid` = 83915;
DELETE FROM `creature_addon` WHERE `guid` IN (83915);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83915,0,0,1,0,0, '');

UPDATE `creature` SET `position_x` = 2097.408936, `position_y` = 96.302238, `position_z` = 53.166386, `orientation` = 6.253055 WHERE `guid` = 83914;
DELETE FROM `creature_addon` WHERE `guid` IN (83914);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83914,0,0,1,0,0, '');

UPDATE `creature` SET `position_x` = 2178.179443, `position_y` = 235.513840, `position_z` = 52.484241, `orientation` = 5.307471 WHERE `guid` = 83952;
DELETE FROM `creature_addon` WHERE `guid` IN (83952);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(83952,0,0,1,0,0, '');

UPDATE `creature` SET `position_x` = 2070.596924, `position_y` = 128.493576, `position_z` = 54.269028, `orientation` = 1.757468, `SpawnDist` = 5, `MovementType` = 1 WHERE `guid` = 83921;

UPDATE `creature` SET `position_x` = 2103.312012, `position_y` = 79.108421, `position_z` = 52.891743, `orientation` = 2.787092, `SpawnDist`=10, `MovementType`=1 WHERE `guid` = 83917;

UPDATE `creature` SET `SpawnDist` = 5, `MovementType` = 1 WHERE `guid` IN (83953,83954,83957);

SET @NPC := 83947;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 2180.82, 233.922, 52.4421, 0),
(@PATH, 2, 2190.96, 246.4, 52.5535, 0),
(@PATH, 3, 2183.91, 242.109, 52.8828, 0),
(@PATH, 4, 2178.55, 227.63, 52.4409, 0),
(@PATH, 5, 2158.69, 218.061, 52.536, 0),
(@PATH, 6, 2147.28, 209.24, 52.8493, 0),
(@PATH, 7, 2137.69, 195.197, 52.4411, 0),
(@PATH, 8, 2128.08, 184.306, 52.7819, 0),
(@PATH, 9, 2121.61, 171.933, 52.7363, 0),
(@PATH, 10, 2111.17, 158.333, 52.441, 0),
(@PATH, 11, 2105.6, 139.581, 52.8057, 0),
(@PATH, 12, 2094.98, 124.519, 52.4842, 0),
(@PATH, 13, 2092.72, 96.002, 52.4763, 0),
(@PATH, 14, 2091.2, 76.6567, 52.8143, 0),
(@PATH, 15, 2078.5, 69.1538, 53.7881, 0),
(@PATH, 16, 2072.3, 67.2213, 53.7802, 0),
(@PATH, 17, 2068.55, 74.1697, 53.7048, 0),
(@PATH, 18, 2061.92, 89.1792, 54.1012, 0),
(@PATH, 19, 2067.51, 74.6493, 53.7406, 0),
(@PATH, 20, 2072.52, 67.0591, 53.7853, 0),
(@PATH, 21, 2080.31, 69.6531, 53.7724, 0),
(@PATH, 22, 2089.71, 73.7002, 52.751, 0),
(@PATH, 23, 2105.1, 66.6614, 52.5804, 0),
(@PATH, 24, 2115.84, 65.2019, 52.6007, 0),
(@PATH, 25, 2107.39, 83.1457, 53.3359, 0),
(@PATH, 26, 2093.76, 89.7505, 52.4537, 0),
(@PATH, 27, 2096.11, 107.581, 52.7549, 0),
(@PATH, 28, 2101.5, 127.271, 52.5706, 0),
(@PATH, 29, 2108.5, 146.257, 52.4418, 0),
(@PATH, 30, 2115.04, 159.756, 52.5111, 0),
(@PATH, 31, 2120.53, 167.026, 52.6508, 0),
(@PATH, 32, 2124.68, 178.425, 52.634, 0),
(@PATH, 33, 2131.69, 188.464, 52.5914, 0),
(@PATH, 34, 2141.64, 198.599, 52.4418, 0),
(@PATH, 35, 2153.1, 209.287, 53.1284, 0),
(@PATH, 36, 2167.16, 227.906, 52.4409, 0),
(@PATH, 37, 2163.87, 233.083, 52.4411, 0),
(@PATH, 38, 2157.18, 241.131, 53.8787, 0),
(@PATH, 39, 2158.75, 247.807, 53.9186, 0),
(@PATH, 40, 2166.33, 247.603, 53.7073, 0),
(@PATH, 41, 2158.31, 238.862, 53.8797, 0),
(@PATH, 42, 2167.1, 228.618, 52.4411, 0),
(@PATH, 43, 2180.26, 229.167, 52.4411, 0),
(@PATH, 44, 2187.37, 241.135, 52.6137, 0);

-- ======================
-- Gameobject Spawn Fixes 
-- ======================
-- Minerals and Herbs Not Spawned in Heroic Mode
UPDATE `gameobject` SET `SpawnMask` = 3, `SpawnTimeSecs` = 86400 WHERE `map`=560 AND `ID` IN (181270,181275,181276,181278,181556,181569);

-- ===========================================
-- Creature Spawn Time Fixes (24 Hour Respawn) - Confirmed No Special Short Spawn Time NPC
-- ===========================================
UPDATE `creature` SET `SpawnTimeSecs` = 86400 WHERE `map` IN (560);
UPDATE `creature` SET `SpawnTimeSecs` = 180 WHERE `map` IN (560) AND id IN (2350,2385,2408,2354);-- ('1485721126246629100');
-- [NPC][WOTLK] Argent Cannon
UPDATE `creature` SET `curmana`=0 WHERE `id`=30236;
UPDATE `creature_template` SET `VehicleId`=244 WHERE `entry`=30236;-- ('1485734753369055900');
-- SET run_speed of (Thunder BluffSilvermoon, Undercity, Stormwind, Ironforge, Exodar, Gnomeregan and Darnassus Champion(s) from 2 to 1.38571)
UPDATE `creature_template` SET `speed_run` = 1.38571  WHERE `entry` IN (35325, 35326, 35327, 35328, 35329, 35330, 35331, 35332);

-- SET run_speed of (Colosos, Marshal Jacob Alerius, Ambrose Boltspark, Lana Stouthammer and Jaelyne Evensong from 2 to 1.14286)
UPDATE `creature_template` SET `speed_run` = 1.14286  WHERE `entry` IN (34657, 34701, 34702, 34703, 34705);
-- ('1488624024177848700');
UPDATE `creature_text`SET `entry`=28472 WHERE `entry` IN(2847206);


-- ('1488726006291826600');
SET @NPC:= 25968;
UPDATE `creature_template` SET `VehicleId`=30 WHERE `entry`=@NPC;
DELETE FROM `vehicle_template_accessory` where `entry` in (@NPC) AND `accessory_entry` IN (25801);
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(@NPC,25801,0,0,'Lunchbox',8,0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = @NPC;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(@NPC, 46598, 1, 0);

-- Nedar, Lord of Rhinos SAI
SET @ENTRY := 25801;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - On Aggro - Say Line 0 (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - On Aggro - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,3,0,4,1,100,1,0,0,0,0,11,41440,0,0,0,0,0,2,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - On Aggro - Cast 'Shoot' (Phase 1) (No Repeat)"),
(@ENTRY,0,4,0,9,1,100,0,5,30,3500,4100,11,41440,0,0,0,0,0,2,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - Within 5-30 Range - Cast 'Shoot' (Phase 1)"),
(@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - Within 30-100 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - Within 9-15 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - Within 0-5 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - Within 5-30 Range - Disable Combat Movement (Phase 1)");
-- Complete the Broadcast_text
DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `TextRange`) VALUES
(@ENTRY, 0, 0, 'Your impetuousness will be your end!', 12, 0, 100, 0, 0, 0, 'Nedar', 25103),
(@ENTRY, 0, 1, 'You dare challenge Nedar, lord of the tundral!?', 12, 0, 100, 0, 0, 0, 'Nedar', 25102),
(@ENTRY, 0, 2, 'You don''t stand a chance!', 12, 0, 100, 0, 0, 0, 'Nedar', 25104);

-- Pathing for  Entry: 25968 'TDB FORMAT' 
SET @NPC := 106302;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3170.232,`position_y`=5968.757,`position_z`=96.36165 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3170.232,5968.757,96.36165,0,0,0,0,100,0),
(@PATH,2,3159.33,5950.815,95.96857,0,0,0,0,100,0),
(@PATH,3,3162.685,5902.838,96.0918,0,0,0,0,100,0),
(@PATH,4,3169.452,5888.983,97.71611,0,0,0,0,100,0),
(@PATH,5,3204.079,5874.618,97.02065,0,0,0,0,100,0),
(@PATH,6,3238.726,5868.98,94.07452,0,0,0,0,100,0),
(@PATH,7,3266.804,5867.507,86.87187,0,0,0,0,100,0),
(@PATH,8,3300.308,5874.12,83.72194,0,0,0,0,100,0),
(@PATH,9,3328.993,5853.078,78.86817,0,0,0,0,100,0),
(@PATH,10,3344.677,5812.18,67.82541,0,0,0,0,100,0),
(@PATH,11,3341.184,5774.667,61.2993,0,0,0,0,100,0),
(@PATH,12,3357.205,5767.466,65.42284,0,0,0,0,100,0),
(@PATH,13,3357.227,5799.264,67.74834,0,0,0,0,100,0),
(@PATH,14,3359.967,5824.072,71.90356,0,0,0,0,100,0),
(@PATH,15,3354.479,5873.997,76.9686,0,0,0,0,100,0),
(@PATH,16,3341.863,5907.724,79.92758,0,0,0,0,100,0),
(@PATH,17,3316.034,5925.089,85.70946,0,0,0,0,100,0),
(@PATH,18,3293.812,5947.116,82.76896,0,0,0,0,100,0);
-- 0x2009144760195C0000000C000057E949 .go 3170.232 5968.757 96.36165


-- ('1488798687580958500');
DELETE FROM `creature_addon` WHERE `guid` IN (107122, 107123, 107124, 107130, 107029);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(107122, 0, 0, 0, 1, 0, '50503'), -- 28025 - 50503 - 50503
(107123, 0, 0, 0, 1, 0, '50503'), -- 28025 - 50503 - 50503
(107124, 0, 0, 0, 1, 0, '50503'), -- 28025 - 50503 - 50503
(107130, 0, 0, 0, 1, 0, '50503 52102'), -- 28025 - 50503 - 50503
(107029, 0, 0, 0, 1, 0, '50917'); -- 28024 - 50917 - 50917


DELETE FROM `creature_formations` WHERE `leaderGUID`= 118178;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(118178,118178,0,0,2,0,0),
(118178,118180,2,290,2,0,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`= 118181;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(118181,118181,0,0,2,0,0),
(118181,118179,2,70,2,0,0);

UPDATE `creature` SET `spawndist` = 0 , `MovementType` = 0 WHERE `guid` IN (107029, 107130); 
UPDATE `creature` SET `position_x` = 5674.187 , `position_y` = 4603.267 , `position_z` = -137.191 WHERE `guid` = 107029; 


-- Pathing for Rainspeaker Oracle Entry: 28025 'TDB FORMAT' 
SET @NPC := 107124;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5650.549,`position_y`=4581.872,`position_z`=-137.3909 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5650.549,4581.872,-137.3909,0,0,0,0,100,0), -- 21:03:30
(@PATH,2,5672.96,4587.905,-134.6465,0,0,0,0,100,0), -- 21:03:39
(@PATH,3,5698.817,4588.952,-125.194,0,0,0,0,100,0), -- 21:03:49
(@PATH,4,5705.767,4581.825,-119.9322,6.200202,5000,0,0,100,0), -- 21:04:00
(@PATH,5,5695.923,4590.621,-126.2863,0,0,0,0,100,0), -- 21:03:49
(@PATH,6,5678.215,4589.218,-133.0249,0,0,0,0,100,0), -- 21:04:13
(@PATH,7,5658.794,4585.683,-136.1378,0,0,0,0,100,0), -- 21:04:27
(@PATH,8,5625.052,4573.458,-137.703,3.624144,55000,0,0,100,0), -- 21:04:35
(@PATH,9,5650.549,4581.872,-137.3909,0,0,0,0,100,0); -- 21:05:34


-- Pathing for Gorloc Hatchling Entry: 28140 'TDB FORMAT' 
SET @NPC := 118181;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5637.416,`position_y`=4595.454,`position_z`=-137.2239 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5637.416,4595.454,-137.2239,0,0,1,0,100,0), -- 21:02:43
(@PATH,2,5642.184,4611.476,-134.7247,0,0,1,0,100,0), -- 21:02:46
(@PATH,3,5655.648,4612.583,-133.3453,0,0,1,0,100,0), -- 21:02:48
(@PATH,4,5658.208,4603.957,-134.7711,0,0,1,0,100,0), -- 21:02:50
(@PATH,5,5668.683,4583.652,-135.4119,0,0,1,0,100,0), -- 21:02:52
(@PATH,6,5670.186,4581.974,-136.0505,0.4537856,10000,1,0,100,0), -- 21:02:56
(@PATH,7,5682.068,4580.444,-134.4037,0,0,1,0,100,0), -- 21:03:05
(@PATH,8,5698.051,4567.978,-129.0662,0,0,1,0,100,0), -- 21:03:06
(@PATH,9,5680.886,4564.793,-133.685,0,3000,1,0,100,0), -- 21:03:08
(@PATH,10,5655.097,4576.272,-136.5881,0,0,1,0,100,0), -- 21:03:20
(@PATH,11,5641.471,4576.043,-137.6747,0,0,1,0,100,0), -- 21:03:23
(@PATH,12,5638.296,4570.477,-137.1636,0,0,1,0,100,0), -- 21:03:24
(@PATH,13,5645.734,4563.63,-134.6706,0,0,1,0,100,0), -- 21:03:25
(@PATH,14,5646.459,4563.039,-134.6787,0,10000,1,0,100,0), -- 21:03:26
(@PATH,15,5645.932,4575.221,-137.0915,0,0,1,0,100,0), -- 21:03:37
(@PATH,16,5637.424,4595.413,-137.2054,0,0,1,0,100,0); -- 21:03:40


-- Pathing for Gorloc Hatchling Entry: 28140 'TDB FORMAT' 
SET @NPC := 118178;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5629.266,`position_y`=4611.305,`position_z`=-136.869 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5629.266,4611.305,-136.869,0,0,1,0,100,0), -- 21:02:45
(@PATH,2,5627.232,4618.4,-135.7587,0,0,1,0,100,0), -- 21:02:46
(@PATH,3,5607.584,4623.498,-136.7098,0,7000,1,0,100,0), -- 21:02:48
(@PATH,4,5583.438,4620.037,-136.7961,0,0,1,0,100,0), -- 21:03:02
(@PATH,5,5567.276,4620.011,-136.7031,0,0,1,0,100,0), -- 21:03:04
(@PATH,6,5551.069,4606.722,-132.1287,0,0,1,0,100,0), -- 21:03:05
(@PATH,7,5550.813,4596.588,-131.6744,0,0,1,0,100,0), -- 21:03:08
(@PATH,8,5582.382,4591.426,-137.7399,0,0,1,0,100,0), -- 21:03:10
(@PATH,9,5557.418,4592.301,-133.0564,0,0,1,0,100,0), -- 21:03:14
(@PATH,10,5555.726,4575.782,-135.4762,0,0,1,0,100,0), -- 21:03:17
(@PATH,11,5565.243,4559.398,-136.6539,0,0,1,0,100,0), -- 21:03:21
(@PATH,12,5593.586,4553.95,-135.5951,0,0,1,0,100,0), -- 21:03:24
(@PATH,13,5601.106,4560.068,-132.6202,0,0,1,0,100,0), -- 21:03:26
(@PATH,14,5602.62,4561.788,-132.6895,2.391101,15000,1,0,100,0), -- 21:03:29
(@PATH,15,5581.576,4572.833,-138.8004,0,0,1,0,100,0), -- 21:03:50
(@PATH,16,5585.17,4575.303,-139.9812,0,0,1,0,100,0), -- 21:03:53
(@PATH,17,5598.924,4583.062,-140.2092,0,0,1,0,100,0), -- 21:03:55
(@PATH,18,5615.134,4599.039,-139.1217,0,0,1,0,100,0), -- 21:03:58
(@PATH,19,5625.804,4600.934,-136.86,0,0,1,0,100,0), -- 21:04:01
(@PATH,20,5628.201,4600.755,-136.8774,4.959375,10000,1,0,100,0), -- 21:04:03
(@PATH,21,5629.266,4611.305,-136.869,0,0,1,0,100,0); -- 21:02:45

-- Gorloc Hatchling SAI
SET @GUID := -118178;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=28140;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,34,0,100,0,2,13,0,0,17,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 13 - Set Emote State 1"),
(@GUID,0,1,0,34,0,100,0,2,2,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 2 - Set Emote State 173"),
(@GUID,0,2,3,34,0,100,0,2,19,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 19 - Play Emote 25"),
(@GUID,0,3,0,61,0,100,0,2,19,0,0,17,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 19 - Set Emote State 1");

-- Gorloc Hatchling SAI
SET @GUID := -118181;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=28140;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,1,34,0,100,0,2,5,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 5 - Play Emote 25"),
(@GUID,0,1,0,61,0,100,0,2,5,0,0,17,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 5 - Set Emote State 1"),
(@GUID,0,2,0,34,0,100,0,2,13,0,0,17,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorloc Hatchling - On Reached Point 13 - Set Emote State 1");

-- Rainspeaker Oracle SAI
SET @ENTRY := 28025;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,6000,8000,11,15305,64,0,0,0,0,2,0,0,0,0,0,0,0,"Rainspeaker Oracle - Combat CMC - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,12000,15000,11,54919,1,0,0,0,0,5,0,0,0,0,0,0,0,"Rainspeaker Oracle - Combat - Cast 'Warped Armor'"),
(@ENTRY,0,2,0,25,0,100,0,0,0,0,0,11,50503,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rainspeaker Oracle - On Reset - Cast 'Rainspeaker Oracle State'");

-- Rainspeaker Warrior SAI
SET @GUID := -107029;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=28024;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,0,0,100,0,3000,7000,5000,8000,11,50533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rainspeaker Warrior - In Combat - Cast 'Flip Attack'"),
(@GUID,0,1,0,4,0,100,0,0,0,0,0,28,50917,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rainspeaker Warrior - On Aggro - Remove Aura 'Sleeping Sleep'");

-- Rainspeaker Oracle SAI
SET @GUID := -107130;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=28025;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,0,0,100,0,0,0,6000,8000,11,15305,64,0,0,0,0,2,0,0,0,0,0,0,0,"Rainspeaker Oracle - Combat CMC - Cast 'Chain Lightning'"),
(@GUID,0,1,0,0,0,100,0,3000,6000,12000,15000,11,54919,1,0,0,0,0,5,0,0,0,0,0,0,0,"Rainspeaker Oracle - Combat - Cast 'Warped Armor'"),
(@GUID,0,2,0,25,0,100,0,0,0,0,0,11,50503,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rainspeaker Oracle - On Reset - Cast 'Rainspeaker Oracle State'"),
(@GUID,0,3,0,4,0,100,0,0,0,0,0,28,52102,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rainspeaker Oracle - On Aggro - Remove Aura 'Gorloc Sleep'");



-- ('1488880461400153400');
DELETE FROM `creature_addon` WHERE `guid` = 114140;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(114140, 0, 0, 0, 1, 0, ''); -- 28097 - 51344 - 51344

-- Pitch SAI
SET @ENTRY := 28097;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,512,5,30,9000,12000,11,54487,2,0,0,0,0,2,0,0,0,0,0,0,0,"Pitch - Within 5-30 Range - Cast 'Jump Attack' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,512,5000,8000,7000,13000,11,24332,2,0,0,0,0,2,0,0,0,0,0,0,0,"Pitch - In Combat - Cast 'Rake' (No Repeat)"),
(@ENTRY,0,2,0,11,0,100,512,0,0,0,0,45,1,1,0,0,0,0,9,28095,0,200,0,0,0,0,"Pitch - On Respawn - Set Data 1 1 (No Repeat)"),
(@ENTRY,0,3,0,6,0,100,512,0,0,0,0,45,1,2,0,0,0,0,9,28095,0,200,0,0,0,0,"Pitch - On Just Died - Set Data 1 2 (No Repeat)"),
(@ENTRY,0,4,0,4,0,100,512,0,0,0,0,45,1,3,0,0,0,0,9,28095,0,200,0,0,0,0,"Pitch - On Aggro - Set Data 1 3 (No Repeat)"),
(@ENTRY,0,5,0,7,0,100,512,0,0,0,0,45,1,4,0,0,0,0,9,28095,0,200,0,0,0,0,"Pitch - On Evade - Set Data 1 4 (No Repeat)"),
(@ENTRY,0,6,0,1,0,100,0,1000,1000,8000,8000,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pitch - Out of Combat - Play Emote 35");




-- ('1488880633534999000');
	-- Pathing for Venomtip Entry: 28358 'TDB FORMAT' 
SET @NPC := 114670;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5744.435,`position_y`=4404.204,`position_z`=-155.8173 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5744.435,4404.204,-155.8173,0,0,0,0,100,0), -- 20:12:40
(@PATH,2,5715.645,4401.772,-153.2857,0,0,0,0,100,0), -- 20:12:52
(@PATH,3,5705.375,4395.701,-143.6391,0,0,0,0,100,0), -- 20:13:04
(@PATH,4,5705.622,4389.093,-143.1557,0,0,0,0,100,0), -- 20:13:10
(@PATH,5,5709.83,4376.562,-139.9715,0,0,0,0,100,0), -- 20:13:13
(@PATH,6,5715.95,4373.072,-138.6089,0,0,0,0,100,0), -- 20:13:19
(@PATH,7,5731.555,4385.193,-136.1523,1.161770,50000,0,0,100,0), -- 20:13:25
(@PATH,8,5724.199,4381.691,-138.8936,0,0,0,0,100,0), -- 20:14:21
(@PATH,9,5704.81,4390.143,-143.2419,0,0,0,0,100,0), -- 20:14:32
(@PATH,10,5708.165,4396.367,-146.6284,0,0,0,0,100,0), -- 20:14:41
(@PATH,11,5725.642,4404.539,-155.5634,0,0,0,0,100,0), -- 20:14:52
(@PATH,12,5760.399,4425.273,-142.3246,0,0,0,0,100,0), -- 20:15:02
(@PATH,13,5769.836,4447.699,-136.3267,0,0,0,0,100,0), -- 20:15:13
(@PATH,14,5771.975,4460.357,-133.9554,0,0,0,0,100,0), -- 20:15:23
(@PATH,15,5780.781,4464.373,-132.3605,0,0,0,0,100,0), -- 20:15:29
(@PATH,16,5785.139,4465.843,-131.7293,0,0,0,0,100,0), -- 20:15:34
(@PATH,17,5780.612,4451.286,-133.4964,0,0,0,0,100,0), -- 20:15:38
(@PATH,18,5772.853,4435.489,-138.0123,0,0,0,0,100,0), -- 20:15:42
(@PATH,19,5770.67,4424.073,-142.0041,0,0,0,0,100,0), -- 20:15:49
(@PATH,20,5768.662,4419.837,-143.741,4.185554,80000,0,0,100,0); -- 20:17:16



-- ('1488923537207948700');
-- Burning Skeleton SAI
SET @ENTRY := 31048;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,23,0,100,0,58627,0,0,0,11,58627,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Has Aura 'Immolation' - Cast 'Immolation'"),
(@ENTRY,0,1,0,61,0,100,0,58627,0,0,0,11,58594,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Has Aura 'Immolation' - Cast 'Skeleton Check Master'"),
(@ENTRY,0,2,3,31,0,100,0,58593,0,0,0,86,58599,2,23,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Target Spellhit 'Skeleton Check' - Cross Cast 'Abom Credit'"),
(@ENTRY,0,3,4,61,0,100,0,58593,0,0,0,28,58594,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Target Spellhit 'Skeleton Check' - Remove Aura 'Skeleton Check Master'"),
(@ENTRY,0,4,0,61,0,100,0,58593,0,0,0,11,58596,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Target Spellhit 'Skeleton Check' - Cast 'Abomination Explosion'");

UPDATE `creature_text` SET TextRange = 0 WHERE TextRange = 255;

-- Shoot em up
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56578 AND `ElseGroup`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 3, 56578, 0, 1, 31, 0, 3, 30330, 0, 0, 0, 0, '', 'Spell Rapid-Fire Harpoon targets only Jotunheim Proto-Drake');


UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`=`flags_extra`|64 WHERE `entry`=30330;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30330 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(30330, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jotunheim Proto-Drake - On Reset - Set Active');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=30337 AND `SourceEntry`=43671;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(18, 30337, 43671, 0, 0, 9, 0, 13069, 0, 0, 0, 0, 0, '', "Spellclick requires Active (taken) quest Shoot 'Em Up.");

-- Burning Skeleton SAI
SET @ENTRY := 31048;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,23,0,100,0,58627,0,0,0,11,58627,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Has Aura 'Immolation' - Cast 'Immolation'"),
(@ENTRY,0,1,0,61,0,100,0,58627,0,0,0,11,58594,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Has Aura 'Immolation' - Cast 'Skeleton Check Master'"),
(@ENTRY,0,2,3,31,0,100,0,58593,0,0,0,86,58599,2,23,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Target Spellhit 'Skeleton Check' - Cross Cast 'Abom Credit'"),
(@ENTRY,0,3,4,61,0,100,0,58593,0,0,0,28,58594,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Target Spellhit 'Skeleton Check' - Remove Aura 'Skeleton Check Master'"),
(@ENTRY,0,4,0,61,0,100,0,58593,0,0,0,11,58596,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skeleton - On Target Spellhit 'Skeleton Check' - Cast 'Abomination Explosion'");

-- no xp
UPDATE `creature_template` SET `flags_extra`=64 WHERE `entry`=30593;
UPDATE `creature_template` SET `flags_extra`=64 WHERE `entry`=30575;