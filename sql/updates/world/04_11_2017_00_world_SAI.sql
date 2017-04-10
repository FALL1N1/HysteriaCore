-- Crusader Lamoof SAI
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 28142);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28142, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 50681, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Just Summoned - Cast \'Bleeding Out\''),
(28142, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Waypoint 5 Reached - Store Targetlist (No Repeat)'),
(28142, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Waypoint 5 Reached - Start Follow Invoker (No Repeat)'),
(28142, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Waypoint 5 Reached - Set Event Phase 1 (No Repeat)'),
(28142, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Waypoint 5 Reached - Remove Flag Standstate Sit Down (No Repeat)'),
(28142, 0, 5, 0, 23, 1, 100, 1, 50681, 0, 0, 0, 80, 2814200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Has Aura \'Bleeding Out\' - Run Script (No Repeat)'),
(28142, 0, 6, 7, 40, 0, 100, 1, 5, 0, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Waypoint 5 Reached - Set Flag Standstate Sit Down (No Repeat)'),
(28142, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Despawn In 20000 ms'),
(28142, 0, 8, 9, 8, 1, 100, 0, 50669, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Quest Credit\' - Set Event Phase 2 (Phase 1)'),
(28142, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50683, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Quest Credit\' - Cast \'Kill Credit Lamoof 01\' (Phase 1)'),
(28142, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50723, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Quest Credit\' - Cast \'Strip Aura Lamoof 01\' (Phase 1)'),
(28142, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 86, 50684, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Cross Cast \'Lamoof Kill Credit\''),
(28142, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 86, 50722, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Cross Cast \'Strip Aura Lamoof\''),
(28142, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Stop Follow '),
(28142, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Say Line 0'),
(28142, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, 28142, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Start Waypoint'),
(28142, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Lamoof - On Spellhit \'Resuscitate\' - Remove Npc Flag Gossip');

-- Crusader Josephine SAI
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 28148);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28148, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 50695, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Cast \'Bleeding Out\''),
(28148, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Spellhit \'Resuscitate\' - Store Targetlist'),
(28148, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Waypoint 4 Reached - Start Follow Invoker (No Repeat)'),
(28148, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Waypoint 4 Reached - Set Event Phase 1 (No Repeat)'),
(28148, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Waypoint 4 Reached - Remove Flag Standstate Sit Down (No Repeat)'),
(28148, 0, 5, 0, 23, 1, 100, 1, 50695, 0, 0, 0, 80, 2814800, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Has Aura \'Bleeding Out\' - Run Script (No Repeat)'),
(28148, 0, 6, 7, 40, 0, 100, 1, 4, 0, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Waypoint 4 Reached - Set Flag Standstate Sit Down (No Repeat)'),
(28148, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Spellhit \'Quest Credit\' - Despawn In 20000 ms (Phase 1)'),
(28148, 0, 8, 9, 8, 1, 100, 0, 50669, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Spellhit \'Quest Credit\' - Set Event Phase 2 (Phase 1)'),
(28148, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50698, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Cast \'Kill Credit Jospehine 01\''),
(28148, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50711, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Cast \'Strip Aura Josephine 01\''),
(28148, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 86, 50699, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Cross Cast \'Josephine Kill Credit\''),
(28148, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 86, 50712, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Cross Cast \'Strip Aura Josephine\''),
(28148, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Stop Follow '),
(28148, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Say Line 0'),
(28148, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, 28148, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Start Waypoint'),
(28148, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Josephine - On Just Summoned - Remove Npc Flag Gossip');

-- Crusader Jonathan SAI
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 28136);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28136, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 50665, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Just Summoned - Cast \'Bleeding Out\''),
(28136, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Store Targetlist (No Repeat)'),
(28136, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Start Follow Invoker (No Repeat)'),
(28136, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Set Event Phase 1 (No Repeat)'),
(28136, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Remove Flag Standstate Sit Down (No Repeat)'),
(28136, 0, 5, 0, 23, 1, 100, 1, 50665, 0, 0, 0, 80, 2813600, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Has Aura \'Bleeding Out\' - Run Script (No Repeat)'),
(28136, 0, 6, 7, 40, 0, 100, 1, 5, 0, 0, 0, 90, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Set Flag Standstate Sit Down (No Repeat)'),
(28136, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Despawn In 20000 ms (No Repeat)'),
(28136, 0, 8, 9, 8, 1, 100, 0, 50669, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Spellhit \'Quest Credit\' - Set Event Phase 2 (Phase 1)'),
(28136, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50671, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Spellhit \'Resuscitate\' - Cast \'Kill Credit Jonathan 01\''),
(28136, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50709, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Spellhit \'Resuscitate\' - Cast \'Strip Aura Jonathan 01\''),
(28136, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 86, 50680, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Spellhit \'Resuscitate\' - Cross Cast \'Jonathan Kill Credit\''),
(28136, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 86, 50710, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Spellhit \'Resuscitate\' - Cross Cast \'Strip Aura Jonanthan\''),
(28136, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Stop Follow  (No Repeat)'),
(28136, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Say Line 0 (No Repeat)'),
(28136, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, 28136, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Start Waypoint (No Repeat)'),
(28136, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Crusader Jonathan - On Waypoint 5 Reached - Remove Npc Flag Gossip (No Repeat)');

SET @ENTRY  := 179544; -- GO entry
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,62,0,100,0,5743,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - On Gossip option select - run script'),
(@ENTRY,1,1,0,62,0,100,0,5743,1,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - On Gossip option select - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - Script - Close Gossip'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - Script - Store target'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,100,1,0,0,0,0,0,11,14368,30,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - Script - Send target'),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,14368,30,0,0,0,0,0,'Skeletal Remains of Kariel Winthalus - Script - Set data 0 1 for entry 14368'),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skeletal Remains of Kariel Winthalus - Script - Deactivate self'),
(@ENTRY*100,9,5,0,0,0,100,0,28000,28000,28000,28000,32,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skeletal Remains of Kariel Winthalus - Script - Activate self');
-- Lorekeeper Lydros SAI
SET @ENTRY := 14368; -- NPC entry
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,1,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lorekeeper Lydros - On dataset - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - set data 0 0'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,1000,1000,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'Lorekeeper Lydros - Script - turn to player'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,1000,1000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - Say 0'),
(@ENTRY*100,9,3,0,0,0,100,0,4000,4000,4000,4000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - Say 1'),
(@ENTRY*100,9,4,0,0,0,100,0,8000,8000,8000,8000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - Say 2'),
(@ENTRY*100,9,5,0,0,0,100,0,11000,11000,11000,11000,15,7481,0,0,0,0,0,12,1,0,0,0,0,0,0,'Lorekeeper Lydros - Script - quest credit'),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,15,7482,0,0,0,0,0,12,1,0,0,0,0,0,0,'Lorekeeper Lydros - Script - quest credit'),
(@ENTRY*100,9,7,0,0,0,100,0,2000,2000,2000,2000,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - reset orientation');
-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=14368;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(14368,0,0, 'I very much doubt that he will have anything to say, stranger...',12,0,100,1,0,0, 'Lorekeeper Lydros'),
(14368,1,0, 'I personally did not mind him. It was the Prince who took exception to a high elf in his domain. Alas, I am not one to question the Prince. In his defense, he did not incinerate Master Winthalus immediately.',12,0,100,1,0,0, 'Lorekeeper Lydros'),
(14368,2,0, 'We most definitely do not need anymore attention drawn to us, stranger. Return to those that sent you in search of the lost master and tell them that nothing could be found. When this is done - and I will know when it is so - return and I shall reveal the secrets of the deceased.',12,0,100,1,0,0, 'Lorekeeper Lydros');
-- Gossip Fix from nelegalno
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5743;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(5743,0,0,"Mourn the great loss.",1,1,0,0,0,0,NULL), -- A gossip
(5743,1,0,"Mourn the great loss.",1,1,0,0,0,0,NULL); -- H gossip
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`=15 AND `SourceGroup`=5743);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,5743,0,0,9,7482,0,0,0,'',"Display gossip option when on Elven Legends A quest"),
(15,5743,1,0,9,7481,0,0,0,'',"Display gossip option when on Elven Legends H quest");

-- Winterfin Oracle
SET @ENTRY := 25216;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast bolt'),
(@ENTRY,0,1,2,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,61,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text at 15% HP'),
(@ENTRY,0,3,0,9,0,100,0,0,5,12300,19800,11,50272,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Unstable Magic on Close');
-- NPC talk text insert
SET @ENTRY := 25216;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, '%s attempts to run away in fear!',16,0,100,0,0,0, 'combat Flee');

-- ahn'kahet - plague walker
DELETE FROM smart_scripts WHERE entryorguid = 30283;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(30283, 0, 0, 0, 0, 0, 100, 2, 0, 0, 0, 0, 11, 56709, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Plague Walker - Combat - Cast \'Aura of Lost Hope\' (Phase 1) (No Repeat) (Dungeon)'),
(30283, 0, 1, 0, 0, 0, 100, 4, 0, 0, 0, 0, 11, 61459, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Plague Walker - On Respawn - Cast \'Aura of Lost Hope\' (Phase 1) (No Repeat) (Dungeon)'),
(30283, 0, 2, 0, 0, 0, 100, 6, 7000, 11000, 120000, 130000, 11, 56707, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Plague Walker - In Combat - Cast \'Contagion of Rot\' (Phase 1) (No Repeat) (Dungeon)');