-- Convocation at Zol'Heb (12730)
SET @GUID := 45214;
SET @NPC_ELM_BUNNY_LARGE := 24021;
SET @NPC_AKALI_PROPHET   := 29028;
SET @NPC_HARKOA          := 29050;
SET @GO_SKULL_PILE       := 190594;
SET @GO_CIRCLE           := 191123;
SET @GO_TORCH            := 191365;
SET @GO_SPELLFOCUS       := 300221;

DELETE FROM `creature` WHERE `guid` IN (@GUID);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(@GUID,@NPC_ELM_BUNNY_LARGE,571,1,1,21999,6448.935,-4475.177,451.3292,0.8028514,300,0,0);

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_AKALI_PROPHET,@NPC_HARKOA);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_AKALI_PROPHET,0,0,'What is this? I recognize you from when I killed Akali. You must be this $N that everyone is dreading.',14,0,100,25,0,12009,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,1,0,'You don''t worry me, $g boy : girl;. Just the opposite - I look forward to killing you. Nothing will stand between me and Zim''Torga now!',14,0,100,15,0,6200,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,2,0,'How sad that only now do you grasp the truth - I wield the power of a god. You are a mere mortal. You cannot hope to defeat me!',14,0,100,11,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,3,0,'You''ve meddled in affairs that were none of your business. You are nothing but a foreign invader. Prepare to die!',14,0,100,15,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,4,0,'The prophet begins to cast a ritual of annihilation.',16,0,100,0,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,5,0,'What? HAR''KOA?!',14,0,100,0,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,6,0,'Very well, kitten. I see no need to delay your inevitable demise. I look forward to dealing with you just as soon as I finish off this fool!',14,0,100,0,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,7,0,'NO! I will not be defeated!',14,0,100,0,0,0,'Prophet of Akali'),
(@NPC_HARKOA,0,0,'PROPHET!',14,0,100,0,0,643,'Har''koa'),
(@NPC_HARKOA,1,0,'YOU KEEP YOUR FILTHY DRAKKARI HANDS OFF OF THEM!',14,0,100,35,0,11887,'Har''koa'),
(@NPC_HARKOA,2,0,'I THINK NOT. YOU WILL DROP YOUR IMMUNITY, CEASE YOUR RITUAL NOW AND RELEASE THEM!',14,0,100,0,0,11883,'Har''koa'),
(@NPC_HARKOA,3,0,'Thank you. Once again you have saved us all. I will see you back at Zim''Torga.',14,0,100,0,0,0,'Har''koa');

UPDATE `creature_template` SET `speed_run`=3.5714286, `dmg_multiplier`=7.5 WHERE `entry`=@NPC_HARKOA;
UPDATE `creature_model_info` SET `bounding_radius`=2.17, `combat_reach`=7 WHERE `modelid`=28009;

DELETE FROM `creature_equip_template` WHERE `entry`=@NPC_AKALI_PROPHET;
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@NPC_AKALI_PROPHET,1,39892,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (52956,52989);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,52956,0,0,31,0,3,@NPC_ELM_BUNNY_LARGE,0,0,0,'','Spell Prophet of Akali Convocation targets ELM General Purpose Bunny Large'),
(13,1,52989,0,0,31,0,4,0,0,0,0,'','Spell Akali''s Stun targets players');

DELETE FROM `spell_scripts` WHERE `id`=53010;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(53010,0,0,14,52989,0,0,0,0,0,0);

DELETE FROM `spell_script_names` WHERE `spell_id`=53350;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(53350,'spell_q12730_quenching_mist');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=52989;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(52989,-53504,1,'On spellhit Akali''s Stun - Remove aura Flickering Flames');

DELETE FROM `waypoints` WHERE `entry` IN (@NPC_HARKOA,@NPC_HARKOA*10);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@NPC_HARKOA,1,6369.87,-4507.906,458.1296,'Har''koa'),
(@NPC_HARKOA,2,6372.938,-4508.172,457.8796,'Har''koa'),
(@NPC_HARKOA,3,6377.188,-4508.172,457.8796,'Har''koa'),
(@NPC_HARKOA,4,6387.688,-4507.922,457.8796,'Har''koa'),
(@NPC_HARKOA,5,6403.007,-4521.438,458.1296,'Har''koa'),

(@NPC_HARKOA*10,1,6404.547,-4486.095,451.1878,'Har''koa'),
(@NPC_HARKOA*10,2,6395.547,-4486.345,451.1878,'Har''koa'),
(@NPC_HARKOA*10,3,6391.547,-4486.345,451.1878,'Har''koa'),
(@NPC_HARKOA*10,4,6390.047,-4486.595,451.1878,'Har''koa'),
(@NPC_HARKOA*10,5,6388.047,-4486.595,451.4378,'Har''koa'),
(@NPC_HARKOA*10,6,6367.047,-4487.345,455.9378,'Har''koa'),
(@NPC_HARKOA*10,7,6364.297,-4487.595,457.9378,'Har''koa'),
(@NPC_HARKOA*10,8,6348.413,-4488.189,458.1296,'Har''koa');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_AKALI_PROPHET,@NPC_HARKOA);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (@GO_SKULL_PILE,@GO_CIRCLE,@GO_TORCH,@GO_SPELLFOCUS);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@NPC_AKALI_PROPHET,@NPC_HARKOA);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_AKALI_PROPHET,@NPC_HARKOA) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@GO_SKULL_PILE,@GO_CIRCLE,@GO_TORCH,@GO_SPELLFOCUS) AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_AKALI_PROPHET*100+0,@NPC_AKALI_PROPHET*100+1,@NPC_AKALI_PROPHET*100+2,@NPC_HARKOA*100,@GO_CIRCLE*100,@GO_TORCH*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_AKALI_PROPHET,0,0,1,54,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - Just summoned - Set unit_flags IMMUNE_TO_PC'),
(@NPC_AKALI_PROPHET,0,1,2,61,0,100,0,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - Just summoned - Spellcast Ethereal Teleport'),
(@NPC_AKALI_PROPHET,0,2,3,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Prophet of Akali - Just summoned - Store targetlist'),
(@NPC_AKALI_PROPHET,0,3,0,61,0,100,0,0,0,0,0,80,@NPC_AKALI_PROPHET*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - Just summoned - Run script 0'),
(@NPC_AKALI_PROPHET,0,4,0,0,1,100,0,10000,12000,14000,16000,11,53496,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Prophet of Akali - On update IC (phase 1) - Spellcast Darting Flames'),
(@NPC_AKALI_PROPHET,0,5,0,0,1,100,0,16000,18000,12000,15000,11,53493,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Prophet of Akali - On update IC (phase 1) - Spellcast Incinerate'),
(@NPC_AKALI_PROPHET,0,6,7,2,0,100,1,0,70,0,0,11,52982,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On health below 70% - Spellcast Akali''s Immunity'),
(@NPC_AKALI_PROPHET,0,7,8,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On health below 70% - Disable autoattack'),
(@NPC_AKALI_PROPHET,0,8,9,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On health below 70% - Set event phase 2'),
(@NPC_AKALI_PROPHET,0,9,0,61,0,100,0,0,0,0,0,80,@NPC_AKALI_PROPHET*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On health below 70% - Run script 1'),
(@NPC_AKALI_PROPHET,0,10,11,34,4,100,0,0,1,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8028514, 'Prophet of Akali - On movement inform (phase 3) - Set orientation'),
(@NPC_AKALI_PROPHET,0,11,12,61,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On movement inform (phase 3) - Set event phase 0'),
(@NPC_AKALI_PROPHET,0,12,0,61,0,100,0,0,0,0,0,80,@NPC_AKALI_PROPHET*100+2,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On movement inform (phase 3) - Run script 2'),

(@NPC_HARKOA,0,0,0,54,0,100,0,0,0,0,0,53,1,@NPC_HARKOA,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa - Just summoned - Start WP movement'),
(@NPC_HARKOA,0,1,0,40,0,100,0,5,@NPC_HARKOA,0,0,45,0,1,0,0,0,0,19,@NPC_AKALI_PROPHET,50,0,0,0,0,0, 'Har''koa - On WP 5 reached - Set data 0 1 Akali Prophet'),
(@NPC_HARKOA,0,2,0,38,0,100,0,0,1,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Har''koa - On data 0 1 set - Turn to'),
(@NPC_HARKOA,0,3,0,38,0,100,0,0,2,0,0,80,@NPC_HARKOA*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa - On data 0 2 set - Run script'),
(@NPC_HARKOA,0,4,5,7,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa - On Evade - Say line'),
(@NPC_HARKOA,0,5,0,61,0,100,0,0,0,0,0,53,1,@NPC_HARKOA*10,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa - On Evade - Start WP movement'),
(@NPC_HARKOA,0,6,0,0,0,100,0,15000,16000,9000,10000,11,53499,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Har''koa - On update IC - Spellcast Rake'),
(@NPC_HARKOA,0,7,0,0,0,100,0,16000,17000,10000,10000,11,53498,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Har''koa - On update IC - Spellcast Swipe'),
(@NPC_HARKOA,0,8,0,0,0,100,0,10000,12000,12000,15000,86,53350,0,19,@NPC_AKALI_PROPHET,30,0,1,0,0,0,0,0,0,0, 'Har''koa - On update IC - Spellcast Quenching Mist'),
(@NPC_HARKOA,0,9,0,40,0,100,0,8,@NPC_HARKOA*10,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa - On WP 8 reached - Despawn'),

(@GO_SKULL_PILE,1,0,1,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zul''Drak Skull Pile 02 - On data 0 1 set - Set phasemask 2'),
(@GO_SKULL_PILE,1,1,0,61,0,100,0,0,0,0,0,80,@GO_TORCH*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Zul''Drak Skull Pile 02 - On data 0 1 set - Run script'),

(@GO_CIRCLE,1,0,1,38,0,100,0,0,1,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Convocation Summoning Circle - On data 0 1 set - Activate gameobject'),
(@GO_CIRCLE,1,1,0,61,0,100,0,0,0,0,0,80,@GO_CIRCLE*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Convocation Summoning Circle - On data 0 1 set - Run script'),

(@GO_TORCH,1,0,1,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadow Council Torch (x2.00) - On data 0 1 set - Set phasemask 2'),
(@GO_TORCH,1,1,0,61,0,100,0,0,0,0,0,80,@GO_TORCH*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadow Council Torch (x2.00) - On data 0 1 set - Run script'),

(@GO_SPELLFOCUS,1,0,1,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'TEMP Convocation Summoning Circle - On data 0 1 set - Set phasemask 2'),
(@GO_SPELLFOCUS,1,1,0,61,0,100,0,0,0,0,0,80,@GO_TORCH*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'TEMP Convocation Summoning Circle - On data 0 1 set - Run script'),

(@NPC_AKALI_PROPHET*100+0,9,0,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,13,@GO_SKULL_PILE,0,20,0,0,0,0, 'Prophet of Akali script 0 - Set data 0 1 Zul''Drak Skull Pile 02'),
(@NPC_AKALI_PROPHET*100+0,9,1,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,20,@GO_CIRCLE,20,0,0,0,0,0, 'Prophet of Akali script 0 - Set data 0 1 Convocation Summoning Circle'),
(@NPC_AKALI_PROPHET*100+0,9,2,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,13,@GO_TORCH,0,20,0,0,0,0, 'Prophet of Akali script 0 - Set data 0 1 Shadow Council Torch (x2.00)'),
(@NPC_AKALI_PROPHET*100+0,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,20,@GO_SPELLFOCUS,20,0,0,0,0,0, 'Prophet of Akali script 0 - Set data 0 1 TEMP Convocation Summoning Circle'),
(@NPC_AKALI_PROPHET*100+0,9,4,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Prophet of Akali script 0 - Turn to summoner'),
(@NPC_AKALI_PROPHET*100+0,9,5,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Prophet of Akali script 0 - Say line'),
(@NPC_AKALI_PROPHET*100+0,9,6,0,0,0,100,0,6000,6000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Prophet of Akali script 0 - Turn to summoner'), 
(@NPC_AKALI_PROPHET*100+0,9,7,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Prophet of Akali script 0 - Say line'),
(@NPC_AKALI_PROPHET*100+0,9,8,0,0,0,100,0,3600,3600,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 0 - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_AKALI_PROPHET*100+0,9,9,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Prophet of Akali script 0 - Start attack'),
(@NPC_AKALI_PROPHET*100+0,9,10,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 0 - Set event phase 1'),

(@NPC_AKALI_PROPHET*100+1,9,0,0,0,0,100,0,2400,2400,0,0,11,52989,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 1 - Spellcast Akali''s Stun'),
(@NPC_AKALI_PROPHET*100+1,9,1,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,6448.36,-4475.49,451.0759,0, 'Prophet of Akali script 1 - Move to position'),
(@NPC_AKALI_PROPHET*100+1,9,2,0,0,0,100,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 1 - Set event phase 3'),

(@NPC_AKALI_PROPHET*100+2,9,0,0,0,0,100,0,800,800,0,0,1,2,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Say line'),
(@NPC_AKALI_PROPHET*100+2,9,1,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Say line'),
(@NPC_AKALI_PROPHET*100+2,9,2,0,0,0,100,0,2400,2400,0,0,11,52993,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Spellcast Akali''s Ritual of Annihilation'),
(@NPC_AKALI_PROPHET*100+2,9,3,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Say line'),
(@NPC_AKALI_PROPHET*100+2,9,4,0,0,0,100,0,2000,2000,0,0,12,@NPC_HARKOA,1,300000,0,0,0,8,0,0,0,6355.075,-4494.311,458.179,0, 'Prophet of Akali script 2 - Summon Har''koa'),
(@NPC_AKALI_PROPHET*100+2,9,5,0,0,0,100,0,4000,4000,0,0,45,0,1,0,0,0,0,19,@NPC_HARKOA,100,0,0,0,0,0, 'Prophet of Akali script 2 - Set data 0 1 Har''koa'),
(@NPC_AKALI_PROPHET*100+2,9,6,0,0,0,100,0,4600,4600,0,0,45,0,2,0,0,0,0,19,@NPC_HARKOA,100,0,0,0,0,0, 'Prophet of Akali script 2 - Set data 0 2 Har''koa'),
(@NPC_AKALI_PROPHET*100+2,9,7,0,0,0,100,0,1500,1500,0,0,66,0,0,0,0,0,0,19,@NPC_HARKOA,100,0,0,0,0,0, 'Prophet of Akali script 2 - Turn to Har''koa'),
(@NPC_AKALI_PROPHET*100+2,9,8,0,0,0,100,0,1300,1300,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Say line'),
(@NPC_AKALI_PROPHET*100+2,9,9,0,0,0,100,0,7100,7100,0,0,66,0,0,0,0,0,0,19,@NPC_HARKOA,100,0,0,0,0,0, 'Prophet of Akali script 2 - Turn to Har''koa'),
(@NPC_AKALI_PROPHET*100+2,9,10,0,0,0,100,0,100,100,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Say line'),
(@NPC_AKALI_PROPHET*100+2,9,11,0,0,0,100,0,9500,9500,0,0,92,0,52993,1,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Interrupt spellcast'),
(@NPC_AKALI_PROPHET*100+2,9,12,0,0,0,100,0,300,300,0,0,11,53010,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Spellcast Convocation at Zol''Heb: Removef Akali''s Stun'),
(@NPC_AKALI_PROPHET*100+2,9,13,0,0,0,100,0,0,0,0,0,28,52982,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Remove aura Akali''s Immunity'),
(@NPC_AKALI_PROPHET*100+2,9,14,0,0,0,100,0,100,100,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Say line'),
(@NPC_AKALI_PROPHET*100+2,9,15,0,0,0,100,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Remove unit_flags IMMUNE_TO_NPC'),
(@NPC_AKALI_PROPHET*100+2,9,16,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Set event phase 1'),
(@NPC_AKALI_PROPHET*100+2,9,17,0,0,0,100,0,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Enable combat movement'),
(@NPC_AKALI_PROPHET*100+2,9,18,0,0,0,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script 2 - Enable autoattack'),

(@NPC_HARKOA*100,9,0,0,0,0,100,0,1200,1200,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa script 0 - Say line'),
(@NPC_HARKOA*100,9,1,0,0,0,100,0,5100,5100,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa script 0 - Say line'),
(@NPC_HARKOA*100,9,2,0,0,0,100,0,11000,11000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa script 0 - Say line'),
(@NPC_HARKOA*100,9,3,0,0,0,100,0,0,0,0,0,11,53004,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa script 0 - Spellcast Har''koa''s Compulsion'),
(@NPC_HARKOA*100,9,4,0,0,0,100,0,400,400,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa script 0 - Remove unit_flags IMMUNE_TO_NPC'),
(@NPC_HARKOA*100,9,5,0,0,0,100,0,2700,2700,0,0,97,108.6365,0,0,0,0,0,1,0,0,0,6439.68,-4484.5,451.246,0, 'Har''koa script 0 - Jump to position'),
(@NPC_HARKOA*100,9,6,0,0,0,100,0,2000,2000,0,0,49,0,0,0,0,0,0,19,@NPC_AKALI_PROPHET,50,0,0,0,0,0, 'Har''koa script 0 - Start attack'),
(@NPC_HARKOA*100,9,7,0,0,0,100,0,0,0,0,0,11,53029,0,0,0,0,0,19,@NPC_AKALI_PROPHET,50,0,0,0,0,0, 'Har''koa script 0 - Spellcast Har''koa''s Challenge'),
(@NPC_HARKOA*100,9,8,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Har''koa script 0 - Set homeposition'),

(@GO_CIRCLE*100,9,0,0,0,0,100,0,1000,1000,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Convocation Summoning Circle script - Set phasemask 2'),
(@GO_CIRCLE*100,9,1,0,0,0,100,0,299000,299000,0,0,44,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Convocation Summoning Circle script - Set phasemask 1'),

(@GO_TORCH*100,9,0,0,0,0,100,0,300000,300000,0,0,44,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadow Council Torch (x2.00) script - Set phasemask 1');

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/487
UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry`=7774;
DELETE FROM `smart_scripts` WHERE `entryorguid`=7774 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=777400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(7774,0,0,1,19,0,100,0,2845,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept (Wondering Shay) - Set NPC Flags'),
(7774,0,1,2,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept (Wondering Shay) - Store Target List'),
(7774,0,2,3,61,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept (Wondering Shay) - Set Unit Flags'),
(7774,0,3,4,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept (Wondering Shay) - Say Line 0'),
(7774,0,4,5,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept (Wondering Shay) - Follow Invoker'),
(7774,0,5,6,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept (Wondering Shay) - Set Phase 2'),
(7774,0,6,0,61,0,100,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest Accept - Set Faction'),
(7774,0,7,0,7,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Evade - Set Phase 2'),
(7774,0,8,0,6,0,100,0,0,0,0,0,6,2845,0,0,0,0,0,12,1,0,0,0,0,0,0,'Shay Leafrunner - On Death - Fail Quest'),
(7774,0,9,0,1,2,100,0,40000,70000,60000,70000,80,777400,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - OOC (Phase 2) - Action list'),
(777400,9,0,0,0,0,100,0,0,0,0,0,46,25,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - Action list - move forword'),
(777400,9,1,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - Action list - Say Line 2'),
(777400,9,2,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - Action list - Say Line 3'),
(777400,9,3,0,0,0,100,0,5000,5000,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - Action list - Set home position'),
(777400,9,4,0,0,0,100,0,0,0,0,0,89,20,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - Action list - Set Random Movement'),
(7774,0,10,11,8,2,100,0,11402,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Spellhit (Shay''s Bell) - Turn Random Movement Off'),
(7774,0,11,12,61,2,100,0,0,0,0,0,29,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'Shay Leafrunner - On Spellhit (Shay''s Bell) - Follow Invoker'),
(7774,0,12,0,61,2,100,0,0,0,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0,'Shay Leafrunner - On Spellhit (Shay''s Bell) - Say Line 1'),
(7774,0,13,14,75,2,100,1,0,7765,10,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Rockbiter within 10 yards - Say Line 4'),
(7774,0,14,15,61,2,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Rockbiter within 10 yards - Root'),
(7774,0,15,16,61,2,100,0,0,0,0,0,15,2845,0,0,0,0,0,12,1,0,0,0,0,0,0,'Shay Leafrunner - On Rockbiter within 10 yards - Call areaexploredoreventhappens'),
(7774,0,16,0,61,2,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Rockbiter within 10 yards - Set Phase 1'),
(7774,0,17,18,52,0,100,0,4,7774,0,0,1,0,0,0,0,0,0,19,7765,0,0,0,0,0,0,'Shay Leafrunner - On Text Over Line 4  - Say Line 0 on Rockbiter'),
(7774,0,18,0,61,0,100,0,4,7774,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Text Over Line 4  - Despawn after 10 seconds');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=11402;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 11402, 0, 0, 31, 0, 3, 7774, 0, 0, 0, 0, '', 'Shays Bell targets Shay Leafrunner');

DELETE FROM `creature_text` WHERE `entry`IN(7774,7765);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(7774, 0, 0, 'Don''t forget to get my bell out of the chest here. And remember, if do happen to wander off, just ring it and i''ll find you again.', 12, 0, 100, 0, 0, 0, 3921, 0, 'Shay Leafrunner'),
(7774, 1, 0, 'This is quite an adventure!', 12, 0, 100, 0, 0, 0, 3914, 0, 'Shay Leafrunner'),
(7774, 1, 1, 'Oh, I wandered off again. I''m sorry.', 12, 0, 100, 0, 0, 0, 3913, 0, 'Shay Leafrunner'),
(7774, 1, 2, 'The bell again, such a sweet sound.', 12, 0, 100, 0, 0, 0, 3916, 0, 'Shay Leafrunner'),
(7774, 1, 3, 'I can''t help it, really. This is just such a beautiful place.', 12, 0, 100, 0, 0, 0, 3915, 0, 'Shay Leafrunner'),
(7774, 2, 0, '%s begins to wander off.', 16, 0, 100, 0, 0, 0, 3918, 0, 'Shay Leafrunner'),
(7774, 3, 0, 'Are we taking the scenic route?', 12, 0, 100, 0, 0, 0, 3912, 0, 'Shay Leafrunner'),
(7774, 3, 1, 'Oh, what a beautiful flower over there.', 12, 0, 100, 0, 0, 0, 3907, 0, 'Shay Leafrunner'),
(7774, 3, 2, 'These trees are quite glorious, aren''t they? ', 12, 0, 100, 0, 0, 0, 3908, 0, 'Shay Leafrunner'),
(7774, 3, 3, 'Are you sure this is the right way? Maybe we should go this way instead...', 12, 0, 100, 0, 0, 0, 3909, 0, 'Shay Leafrunner'),
(7774, 4, 0, 'Oh, here you are, Rockbiter! I''m sorry, I know I''m not supposed to wander off.', 12, 0, 100, 0, 0, 0, 3917, 0, 'Shay Leafrunner'),
(7765, 0, 0, 'I''m glad yer back, Shay. Please, don''t ever run off like that again! What would i tell yer parents if I lost ya?"', 12, 0, 100, 0, 0, 0, 3922, 0, 'Shay Leafrunner');

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/474
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName`= '' WHERE `entry` = 29927;
DELETE FROM `smart_scripts` WHERE `entryorguid`= 29927 AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29927,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,29375,30,0,0,0,0,0,'Earthen Ironbane - on Just Summoned - Start Attacking Stormforged Iron Giant');

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/472
UPDATE creature_template SET scriptname = "npc_pet_bomb" WHERE entry = 8937;

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/471
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=52090 AND `ElseGroup`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 52090, 0, 1, 31, 1, 3, 28465, 0, 0, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28465 "Heb\'Drakkar Striker'),
(17, 0, 52090, 0, 1, 36, 1, 0, 0, 0, 1, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28465 "Heb\'Drakkar Striker');


-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/456
SET @Defender          := 10948; -- Darrowshire Defender
SET @Skeleton          := 10952; -- Maraudin Skeleton
SET @Corpse            := 10951; -- Marauding Corpse
SET @Silver            := 10949; -- Silver hand disciple
SET @Sevant            := 10953; -- Sevant of Horgus
SET @Lightfire         := 10944; -- Davil Lightfire
SET @Horgus            := 10946; -- Horgus the Ravager
SET @Betrayer          := 10947; -- Darrowshire Betrayer
SET @Redpath           := 10937; -- Captain Redpath 
SET @Bloodletter       := 10954; -- Bloodletter
SET @Marduk            := 10939; -- Marduk the Black
SET @CorruptedRed      := 10938; -- Redpath the Corrupted
SET @Joseph            := 10936; -- Joseph Redpath
SET @Davil             := 10945; -- Davil Crokford
SET @Pamela            := 10926; -- Pamela Redpath
SET @Relic             := 177526; -- Relic Bundle, spell:=18987

DELETE FROM `creature_template_addon` WHERE `entry` IN(@Silver ,@Lightfire, @Defender, @Joseph, @Davil, @Pamela, @Horgus);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@Silver, 0, 0, 0, '17327'),
(@Lightfire, 0, 0, 0, '17327'), 
(@Defender, 0, 0, 0, '17327'),
(@Joseph, 0, 0, 0, '17327'),
(@Davil, 0, 0, 0, '17327'), 
(@Pamela, 0, 0, 0, '17327'),
(@Horgus, 0, 0, 0, '17467');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@Defender, @Skeleton, @Corpse, @Sevant, @Lightfire, @Horgus, @Betrayer, @Redpath, @Bloodletter, @Marduk, @CorruptedRed, @Joseph, @Pamela, @Davil, @CorruptedRed);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@Relic;
UPDATE `gameobject` SET `position_x`=1439.81, `position_y`=-3702.22, `position_z`=77.12 WHERE `guid`=99891;
UPDATE `creature` SET `Orientation`=2.276223 WHERE `id`=@Pamela;

DELETE FROM `creature_summon_groups` WHERE `summonerid`=@Redpath;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES
(@Redpath,0,0,@Defender,1484.442993, -3676.545410, 79.871506, 0.169049,8,0),
(@Redpath,0,0,@Defender,1497.560669, -3637.805176, 85.364410, 3.957781,8,0),  
(@Redpath,0,0,@Defender,1509.516357, -3640.667969, 88.113441, 4.707833,8,0), 
(@Redpath,0,0,@Defender,1511.495483, -3650.671631, 88.055191, 1.052592,8,0),
(@Redpath,0,0,@Defender,1503.856812, -3664.068359, 83.389610, 1.052592,8,0),
(@Redpath,0,0,@Defender,1494.220215, -3656.542725, 83.329399, 0.954417,8,0),
(@Redpath,0,0,@Defender,1495.856445, -3684.522461, 80.549515, 0.002224,8,0), 
(@Redpath,0,0,@Defender,1494.905640, -3678.563477, 80.728012, 6.140110,8,0), 
(@Redpath,0,0,@Defender,1494.013916, -3671.843262, 81.187721, 0.139665,8,0), 
(@Redpath,0,0,@Defender,1493.794922, -3665.639893, 81.787727, 5.719919,8,0),
(@Redpath,0,0,@Defender,1513.222290, -3693.317627, 84.312233, 2.388256,8,0),
(@Redpath,0,0,@Defender,1508.203369, -3701.367188, 81.152023, 1.888743,8,0),
(@Redpath,0,0,@Defender,1516.244263, -3706.704346, 82.785568, 5.756826,8,0),
(@Redpath,0,0,@Defender,1511.111084, -3709.822998, 82.240448, 2.073311,8,0),
(@Redpath,0,0,@Defender,1504.386353, -3709.648193, 81.169960, 0.557490,8,0),
(@Redpath,0,1,@Skeleton, 1497.560669, -3637.805176, 85.364410, 3.957781,8,0),  -- phase 1
(@Redpath,0,1,@Corpse, 1509.516357, -3640.667969, 88.113441, 4.707833,8,0), 
(@Redpath,0,1,@Skeleton ,1511.495483, -3650.671631, 88.055191, 1.052592,8,0),
(@Redpath,0,1,@Corpse, 1503.856812, -3664.068359, 83.389610, 1.052592,8,0),
(@Redpath,0,1,@Skeleton ,1494.220215, -3656.542725, 83.329399, 0.954417,8,0),
(@Redpath,0,1,@Skeleton, 1495.856445, -3684.522461, 80.549515, 0.002224,8,0), 
(@Redpath,0,1,@Corpse, 1494.905640, -3678.563477, 80.728012, 6.140110,8,0), 
(@Redpath,0,1,@Skeleton, 1494.013916, -3671.843262, 81.187721, 0.139665,8,0), 
(@Redpath,0,1,@Corpse, 1493.794922, -3665.639893, 81.787727, 5.719919,8,0),
(@Redpath,0,1,@Skeleton, 1513.222290, -3693.317627, 84.312233, 2.388256,8,0),
(@Redpath,0,1,@Corpse, 1508.203369, -3701.367188, 81.152023, 1.888743,8,0),
(@Redpath,0,1,@Skeleton, 1516.244263, -3706.704346, 82.785568, 5.756826,8,0),
(@Redpath,0,1,@Corpse, 1511.111084, -3709.822998, 82.240448, 2.073311,8,0),
(@Redpath,0,1,@Skeleton, 1504.386353, -3709.648193, 81.169960, 0.557490,8,0),
(@Redpath,0,2,@Sevant, 1497.560669, -3637.805176, 85.364410, 3.957781,8,0),  -- phase 2
(@Redpath,0,2,@Sevant, 1509.516357, -3640.667969, 88.113441, 4.707833,8,0), 
(@Redpath,0,2,@Sevant, 1511.495483, -3650.671631, 88.055191, 1.052592,8,0),
(@Redpath,0,2,@Sevant, 1503.856812, -3664.068359, 83.389610, 1.052592,8,0),
(@Redpath,0,2,@Sevant, 1494.220215, -3656.542725, 83.329399, 0.954417,8,0),
(@Redpath,0,2,@Sevant, 1495.856445, -3684.522461, 80.549515, 0.002224,8,0), 
(@Redpath,0,2,@Sevant, 1494.905640, -3678.563477, 80.728012, 6.140110,8,0), 
(@Redpath,0,2,@Sevant, 1494.013916, -3671.843262, 81.187721, 0.139665,8,0), 
(@Redpath,0,2,@Sevant, 1493.794922, -3665.639893, 81.787727, 5.719919,8,0),
(@Redpath,0,2,@Sevant, 1513.222290, -3693.317627, 84.312233, 2.388256,8,0),
(@Redpath,0,2,@Sevant, 1508.203369, -3701.367188, 81.152023, 1.888743,8,0),
(@Redpath,0,2,@Sevant, 1516.244263, -3706.704346, 82.785568, 5.756826,8,0),
(@Redpath,0,2,@Sevant, 1511.111084, -3709.822998, 82.240448, 2.073311,8,0),
(@Redpath,0,2,@Sevant, 1504.386353, -3709.648193, 81.169960, 0.557490,8,0),
(@Redpath,0,3,@Silver,1495.857910, -3682.440674,80.630501, 0.022911,8,0), 
(@Redpath,0,3,@Silver,1490.361938, -3684.647705, 80.350754, 0.285233,8,0), 
(@Redpath,0,3,@Silver,1495.075928, -3670.077148, 81.964828, 0.846651,8,0), 
(@Redpath,0,3,@Silver,1489.382568, -3666.546875, 81.307182, 0.058259,8,0),
(@Redpath,0,4,@Betrayer, 1497.560669, -3637.805176, 85.364410, 3.957781,8,0),  -- phase3
(@Redpath,0,4,@Betrayer, 1509.516357, -3640.667969, 88.113441, 4.707833,8,0), 
(@Redpath,0,4,@Betrayer, 1511.495483, -3650.671631, 88.055191, 1.052592,8,0),
(@Redpath,0,4,@Betrayer, 1503.856812, -3664.068359, 83.389610, 1.052592,8,0),
(@Redpath,0,4,@Betrayer, 1494.220215, -3656.542725, 83.329399, 0.954417,8,0),
(@Redpath,0,4,@Bloodletter, 1495.856445, -3684.522461, 80.549515, 0.002224,8,0), 
(@Redpath,0,4,@Bloodletter, 1494.905640, -3678.563477, 80.728012, 6.140110,8,0), 
(@Redpath,0,4,@Bloodletter, 1494.013916, -3671.843262, 81.187721, 0.139665,8,0), 
(@Redpath,0,4,@Bloodletter, 1493.794922, -3665.639893, 81.787727, 5.719919,8,0),
(@Redpath,0,4,@Betrayer, 1513.222290, -3693.317627, 84.312233, 2.388256,8,0),
(@Redpath,0,4,@Betrayer, 1508.203369, -3701.367188, 81.152023, 1.888743,8,0),
(@Redpath,0,4,@Betrayer, 1516.244263, -3706.704346, 82.785568, 5.756826,8,0),
(@Redpath,0,4,@Betrayer, 1511.111084, -3709.822998, 82.240448, 2.073311,8,0),
(@Redpath,0,4,@Betrayer, 1504.386353, -3709.648193, 81.169960, 0.557490,8,0);

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Relic AND `source_type` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Relic*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Lightfire  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Lightfire *100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Defender  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Defender *100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Marduk AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Marduk*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Horgus AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Horgus*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Redpath AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Redpath*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Redpath*100+1 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @CorruptedRed AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @CorruptedRed*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Davil AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Joseph AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Joseph*100 AND `source_type` = 9; 
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Joseph*100+1 AND `source_type` = 9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Relic, 1, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 80, @Relic*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Relic - On spawn - action list'),
(@Relic*100, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 12, @Redpath, 6, 6000, 0, 0, 0, 8, 0, 0, 0, 1453.091431, -3693.156494, 76.784241, 0.486776, 'Relic - action list - spawn Redpath'),
(@Redpath, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 80, @Redpath*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - On spawn - action list'),
(@Redpath*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Set invisible - action list'),
(@Redpath*100, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 107, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn groupe 1 - action list'),
(@Redpath*100, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Defender, 40, 0, 0, 0, 0, 0, 'Defender - talk1 - action list'),
(@Redpath*100, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g2 wave1- action list'),
(@Redpath*100, 9, 4, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g2 wave2 - action list'),
(@Redpath*100, 9, 5, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 12, @Lightfire, 6, 6000, 0, 0, 0, 8, 0, 0, 0, 1453.091431, -3693.156494, 76.784241, 0.486776, 'Redpath - spawn Lightfire - action list'),
(@Redpath*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Davil, 8, 600000, 0, 0, 0, 8, 0, 0, 0, 1464.515991, -3678.878418, 78.043877, 0.577881, 'Redpath - Spawn Davil - action list'),
(@Redpath*100, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 107, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g3 wave1 - action list'),
(@Redpath*100, 9, 8, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 107, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g4 wave1 - action list'),
(@Redpath*100, 9, 9, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 107, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g4 wave2 - action list'),
(@Redpath*100, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Horgus, 6, 6000, 0, 0, 0, 8, 0, 0, 0, 1501.275024, -3675.826172, 81.447624, 3.300069, 'Redpath - Spawn Horgus - action list'),
(@Redpath*100, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Horgus, 100, 0, 0, 0, 0, 0, 'Horgus - talk1 - action list'),
(@Horgus, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 11, 29060, 1, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Horgus - On spawn - cast spell 29060'),
(@Lightfire, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 53, 1,@Lightfire, 0, 0, 9000000, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'Lightfire - On spawn - waypoint1'),
(@Lightfire, 0, 1, 0, 63, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lightfire - On spawn - texte1'),
(@Davil, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - On spawn - action list'),
(@Davil, 0, 1, 0, 63, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lightfire - On spawn - texte2'),
(@Joseph, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 80, @Joseph*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - On spawn - action list'),
(@Joseph*100, 9, 0, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Davil - despawn - action list'),
(@Joseph*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 0, @Joseph, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - Start Script - waypoint '),
(@Joseph*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - Start Script - remove npcflag'),
(@Joseph, 0, 1, 0, 40, 0, 100, 0, 4, 0, 0, 0, 80, @Joseph*100+1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - On waypoint4 - Start Script'),
(@Joseph*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - On Script - Talk1'),
(@Joseph*100+1, 9, 1, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Pamela, 10, 0, 0, 0, 0, 0, 'Pamela - On Script - Talk1'),
(@Joseph*100+1, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Pamela, 10, 0, 0, 0, 0, 0, 'Pamela - On Script - Talk2'),
(@Joseph*100+1, 9, 3, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Pamela, 10, 0, 0, 0, 0, 0, 'Pamela - On Script - Talk3'),
(@Joseph*100+1, 9, 4, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Pamela, 10, 0, 0, 0, 0, 0, 'Pamela - On Script - Talk4'),
(@Joseph*100+1, 9, 5, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - On Script - Talk2'),
(@Joseph*100+1, 9, 6, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Joseph - despawn - action list'),
(@Joseph, 0, 2, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, @Joseph, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Joseph - On waypoint4 - Start Script'),
(@Horgus, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @Horgus*100, 2, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Horgus - On death - action list'),
(@Horgus*100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire -  talk 2 - action list'),
(@Horgus*100, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - talk 2 - action list'),
(@Horgus*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire -  talk 3 - action list'),
(@Horgus*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire -  talk 3 - action list'),
(@Horgus*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire - On Script - Set React Passive'),
(@Horgus*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0,19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire - On Script - Set Immune To NPC'),
(@Horgus*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire - On Script - evade'),
(@Horgus*100, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 65, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire - play emote - action list'),
(@Horgus*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Lightfire, 100, 0, 0, 0, 0, 0, 'Lightfire - despawn - action list'),
(@Horgus*100, 9, 9, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 47, 1, 0, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - Visible On - action list'),
(@Horgus*100, 9, 10, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 53, 1, @Redpath, 0, 0, 0, 2, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - waypoint 1 - action list'),
(@Horgus*100, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath -  talk 1 - action list'),
(@Horgus*100, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Redpath -  talk 2 - action list'),
(@Horgus*100, 9, 13, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g1 wave3 - action list'),
(@Horgus*100, 9, 14, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 107, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g4 wave1 - action list'),
(@Horgus*100, 9, 15, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 107, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - Spawn g4 wave2 - action list'),
(@Horgus*100, 9, 16, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 86, 18650, 2, 19, @Redpath, 50, 0, 19, @Redpath, 50, 0, 0, 0, 0, 0, 'Redpath - Spawn Marduk - action list'),
(@Horgus*100, 9, 17, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Marduk, 100, 0, 0, 0, 0, 0, 'Marduk - talk 1 - action list'),
(@Horgus*100, 9, 18, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - On Script - Set React Passive'),
(@Horgus*100, 9, 19, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0,19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - On Script - Set Immune To NPC'),
(@Horgus*100, 9, 20, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - On Script - evade'),
(@Horgus*100, 9, 21, 0, 0, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - set visible off - action list'),
(@Horgus*100, 9, 22, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, @CorruptedRed, 6, 60000, 0, 0, 0, 8, 0, 0, 0, 1494.081055, -3676.041748,80.846764, 6.269975, 'Redpath - Spawn CorruptedRed - action list'),
(@Horgus*100, 9, 23, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @CorruptedRed, 40, 0, 0, 0, 0, 0, 'CorruptedRed - talk 1 - action list'),
(@Horgus*100, 9, 24, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @CorruptedRed, 40, 0, 0, 0, 0, 0, 'CorruptedRed - On talk 2 - action list'),
(@Horgus*100, 9, 25, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 41, 2, 0, 0, 0, 0, 0, 19, @Marduk, 40, 0, 0, 0, 0, 0, 'Marduk - Despawn - action list'),
(@Marduk, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 80, @Marduk*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Horgus - On spawn - ActionList'),
(@Marduk*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marduk - On Script - Root'),
(@Marduk*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marduk - On Script - Set React Passive'),
(@Marduk*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marduk - On Script - Unit flag non attackable'),
(@Marduk*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - On Script - Set Immune To NPC'),
(@Marduk*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redpath - On Script - Set PACIFIED'),
(@CorruptedRed, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @CorruptedRed*100, 2, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'CorruptedRed - On death - action list'),
(@CorruptedRed*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Joseph, 8, 60000, 0, 0, 0, 8, 0, 0, 0, 1444.337891, -3702.661133, 77.368271, 0.860624, 'Joseph - Spawn  - action list'),
(@CorruptedRed*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - talk3 - action list'),
(@CorruptedRed*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - talk4 - action list'),
(@CorruptedRed*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - talk5 - action list'),
(@CorruptedRed*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 47, 1, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Davil - Set visible - action list'),
(@CorruptedRed*100, 9, 5, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - despawn - action list'),
(@CorruptedRed*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Silver, 100, 0, 0, 0, 0, 0, 'Silver - despawn - action list'),
(@CorruptedRed*100, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - despawn - action list'),
(@CorruptedRed*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Betrayer, 100, 0, 0, 0, 0, 0, 'Silver - despawn - action list'),
(@Lightfire, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @Lightfire*100, 2, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Lightfire - On death - action list'),
(@Lightfire*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Davil - talk4 - action list'),
(@Lightfire*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 6, 5721, 0, 0, 0, 0, 0, 18, 100, 0, 0, 0, 0, 0, 0, 'Player - Quest failed - action list'),
(@Lightfire*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - despawn - action list'),
(@Lightfire*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Silver, 100, 0, 0, 0, 0, 0, 'Silver - despawn - action list'),
(@Lightfire*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @CorruptedRed, 100, 0, 0, 0, 0, 0, 'CorruptedRed - despawn - action list'),
(@Lightfire*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Betrayer, 100, 0, 0, 0, 0, 0, 'Betrayer - despawn - action list'),
(@Lightfire*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Bloodletter, 100, 0, 0, 0, 0, 0, 'Bloodletter - despawn - action list'),
(@Lightfire*100, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Sevant, 100, 0, 0, 0, 0, 0, 'Sevant - despawn - action list'),
(@Lightfire*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Horgus, 100, 0, 0, 0, 0, 0, 'Horgus - despawn - action list'),
(@Lightfire*100, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Skeleton, 100, 0, 0, 0, 0, 0, 'Skeleton - despawn - action list'),
(@Lightfire*100, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Corpse, 100, 0, 0, 0, 0, 0, 'Corpse - despawn - action list'),
(@Lightfire*100, 9, 11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Redpath, 100, 0, 0, 0, 0, 0, 'Redpath - despawn - action list'),
(@Lightfire*100, 9, 12, 0, 0, 0, 100, 0, 1000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Davil - despawn - action list'),
(@Redpath, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @Redpath*100+1, 2, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Redpath - On death - action list'),
(@Redpath*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Davil - talk1 - action list'),
(@Redpath*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 6, 5721, 0, 0, 0, 0, 0, 18, 100, 0, 0, 0, 0, 0, 0, 'Player - quest failed - action list'),
(@Redpath*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Defender, 100, 0, 0, 0, 0, 0, 'Defender - despawn - action list'),
(@Redpath*100+1, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Silver, 100, 0, 0, 0, 0, 0, 'Silver - despawn - action list'),
(@Redpath*100+1, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @CorruptedRed, 100, 0, 0, 0, 0, 0, 'CorruptedRed - despawn - action list'),
(@Redpath*100+1, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Betrayer, 100, 0, 0, 0, 0, 0, 'Betrayer - despawn - action list'),
(@Redpath*100+1, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Bloodletter, 100, 0, 0, 0, 0, 0, 'Bloodletter - despawn - action list'),
(@Redpath*100+1, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Sevant, 100, 0, 0, 0, 0, 0, 'Sevant - despawn - action list'),
(@Redpath*100+1, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Horgus, 100, 0, 0, 0, 0, 0, 'Horgus - despawn - action list'),
(@Redpath*100+1, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Skeleton, 100, 0, 0, 0, 0, 0, 'Skeleton - despawn - action list'),
(@Redpath*100+1, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @Corpse, 100, 0, 0, 0, 0, 0, 'Corpse - despawn - action list'),
(@Redpath*100+1, 9, 11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Davil, 100, 0, 0, 0, 0, 0, 'Davil - despawn - action list'),
(@Defender,0,0,0,0,0,100,0,3000,5000,5000,8000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,'Darrowshire Defender - In Combat - Cast Strike'),
(@Defender,0,1,0,0,0,100,0,5000,7000,7000,10000,11,12169,1,0,0,0,0,1,0,0,0,0,0,0,0,'Darrowshire Defender - In Combat - Cast Shield Block'),
(@Lightfire,0,4,0,4,0,100,1,0,0,0,0,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,'Davil Lightfire - On Aggro - Cast Devotion Aura'),
(@Lightfire,0,5,0,0,0,100,0,5000,7000,8000,10000,11,17284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Davil Lightfire - In Combat - Cast Holy Strike'),
(@Lightfire,0,6,0,0,0,100,0,8000,11000,15000,20000,11,13005,0,0,0,0,0,5,0,0,0,0,0,0,0,'Davil Lightfire - In Combat - Cast Hammer of Justice'),
(@Redpath,0,2,0,0,0,100,0,5000,7000,8000,10000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Captain Redpath - In Combat - Cast Cleave'),
(@Redpath,0,3,0,0,0,100,0,8000,10000,14000,18000,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,'Captain Redpath - In Combat - Cast Backhand'),
(@Redpath,0,4,0,0,0,100,0,3000,5000,15000,20000,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,'Captain Redpath - In Combat - Cast Battle Shout'),
(@Horgus,0,2,0,0,0,100,0,3000,5000,6000,8000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Horgus the Ravager - In Combat - Cast Thrash'),
(@Horgus,0,3,0,0,0,100,0,8000,11000,9000,12000,11,15608,1,0,0,0,0,2,0,0,0,0,0,0,0,'Horgus the Ravager - In Combat - Cast Ravenous Claw'),
(@CorruptedRed,0,1,0,0,0,100,0,3000,5000,5000,7000,11,15580,0,0,0,0,0,2,0,0,0,0,0,0,0,'Redpath the Corrupted - In Combat - Cast Strike'),
(@CorruptedRed,0,2,0,0,0,100,0,8000,10000,14000,18000,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,'Redpath the Corrupted - In Combat - Cast Backhand'),
(@CorruptedRed,0,3,0,0,0,100,0,3000,5000,15000,20000,11,16244,0,0,0,0,0,1,0,0,0,0,0,0,0,'Redpath the Corrupted - In Combat - Cast Demoralizing Shout'),
(@CorruptedRed,0,4,0,0,0,100,0,5000,7000,9000,14000,11,12542,1,0,0,0,0,6,0,0,0,0,0,0,0,'Redpath the Corrupted - In Combat - Cast Fear');

DELETE FROM `waypoints` WHERE `entry` IN (@Lightfire, @Redpath, @Joseph);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@Lightfire,1, 1501.275024, -3675.826172, 81.447624,'Lightfire'),
(@joseph,1, 1433.060059, -3682.163086, 76.364197 , 'Joseph'),
(@joseph,2, 1433.873169, -3640.699707, 78.194763, 'Joseph'),
(@joseph,3, 1454.325439, -3595.439941, 86.951950, 'Joseph'),
(@joseph,4, 1455.368286, -3596.347900, 86.950905, 'Joseph'),
(@Redpath,1, 1501.275024, -3675.826172, 81.447624,'Redpath');

UPDATE `npc_text` SET `BroadcastTextID0`=7454  WHERE `ID`=4777;
DELETE FROM `gossip_menu` WHERE `entry`=3922 AND `text_id`=4777;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3922,4777);
UPDATE `creature_template` SET `gossip_menu_id`=3922 WHERE `entry`=10945;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=10945;
UPDATE `npc_text` SET `BroadcastTextID0`=7455  WHERE `ID`=4778;
DELETE FROM `gossip_menu` WHERE `entry`=3861 AND `text_id`=4778;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3861,4778);
UPDATE `creature_template` SET `gossip_menu_id`=3861 WHERE `entry`=10936;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=10936;

DELETE FROM `creature_text` WHERE `entry` IN (@Defender, @Lightfire, @Horgus, @Redpath, @Marduk, @CorruptedRed, @Joseph, @Pamela, @Davil) ;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
(@Defender, 0, 0, 'Darrowshire, to arms! The Scourge approach!', 14, 0, 100, 0, 0, 0, 'Defender1', 7358),
(@Lightfire, 0, 0, 'Do not lose hope, Darrowshire! We will not fall!', 14, 0, 100, 0, 0, 0, 'Lightfire1', 7343),
(@Horgus, 0, 0, 'The light burns bright in you, Davil, I will enjoy snuffing it out.', 14, 0, 100, 0, 0, 0, 'Horgus', 7344),
(@Lightfire, 1, 0, 'Horgus, your nightmare ends! Now!', 14, 0, 100, 0, 0, 0, 'Lightfire2', 7346),
(@Defender, 1, 0, 'Horgus is slain! Take heat, defenders of Darrowshire.', 14, 0, 100, 0, 0, 0, 'Defender2', 7368),
(@Lightfire, 2, 0, 'Ah! My wounds are too severe. Defenders, fight on without me!', 12, 0, 100, 0, 0, 0, 'Lightfire2', 7227),
(@Lightfire, 3, 0, 'Davil Lightfire has succumbed to his wounds!', 16, 0, 100, 0, 0, 0, 'Lightfire2', 7367),
(@Redpath, 0, 0, 'Defenders of Darrowshire! Rally! we must prevail!', 14, 0, 100, 0, 0, 0, 'Redpath1', 7355),
(@Davil, 1, 0, 'Captain Redpath has appeared on the battlefield! Protect him!', 41, 0, 100, 0, 0, 0, 'Redpath2', 45683),
(@Davil, 0, 0, 'Captain Redpath!  How could you forsake us!', 41, 0, 100, 0, 0, 0, 'Redpath3', 7212),
(@Davil, 2, 0, 'Protect Davil Lightfire!', 41, 0, 100, 0, 0, 0, 'Lightfire1', 45681),
(@Davil, 3, 0, 'Davil Lightfire is defeated!  Darrowshire is lost!', 41, 0, 100, 0, 0, 0, 'Redpath4', 7366),
(@Marduk, 0, 0, 'Redpath! Your life ends, here and now!', 12, 0, 100, 0, 0, 0, 'Marduk1', 7471),
(@CorruptedRed, 0, 0, 'Darrowshire! Your are doomed!', 14, 0, 100, 0, 0, 0, 'CorruptedRed1', 7356),
(@CorruptedRed, 1, 0, 'Captain Joseph Redpath has been corrupted! Kill him quickly!', 41, 0, 100, 0, 0, 0, 'CorruptedRed2', 45684),
(@Defender, 2, 0, 'Captain Redpath is slain!', 14, 0, 100, 0, 0, 0, 'Defender3', 7369),
(@Defender, 3, 0, 'The Scourge are defeated! Darrowshire is saved!', 14, 0, 100, 0, 0, 0, 'Defender4', 7407),
(@Defender, 4, 0, 'Speak with Joseph Redpath in the center of Darrowshire.', 41, 0, 100, 0, 0, 0, 'Defender5', 45685),
(@Joseph, 0, 0, 'Pamela? Are you there, honey?', 12, 0, 100, 0, 0, 0, 'Joseph1', 7397),
(@Pamela, 0, 0, 'Daddy!', 12, 0, 100, 0, 0, 0, 'Pamela1', 7399),
(@Pamela, 1, 0, 'Daddy! You''re back!', 12, 0, 100, 0, 0, 0, 'Pamela2', 7400),
(@Pamela, 2, 0, 'Let''s go play! No, tell me a story, Daddy! No... let''s go pick flowers! And play tea time! I found my dollie, did I tell you?', 12, 0, 100, 0, 0, 0, 'Pamela3', 7401),
(@Pamela, 3, 0, 'I missed you so much, Daddy!', 12, 0, 100, 0, 0, 0, 'Pamela4', 7402),
(@Joseph, 1, 0, 'I missed you too, honey. And I''m finally home...', 12, 0, 100, 0, 0, 0, 'Joseph2', 7403);

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/443
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI',`ScriptName`='' WHERE `entry`=111148;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=111148;

INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(111148,1,1,0,1,0,100,0,0,0,1000,1000,45,1,1,0,0,0,0,19,2164,5,0,0,0,0,0, 'Night Elven Bear Trap - OOC - Set Data closest Rabid Thistle Bear ');

DELETE FROM `smart_scripts` WHERE `entryorguid`=2164 AND `source_type`=0  AND `id`>0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=216400 AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(2164, 0, 1, 0, 38, 0, 100, 1, 1, 1, 0, 0, 80, 216400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - On Data Set - Run Script (No repeat)'),
(2164, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - On Agro store targetlist'),
(216400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - Script - Evade'),
(216400, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 11836, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - Script - Kill Credit'),
(216400, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - Script - Follow Target'),
(216400, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 36, 11836, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - Script - Change Entry to Captured Rabid Thistle Bear'),
(216400, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 120000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rabid Thistle Bear - Script - Follow Target');


-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/438
SET @ENTRY  := 24914; -- NPC entry
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,11,45070,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Sorlof - On Death - Cast Sorlof''s Booty on self');


-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/430
SET @SPELL        := 52992;
SET @WASP         := 28086;
SET @HARDKNUCKLE  := 28096;
SET @WARRIOR      := 28109;
SET @ORACLE       := 28110;
SET @CREDIT1      := 28040;
SET @CREDIT2      := 36189;
SET @CREDIT3      := 29043;
SET @FLIPATTACK   := 50533;
SET @CHARGE       := 49758;
SET @STING        := 34392;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WASP;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WASP;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@WASP;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WASP,0,0,0,2,0,100,0,0,30,7000,9000,11,@STING,1,0,0,0,0,1,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On HP 30% - Cast Stinger Rage'),
(@WASP,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On Spellhit - Give Quest Credit'),
(@WASP,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On Link - Despawn');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@HARDKNUCKLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HARDKNUCKLE;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@HARDKNUCKLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARDKNUCKLE,0,0,0,9,0,100,1,10,30,0,0,11,@CHARGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hardknuckle Charger - On range - Cast Charge'),
(@HARDKNUCKLE,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hardknuckle Charger - On Spellhit - Give Quest Credit'),
(@HARDKNUCKLE,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hardknuckle Charger - On Link - Despawn');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WARRIOR;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WARRIOR;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@WARRIOR;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WARRIOR,0,0,0,0,0,100,0,2000,6000,4000,7000,11,@FLIPATTACK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Mistwhisper Warrior - IC - Cast Flip Arrack'),
(@WARRIOR,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mistwhisper Warrior - On Spellhit - Give Quest Credit'),
(@WARRIOR,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Warrior - On Link - Despawn');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ORACLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ORACLE;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ORACLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ORACLE,0,0,0,0,0,100,0,4000,7000,11000,19000,11,54921,1,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Oracle - IC - Cast Lightning Cloud'),
(@ORACLE,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mistwhisper Oracle - On Spellhit - Give Quest Credit'),
(@ORACLE,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Oracle - On Link - Despawn');

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/422
SET @LETOLL       := 22458;
SET @RESEARCHER   := 22464;
SET @B_SIFTER     := 22466;
SET @SG_TRIGGER   := 22457;
SET @RESEARCHER1  := 78837;

DELETE FROM `creature_text` WHERE `entry`=@LETOLL;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@LETOLL,0,0,"'Aright, listen up! Form a circle around me and move out!",12,0,100,0,0,0,''),
(@LETOLL,1,0,"Aright, $R, just keep us safe from harm while we work. We'll pay you when we return.",12,0,100,0,0,0,''),
(@LETOLL,2,0,"The dig site is just north of here.",12,0,100,0,0,0,''),
(@LETOLL,3,0,"We're here! Start diggin'!",12,0,100,0,0,0,''),
(@LETOLL,4,0,"I think there's somethin' buried here, beneath the sand!",12,0,100,396,0,0,''),
(@LETOLL,5,0,"Almost got it!",12,0,100,396,0,0,''),
(@LETOLL,6,0,"By Brann's brittle bananas! What is it?! It... It looks like a drum.",12,0,100,396,0,0,''),
(@LETOLL,7,0,"Have ye gone mad? You expect me to leave behind a drum without first beatin' on it? Not this son of Ironforge! No sir!",12,0,100,0,0,0,''),
(@LETOLL,8,0,"Shut yer yaps! I'm gonna bang on this drum and that's that!",12,0,100,0,0,0,''),
(@LETOLL,9,0,"IN YOUR FACE! I told you there was somethin' here!",12,0,100,0,0,0,''),
(@LETOLL,10,0,"Don't just stand there! Help him out!",12,0,100,0,0,0,''),
(@LETOLL,11,0,"You've been a tremendous help, $R! Let's get out of here before more of those things show up! I'll let Dwarfowitz know you did the job asked of ya' admirably.",12,0,100,0,0,0,'');

DELETE FROM `creature_text` WHERE `entry`=@RESEARCHER;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@RESEARCHER,0,0,"Wow... a drum.",12,0,100,0,0,0,''),
(@RESEARCHER,1,0,"This discovery will surely rock the foundation of modern archaeology.",12,0,100,0,0,0,''),
(@RESEARCHER,2,0,"Yea, great. Can we leave now? This desert is giving me hives.",12,0,100,0,0,0,''),
(@RESEARCHER,3,0,"This reminds me of that one time where you made us search Silithus for evidence of sand gnomes.",12,0,100,0,0,0,''),
(@RESEARCHER,4,0,"Or that time when you told us that you'd discovered the cure for the plague of the 20th century. What is that even? 20th century?",12,0,100,0,0,0,''),
(@RESEARCHER,5,0,"I don't think it can top the one time where he told us that he'd heard that Arthas's cousin's skeleton was frozen beneath a glacier in Winterspring. I'll never forgive you for that one, Letoll. I mean honestly... Arthas's cousin?",12,0,100,0,0,0,''),
(@RESEARCHER,6,0,"I dunno. It can't possibly beat the time he tried to convince us that we're all actually a figment of some being's imagination and that they only use us for their own personal amusement. That went over well during dinner with the family.",12,0,100,0,0,0,''),
(@RESEARCHER,7,0,"Say, do you guys hear that?",12,0,100,0,0,0,'');

DELETE FROM `waypoints` WHERE `entry` IN (@LETOLL,@RESEARCHER,@LETOLL*100);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@LETOLL,0,-3728.1,5385.5,-3.41,''),
(@LETOLL,1,-3735.9,5392.8,-4.8,''),
(@LETOLL,2,-3729.7,5381,-4.9,''),
(@LETOLL,3,-3704.6, 5372.74, -9.33,''),
(@LETOLL,4,-3704.8,5374.7,-8.9,''),
(@LETOLL,5,-3623.2,5403.2,-11.5,''),
(@LETOLL,6,-3554.6,5455.2,-11.3,''),
(@LETOLL,7,-3557.7,5468.9,-8.1,''),
(@LETOLL,8,-3548.9,5458.3,-12.3,''),
(@RESEARCHER,0,-3725.1,5381.9,-4.4,''),
(@RESEARCHER,1,-3735.7,5390.7,-5.7,''),
(@RESEARCHER,2,-3728.4,5384.1,-3.4,''),
(@RESEARCHER,3,-3703.1,5371.4,-10.1,''),
(@RESEARCHER,4,-3619.6,5400.8,-12.1,''),
(@RESEARCHER,5,-3554.2,5451.1,-11.8,''),
(@RESEARCHER,6,-3563.1,5462.8,-6.5,''),
(@RESEARCHER,7,-3551.1,5454,-11.9,'');


UPDATE `creature_template` SET `AIname`='SmartAI' WHERE `entry` IN (@LETOLL,@RESEARCHER,@B_SIFTER);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@LETOLL,-@RESEARCHER1,@B_SIFTER);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@LETOLL*100+2,@LETOLL*100+1,@LETOLL*100,@RESEARCHER*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@LETOLL,0,0,1,19,0,100,0,10922,0,0,0,53,0,@LETOLL,0,0,0,0,1,0,0,0,0,0,0,0,'On quest accept - Start WP'),
(@LETOLL,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say line 0'),
(@LETOLL,0,2,3,40,0,100,0,1,@LETOLL,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Pause WP'),
(@LETOLL,0,3,10,61,0,100,0,0,0,0,0,80,@LETOLL*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Start Timed Event'),
(@LETOLL,0,4,5,40,0,100,0,7,@LETOLL,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Set emote digging'),
(@LETOLL,0,5,0,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,78837,@RESEARCHER,0,0,0,0,0,'On Link - Set Data'),
(@LETOLL,0,6,7,40,0,100,0,8,@LETOLL,0,0,17,467,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Set emote digging'),
(@LETOLL,0,7,8,61,0,100,0,0,0,0,0,45,0,3,0,0,0,0,10,78837,@RESEARCHER,0,0,0,0,0,'On Link - Set Data'),
(@LETOLL,0,8,0,61,0,100,0,0,0,0,0,80,@LETOLL*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Start Timed Event'),
(@LETOLL,0,9,0,40,0,100,0,6,@LETOLL,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Say line 3'),
(@LETOLL,0,10,0,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set npc flag'),
(@LETOLL,0,11,0,40,0,100,0,7,@LETOLL,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Pause WP'),
--
(-@RESEARCHER1,0,0,0,38,0,100,0,0,1,0,0,53,0,@RESEARCHER,0,0,0,0,1,0,0,0,0,0,0,0,'On Data - Start WP'),
(-@RESEARCHER1,0,1,2,40,0,100,0,5,@RESEARCHER,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,' On Data - Start WP'),
(-@RESEARCHER1,0,2,0,61,0,100,0,0,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Start digging'),
(-@RESEARCHER1,0,3,4,40,0,100,0,6,@RESEARCHER,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pause WP'),
(-@RESEARCHER1,0,4,0,61,0,100,0,0,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Start digging'),
(-@RESEARCHER1,0,5,6,40,0,100,0,7,@RESEARCHER,0,0,54,35500,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Pause WP'),
(-@RESEARCHER1,0,6,0,61,0,100,0,0,0,0,0,80,@RESEARCHER*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'ON WP reached - Start Timed Event'),
(-@RESEARCHER1,0,7,0,11,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Respawn - Set Emote State none'),
-- 
(@LETOLL*100,9,0,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 1'),
(@LETOLL*100,9,1,0,0,0,100,0,7000,7000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 2'),
(@LETOLL*100,9,2,0,0,0,100,0,500,500,0,0,45,0,1,0,0,0,0,10,78837,@RESEARCHER,0,0,0,0,0,'On Script - Set Data'),
--
(@LETOLL*100+1,9,0,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 4'),
(@LETOLL*100+1,9,1,0,0,0,100,0,2000,2000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 5'),
(@LETOLL*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 6'),
--
(@RESEARCHER*100,9,0,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 0'),
(@RESEARCHER*100,9,1,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Set emote state none'),
(@RESEARCHER*100,9,2,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 1'),
(@RESEARCHER*100,9,3,0,0,0,100,0,7000,7000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 2'),
--
(@LETOLL*100+1,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Set emote state none'),
(@LETOLL*100+1,9,4,0,0,0,100,0,22000,22000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 7'),
--
(@RESEARCHER*100,9,4,0,0,0,100,0,12000,12000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 3'),
(@RESEARCHER*100,9,5,0,0,0,100,0,6000,6000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 4'),
(@RESEARCHER*100,9,6,0,0,0,100,0,6000,6000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 5'),
(@RESEARCHER*100,9,7,0,0,0,100,0,17000,17000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 6'),
--
(@LETOLL*100+1,9,5,0,0,0,100,0,34000,34000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 8'),
--
(@RESEARCHER*100,9,8,0,0,0,100,0,6000,6000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 7'),
(@RESEARCHER*100,9,9,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Despawn'),
--
(@LETOLL*100+1,9,6,0,0,0,100,0,7000,7000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 9'),
(@LETOLL*100+1,9,7,0,0,0,100,0,500,500,0,0,12,@B_SIFTER,1,60000,0,0,0,8,0,0,0,-3550,5456.1,-12.3,0,'On Script - Summon worm'),
(@LETOLL*100+1,9,8,0,0,0,100,0,8000,8000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 10'),
(@LETOLL*100+1,9,9,0,0,0,100,0,8000,8000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 11'),
(@LETOLL*100+1,9,10,0,0,0,100,0,6000,6000,0,0,15,10922,0,0,0,0,0,18,20,0,0,0,0,0,0,'On Script - Give quest credit'),
(@LETOLL*100+1,9,11,0,0,0,100,0,3000,3000,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Restore npcflags'),
(@LETOLL*100+1,9,12,0,0,0,100,0,1000,1000,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,' On Script - Stop Script'),
(@LETOLL*100+1,9,13,0,0,0,100,0,16000,16000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Despawn'),
--
(@B_SIFTER,0,0,0,0,0,100,0,2000,6000,12000,17000,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,'- IC - Cast Poison'),
(@B_SIFTER,0,1,0,0,0,100,0,5000,25000,35000,40000,11,32738,0,0,0,0,0,2,0,0,0,0,0,0,0,'- IC - Cast Bore');

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/409
SET @ENTRY := 18128;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,75,1,0,0,0,0,11,35336,7,0,0,0,0,2,0,0,0,0,0,0,0,"Sporebat - On Death - Cast 35336"),
(@ENTRY,0,1,0,0,0,100,0,1000,1000,15000,15000,11,35394,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sporebat - In Combat - Cast 35394");

SET @ENTRY := 18129;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,75,1,0,0,0,0,11,35336,7,0,0,0,0,2,0,0,0,0,0,0,0,"Greater Sporebat - On Death - Cast 35336"),
(@ENTRY,0,1,0,0,0,100,0,1000,1000,15000,15000,11,35394,0,0,0,0,0,2,0,0,0,0,0,0,0,"Greater Sporebat - In Combat - Cast 35394");

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/315
DELETE FROM `conditions` WHERE `SourceEntry` IN (32307) AND `ConditionValue2` IN (17148,17147,17146,18391);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,32307,0,18,1,17148,0,0,'',"Spell Place Kil'sorrow Banner can not only be cast on Kil'sorrow mobs"), -- Kil'sorrow Deathsworn
(13,0,32307,1,18,1,17147,0,0,'',"Spell Place Kil'sorrow Banner can not only be cast on Kil'sorrow mobs"), -- Kil'sorrow Cultist
(13,0,32307,2,18,1,17146,0,0,'',"Spell Place Kil'sorrow Banner can not only be cast on Kil'sorrow mobs"), -- Kil'sorrow Spellbinder
(13,0,32307,3,18,1,18391,0,0,'',"Spell Place Kil'sorrow Banner can not only be cast on Kil'sorrow mobs"); -- Giselda the Crone

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/360
SET @QUEST                              := 12498;
SET @NPC_WYRMREST_VANQUISHER            := 27996; -- Wyrmrest Vanquisher
SET @NPC_THIASSI_THE_LIGHNTNING_BRINGER := 28018; -- Thiassi the Lightning Bringer
SET @NPC_GRAND_NECROLORD_ANTIOK         := 28006; -- Grand Necrolord Antiok
SET @NPC_WASTES_SCAVENGER               := 28005; -- Wastes Scavenger
SET @SPELL_DEVOUR_GHOUL                 := 50430; -- Devour Ghoul
SET @SPELL_ENGULFING_FIREBALL           := 55987; -- Engulfing Fireball
SET @SPELL_FLAME_FURY                   := 50348; -- Flame Fury
SET @SPELL_MOUNT                        := 50343; -- Controlling Wyrmrest Vanquisher
SET @ITEM_SCYTHE_OF_ANTIOK              := 38305; -- Item Scythe of Antiok

UPDATE `creature_template` SET npcflag=16777216, `spell1`=@SPELL_FLAME_FURY, `spell2`=@SPELL_ENGULFING_FIREBALL, `spell3`=@SPELL_DEVOUR_GHOUL, `InhabitType`=4 WHERE `entry`=@NPC_WYRMREST_VANQUISHER;

DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (@NPC_WYRMREST_VANQUISHER);
INSERT INTO `npc_spellclick_spells` VALUES (@NPC_WYRMREST_VANQUISHER, @SPELL_MOUNT, 1, 0);

DELETE FROM `creature_template_addon` WHERE `entry` in (@NPC_WYRMREST_VANQUISHER, @NPC_GRAND_NECROLORD_ANTIOK);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC_WYRMREST_VANQUISHER,0,0,50331648,0,0,'50345'),
(@NPC_GRAND_NECROLORD_ANTIOK,0,0,0,0,0,'50494');

UPDATE vehicle_template_accessory set minion=0,`summontype`=1 where entry=@NPC_THIASSI_THE_LIGHNTNING_BRINGER; 

Delete from creature_loot_template where entry =@NPC_GRAND_NECROLORD_ANTIOK and item=@ITEM_SCYTHE_OF_ANTIOK;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_FLAME_FURY;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_FLAME_FURY,0,1,31,0,3,@NPC_WASTES_SCAVENGER,0,0,0,0,'','Flame Fury can only Hit Wastes Scavenger');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=55988;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 55988, 0, 2, 31, 0, 3, 26493, 0, 0, 0, 0, '', 'Engulfing Fireball targets Wastes Task Manager'),
(13, 1, 55988, 0, 1, 31, 0, 3, 26492, 0, 0, 0, 0, '', 'Engulfing Fireball targets Wastes Digger'),
(13, 1, 55988, 0, 0, 31, 0, 3, 28005, 0, 0, 0, 0, '', 'Engulfing Fireball targets Wastes Scavenger'),
(13, 2, 55988, 0, 0, 31, 0, 3, 27270, 0, 0, 0, 0, '', 'Engulfing Fireball targets Rotting Storm Giant'),
(13, 2, 55988, 0, 1, 31, 0, 3, 28018, 0, 0, 0, 0, '', 'Engulfing Fireball targets Thiassi');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (50430,50443);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,50430,0,0,31,0,3,28005,0,0,0,0,'','Devour Ghoul targets Wastes Scavenger'),
(13,3,50443,0,0,31,0,3,27996,0,0,0,0,'','Nourishment targets Wyrmrest Vanquisher');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`in (16,17) AND `SourceEntry` IN (27996,50426);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(16, 0, 27996, 0, 0, 23, 0, 4161, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher allowed in Wyrmrest Temple'),
(16, 0, 27996, 0, 4, 23, 0, 4184, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher allowed in Path of the Titans'),
(16, 0, 27996, 0, 3, 23, 0, 4174, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher allowed in The Wicked Coil'),
(16, 0, 27996, 0, 2, 23, 0, 4173, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher allowed in Galakronds Rest'),
(16, 0, 27996, 0, 1, 23, 0, 4254, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher allowed in The Dragon Wastes'),
(17, 0, 50426, 0, 3, 23, 0, 4174, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher can be summoned  in The Wicked Coil'),
(17, 0, 50426, 0, 2, 23, 0, 4173, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher can be summoned  in Galakronds Rest'),
(17, 0, 50426, 0, 1, 23, 0, 4254, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher can be summoned in The Dragon Wastes'),
(17, 0, 50426, 0, 0, 23, 0, 4161, 0, 0, 0, 0, 0, '', 'Wyrmrest Vanquisher can be summoned in Wyrmrest Temple');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 and `SourceEntry`=@NPC_WYRMREST_VANQUISHER;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,@NPC_WYRMREST_VANQUISHER,0,9,12498,0,0,0,'','event require quest taken to prevent despawn when the spell devour ghoul is casted'),
(22,5,@NPC_WYRMREST_VANQUISHER,1,28,12498,0,0,0,'','event require quest complete to prevent despawn when the spell devour ghoul is casted');

UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (@NPC_GRAND_NECROLORD_ANTIOK, @NPC_THIASSI_THE_LIGHNTNING_BRINGER, @NPC_WYRMREST_VANQUISHER);
DELETE FROM smart_scripts WHERE entryorguid = @NPC_GRAND_NECROLORD_ANTIOK and source_type=0;
DELETE FROM smart_scripts WHERE entryorguid = @NPC_THIASSI_THE_LIGHNTNING_BRINGER and source_type=0;
DELETE FROM smart_scripts WHERE entryorguid = @NPC_WYRMREST_VANQUISHER and source_type=0;
DELETE FROM smart_scripts WHERE entryorguid = @NPC_WYRMREST_VANQUISHER*100 and source_type=9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 28005 and source_type=0 and id=14; -- (there is already a script for this npc id=0 to id=13) 
DELETE FROM `smart_scripts` WHERE `entryorguid` = 28005*100 and source_type=9;

INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES

(@NPC_GRAND_NECROLORD_ANTIOK, 0, 0, 0, 0, 0, 100, 0, 7000, 7000, 18000, 18000, 11, 32863, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - IC - Cast Demon Seed'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 1, 0, 0, 0, 100, 0, 1100, 1100, 20000, 20000, 11, 50455, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - IC - Cast Shadow Bolt'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 2, 0, 1, 0, 100, 0, 10000, 10000, 40000, 40000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - OOC - Random Yell'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 3, 0, 2, 0, 100, 1, 0, 25, 0, 0, 11, 50497, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - HP under 25% - Cast Scream of Chaos'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 4, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 50472, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - On Death - Cast Drop Scythe of Antiok'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 5, 7, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - On Aggro - Yell'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 55984, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - On Aggro - Cast Shadow Bolt'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 7, 8, 4, 0, 100, 0, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 19, @NPC_WYRMREST_VANQUISHER, 20, 0, 0, 0, 0, 0, 'Nekrolord Antiok - On Aggro - kill WYRMREST'),
(@NPC_GRAND_NECROLORD_ANTIOK, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 50494, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - On Aggro - remove aura'),

(@NPC_THIASSI_THE_LIGHNTNING_BRINGER, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 12000, 14000, 11, 50456, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - IC - Cast Thiassi''s Stormbolt'),
(@NPC_THIASSI_THE_LIGHNTNING_BRINGER, 0, 1, 0, 0, 0, 100, 0, 9000, 9000, 15000, 19000, 11, 15593, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - IC - Cast War Stomp'),
(@NPC_THIASSI_THE_LIGHNTNING_BRINGER, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 19, 2146959359, 0, 0, 0, 0, 0, 19, @NPC_GRAND_NECROLORD_ANTIOK, 10, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - On Death - remove unitflag from target'),

(@NPC_WYRMREST_VANQUISHER, 0, 0, 0, 1, 0, 100, 0, 9000, 9000, 30000, 30000, 1, 0, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 'WYRMREST VANQUISHER - OOC - Random talk'),
(@NPC_WYRMREST_VANQUISHER, 0, 1, 0, 2, 0, 100, 1, 0, 33, 0, 0, 1, 1, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 'WYRMREST VANQUISHER - HP under 33% - talk'),
(@NPC_WYRMREST_VANQUISHER, 0, 3, 0, 54, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'WYRMREST VANQUISHER - Just summoned - react passif'),
(@NPC_WYRMREST_VANQUISHER, 0, 4, 0, 28, 0, 100, 0, 0, 0, 0, 0, 80, @NPC_WYRMREST_VANQUISHER*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'WYRMREST VANQUISHER - PASSENGER_REMOVED - Actionlist'),
(@NPC_WYRMREST_VANQUISHER*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 'WYRMREST VANQUISHER - ActionList - talk'),
(@NPC_WYRMREST_VANQUISHER*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'WYRMREST VANQUISHER - ActionList - despawn'),

(28005, 0, 14, 0, 8, 0, 100, 0, 50430, 0, 0, 0, 80, 28005*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wastes Scavenger - On spellhit Devour Ghoul - Run script'),
(28005*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 50437, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wastes Scavenger script - Spellcast Devour Ghoul'),
(28005*100, 9, 1, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 11, 50443, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wastes Scavenger script - Spellcast Nourishment'),
(28005*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wastes Scavenger script - Despawn');

DELETE FROM creature_text WHERE entry in (@NPC_GRAND_NECROLORD_ANTIOK, @NPC_WYRMREST_VANQUISHER);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
(@NPC_GRAND_NECROLORD_ANTIOK,0,0,'You think you''ve won, mortal? Face the unbridled power of Antiok!',14,0,100,0,0,0,'Antiok Yell1',27415),
(@NPC_GRAND_NECROLORD_ANTIOK,0,1,'Behold! The Scythe of Antiok!',14,0,100,0,0,0,'Antiok Yell2', 27416),
(@NPC_GRAND_NECROLORD_ANTIOK,1,0,'Soon, the bones of Galakrond will rise from their eternal slumber and wreak havoc upon this world!',14,0,100,0,0,0,'Antiok Yell3', 27406),
(@NPC_GRAND_NECROLORD_ANTIOK,1,1,'The Lich King demands more frost wyrms be sent to Angrathar! Meet his demands or face my wrath!',14,0,100,0,0,0,'Antiok Yell4', 27408),
(@NPC_GRAND_NECROLORD_ANTIOK,1,2,'Faster, dogs! We mustn''t relent in our assault against the interlopers!',14,0,100,0,0,0,'Antiok Yell5', 27405),
(@NPC_GRAND_NECROLORD_ANTIOK,1,3,'Attackers are upon us! Let none through to this ancient grave!',14,0,100,0,0,0,'Antiok Yell6', 27409),
(@NPC_GRAND_NECROLORD_ANTIOK,1,4,'Hear me, minions! Hear your lord, Antiok! Double your efforts or pay the consequences of failure!',14,0,100,0,0,0,'Antiok Yell7', 27407),
(@NPC_WYRMREST_VANQUISHER,0,1,'Across this vast expanse rest the bones of my ancestors. Their spirits have ascended to the Chamber of the Aspects.',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27394),
(@NPC_WYRMREST_VANQUISHER,0,2,'Galakrond was the progenitor of dragonkind. It was from Galakrond that the Titans shaped the five Aspects.',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27396),
(@NPC_WYRMREST_VANQUISHER,0,3,'It truly is a shame that the blue dragonflight has chosen such a heartless, cold path. It pains me greatly to do battle with Malygos''s children.',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27400),
(@NPC_WYRMREST_VANQUISHER,0,4,'The queen and her council have been speaking lately of a disaster at Ulduar. Something has happened in Storm Peaks!',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27399),
(@NPC_WYRMREST_VANQUISHER,0,5,'Today is a good day, friend. Long has it been since I have left Wyrmrest Temple, free to fly across the great Dragonblight.',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27398),
(@NPC_WYRMREST_VANQUISHER,0,6,'What the Scourge has done here will reverberate throughout our world. The aberrations must be stopped!',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27395),
(@NPC_WYRMREST_VANQUISHER,1,0,'You must remember that I have yet to mature into an elder wyrm. I must eat to renew my strength!',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27397),
(@NPC_WYRMREST_VANQUISHER,2,0,'I have been called back to Wyrmrest, ally. Farewell!',12,0,100,0,0,0,'WYRMREST VANQUISHER', 27404);

UPDATE `creature` SET `equipment_id`=0 WHERE  `guid` IN(74522,74523,74524);

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/293
SET @FORCEFIELD := 529209;
DELETE FROM `gameobject` WHERE `guid`= @FORCEFIELD;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneid`,`areaid`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@FORCEFIELD,149431,109,0,0,1,1,-518.154,-85.2353,-74.488,3.14159,0,0,0,0,43200,100,1);

SET @ZOLO   := 5712;
SET @GASHER := 5713;
SET @LORO   := 5714;
SET @HUKKU  := 5715;
SET @ZULLOR := 5716;
SET @MIJAN  := 5717;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`= @GASHER;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @GASHER AND `source_type` = 0 AND `id` =  0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @MIJAN  AND `source_type` = 0 AND `id` =  4;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @HUKKU  AND `source_type` = 0 AND `id` = 14;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ZOLO,@LORO,@ZULLOR) AND `source_type`= 0 AND `id`= 2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- 28
(@ZOLO,  0, 2,0, 6, 0,100,0,0,0,0,0, 34, 2, 1, 0,0,0,0,0,0,0,0,0,0,0,0, 'Zolo - On Just Died - Set Instance Data 2 to 1'),
(@GASHER,0, 0,0, 6, 0,100,0,0,0,0,0, 34, 2, 1, 0,0,0,0,0,0,0,0,0,0,0,0, 'Gasher - On Just Died - Set Instance Data 2 to 1'),
(@LORO,  0, 2,0, 6, 0,100,0,0,0,0,0, 34, 2, 1, 0,0,0,0,0,0,0,0,0,0,0,0, 'Loro - On Just Died - Set Instance Data 2 to 1'),
(@HUKKU, 0,14,0, 6, 0,100,0,0,0,0,0, 34, 2, 1, 0,0,0,0,0,0,0,0,0,0,0,0, 'Hukku - On Just Died - Set Instance Data 2 to 1'),
(@ZULLOR, 0, 2,0, 6, 0,100,0,0,0,0,0, 34, 2, 1, 0,0,0,0,0,0,0,0,0,0,0,0, 'Zul\'Lor - On Just Died - Set Instance Data 2 to 1'),
(@MIJAN, 0, 4,0, 6, 0,100,0,0,0,0,0, 34, 2, 1, 0,0,0,0,0,0,0,0,0,0,0,0, 'Mijan - On Just Died - Set Instance Data 2 to 1');

-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/296
SET @ENTRY := 24539;
SET @SCRIPT := @ENTRY * 100;
SET @SCRIPT1 := (@ENTRY * 100) + 1;
SET @GOSSIP_1 := 9010;
SET @GOSSIP_2 := 9011;
SET @QUEST := 11464;
SET @SPELL_SCORCH := 50183;
SET @SPELL_BLAST_WAVE := 15091;

-- SAI support - "Silvermoon" Harry
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SCRIPT,@SCRIPT1) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,@GOSSIP_1,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary - On Gossip Select option 2 - Set Faction Aggressive'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Silvermoon Hary - On Gossip Select - Close Gossip'),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Silvermoon Hary - Linked with previous event - Say Line 0'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary - Linked with previous event - Set faction aggressive'),
(@ENTRY,0,4,0,2,0,100,1,1,50,60000,60000,80,@SCRIPT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary - On hp % between 1/50 - Start acitonlist'),
(@ENTRY,0,5,0,64,1,100,0,0,0,0,0,98,@GOSSIP_2,12175,0,0,0,0,7,0,0,0,0,0,0,0, 'Silvermoon Hary - On gossip hello in phase 1 - Send gossip menu 2'),
(@ENTRY,0,6,0,62,1,100,0,@GOSSIP_2,0,0,0,80,@SCRIPT1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary - On gossip select - Start actionlist 1'),
(@ENTRY,0,7,0,0,0,100,0,3000,6000,15000,22000,11,@SPELL_BLAST_WAVE,1,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary - IC - Cast Blast Wave'),
(@ENTRY,0,8,0,0,0,100,0,2500,4000,4000,5000,11,@SPELL_SCORCH,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Silvermoon Hary - IC - Cast Scorch'),
(@SCRIPT,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 0) - Action 0 - Say line 1'),
(@SCRIPT,9,1,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 0) - Action 1 - Set hp reg disabled'),
(@SCRIPT,9,2,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 0) - Action 2 - Set home position'),
(@SCRIPT,9,3,0,0,0,100,0,0,0,0,0,2,1080,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 0) - Action 3 - Change faction to friendly'),
(@SCRIPT,9,4,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 0) - Action 4 - Evade (to stop attack)'),
(@SCRIPT,9,5,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 0) - Action 6 - Set event phase 1'),
(@SCRIPT1,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Silvermoon Hary (script 1) - Action 0 - Close gossip window'),
(@SCRIPT1,9,1,0,0,0,100,0,0,0,0,0,56,34115,1,0,0,0,0,7,0,0,0,0,0,0,0, 'Silvermoon Hary (script 1) - Action 1 - Give item to invoker'),
(@SCRIPT1,9,2,0,0,0,100,0,0,0,0,0,102,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 1) - Action 2 - Set hp reg enabled'),
(@SCRIPT1,9,3,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 1) - Action 3 - Despawn in 10 sec'),
(@SCRIPT1,9,4,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Silvermoon Hary (script 1) - Action 4 - Set event phase 0');

-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Do not test me, scurvy dog! I''m trained in the way of Blood Knights!',12,0,100,0,0,0, 'Silvermoon Hary - start to fight'),
(@ENTRY,1,0,"I'll pay! I'll pay! Eeeek! Please don't hurt me!",12,0,100,0,0,0, 'Silvermoon Hary - second gossip');

-- Gossip menu
DELETE FROM `gossip_menu` WHERE `entry` IN (@GOSSIP_1,@GOSSIP_2);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GOSSIP_1,12174),
(@GOSSIP_2,12175);

-- Gossip option menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP_1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP_2;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_id`,`npc_option_npcflag`,`option_icon`,`option_text`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP_1,0,1,1,0, 'Taruk sent me to collect what you owe.',0,0, ''),
(@GOSSIP_1,1,3,128,1, 'Do you sell any of this stuff?',0,0, ''),
(@GOSSIP_2,0,1,1,0, 'Pay up, Harry!',0,0, ''),
(@GOSSIP_2,1,3,128,1, 'Do you sell any of this stuff?',0,0, '');

-- Condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (@GOSSIP_1,@GOSSIP_2);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP_1,0,0,9,0,@QUEST,0,0,0,'','Only show first gossip (option 0) if player is on quest Gambling Debt'),
(15,@GOSSIP_2,0,0,9,0,@QUEST,0,0,0,'','Only show second gossip (option 0) if player is on quest Gambling Debt');
--
UPDATE `smart_scripts` SET `event_phase_mask`=0 WHERE  `entryorguid`=24539 AND `source_type`=0 AND `id` IN(5,6) AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=2453900 AND `source_type`=9 AND `id`=5 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=2453901 AND `source_type`=9 AND `id`=4 AND `link`=0;
UPDATE `smart_scripts` SET `event_param3`=0, `event_param4`=0 WHERE  `entryorguid`=24539 AND `source_type`=0 AND `id`=4 AND `link`=0;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=24539;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 6, 24539, 0, 0, 38, 1, 50, 4, 0, 0, 0, 0, '', 'Silvermoon Harry - Only run SAI if silvermoon harry hp at 50% or lower'),
(22, 6, 24539, 0, 0, 9, 0, 11464, 0, 0, 0, 0, 0, '', 'Silvermoon Harry - Only run SAI if player has gambling debt taken');
