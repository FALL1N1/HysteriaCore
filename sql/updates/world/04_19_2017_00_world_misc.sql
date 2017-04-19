-- cos waypoints for bosses

SET @WPGUID := 20830274;

delete from creature_template_addon where entry in(26529, 26530);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(26529, @WPGUID, 0, 0, 0, 0, NULL), -- meathook
(26530, @WPGUID, 0, 0, 0, 0, NULL); - salramm
delete from waypoint_data where id = @WPGUID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@WPGUID, 11, 2351.52, 1197.95, 130.444, 0, 0, 0, 0, 100, 0);
(@WPGUID, 10, 2325.94, 1176.1, 132.979, 0, 0, 0, 0, 100, 0);
(@WPGUID, 9, 2245.52, 1169.46, 137.59, 0, 0, 0, 0, 100, 0);
(@WPGUID, 8, 2170.9, 1255.13, 134.816, 0, 0, 0, 0, 100, 0);
(@WPGUID, 7, 2186.49, 1335.78, 130.049, 0, 0, 0, 0, 100, 0);
(@WPGUID, 6, 2139.14, 1351.94, 132.072, 0, 0, 0, 0, 100, 0);
(@WPGUID, 5, 2219.12, 1331.17, 128.11, 0, 0, 0, 0, 100, 0);
(@WPGUID, 4, 2180.95, 1329.96, 129.991, 0, 0, 0, 0, 100, 0);
(@WPGUID, 3, 2171.15, 1251.85, 135.168, 0, 0, 0, 0, 100, 0);
(@WPGUID, 2, 2240.9, 1173.33, 137.171, 0, 0, 0, 0, 100, 0);
(@WPGUID, 1, 2349.07, 1181.84, 130.416, 0, 0, 0, 0, 100, 0);



-- patchwerk link with all adds in his room
SET @PATCHWERKGuid := 128135;
-- [28 total adds]
DELETE FROM `creature_formations` WHERE `leaderGUID`=@PATCHWERKGuid;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(@PATCHWERKGuid, 128095, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128091, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128086, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128094, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128096, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 97718, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128069, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128068, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128099, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128087, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128097, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128092, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128088, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128098, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128164, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128083, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128080, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128082, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128101, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128079, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128078, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 97736, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 97747, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128093, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128090, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128100, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128089, 0, 0, 2, 0, 0),
(@PATCHWERKGuid, 128102, 0, 0, 2, 0, 0);

-- areatrigger for naxx port to frostwyrm lair
DELETE FROM areatrigger_scripts WHERE entry = 4156;
INSERT INTO areatrigger_scripts VALUES (4156, 'at_naxxramas_frostwyrm_wing');

-- misc issues in the nexus
delete from creature_addon where guid = 247105
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(247105, 0, 0, 0, 1, 333, '47543');

-- rewrite spell Ticking Bomb
DELETE FROM `smart_scripts` WHERE  `entryorguid`=29684;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_time_bomb_explode_bunny' WHERE  `entry`=29684;