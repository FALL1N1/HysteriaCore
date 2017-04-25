-- Dragonflayer Strategist SAI
SET @ENTRY := 23956;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,7,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Out Of Combat - Disallow Combat Movement (Dungeon Only)"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Out Of Combat - Stop Auto Attack (Dungeon Only)"),
(@ENTRY,0,2,3,4,0,100,3,0,0,0,0,11,42772,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonflayer Strategist - On Aggro - Cast 42772 (Normal Dungeon)"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - On Aggro - Increment Event Phase (Normal Dungeon)"),
(@ENTRY,0,4,5,9,0,100,2,5,30,2300,5000,11,42772,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 5-30 Range - Cast 42772 (Normal Dungeon)"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 5-30 Range - Set Sheath Ranged (Normal Dungeon)"),
(@ENTRY,0,6,7,4,0,100,5,0,0,0,0,11,59685,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonflayer Strategist - On Aggro - Cast 59685 (Heroic Dungeon)"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - On Aggro - Increment Event Phase (Heroic Dungeon)"),
(@ENTRY,0,8,9,9,0,100,4,5,30,2300,5000,11,59685,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 5-30 Range - Cast 59685 (Heroic Dungeon)"),
(@ENTRY,0,9,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 5-30 Range - Set Sheath Ranged (Heroic Dungeon)"),
(@ENTRY,0,10,11,9,0,100,7,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 25-80 Range - Allow Combat Movement (Dungeon Only)"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 25-80 Range - Start Auto Attack (Dungeon Only)"),
(@ENTRY,0,12,13,9,0,100,7,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 0-5 Range - Allow Combat Movement (Dungeon Only)"),
(@ENTRY,0,13,14,61,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 0-5 Range - Set Sheath Melee (Dungeon Only)"),
(@ENTRY,0,14,0,61,0,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 0-5 Range - Start Auto Attack (Dungeon Only)"),
(@ENTRY,0,15,16,9,0,100,7,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 5-15 Range - Disallow Combat Movement (Dungeon Only)"),
(@ENTRY,0,16,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - Between 5-15 Range - Stop Auto Attack (Dungeon Only)"),
(@ENTRY,0,17,0,0,0,100,2,4500,5000,11000,16000,11,54962,1,0,0,0,0,5,0,0,0,0,0,0,0,"Dragonflayer Strategist - In Combat - Cast 54962 (Normal Dungeon)"),
(@ENTRY,0,18,0,0,0,100,4,4500,5000,11000,16000,11,60227,1,0,0,0,0,5,0,0,0,0,0,0,0,"Dragonflayer Strategist - In Combat - Cast 60227 (Heroic Dungeon)"),
(@ENTRY,0,19,0,0,0,100,6,7500,9000,13000,15000,11,42972,1,0,0,0,0,5,0,0,0,0,0,0,0,"Dragonflayer Strategist - In Combat - Cast 42972 (Dungeon Only)"),
(@ENTRY,0,20,0,7,0,100,7,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Strategist - On Evade - Set Sheath Melee (Dungeon Only)");