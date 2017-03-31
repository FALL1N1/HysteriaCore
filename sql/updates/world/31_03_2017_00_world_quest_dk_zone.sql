-- assign scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_runebladed_sword' WHERE  `entry`=28476;
UPDATE `creature_template` SET `ScriptName`='npc_runeforge_trigger', `AIName`='' WHERE  `entry`=28481;

-- remove current sai
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28481;

-- remove sword spawns
delete from creature where id = 28476;

-- olrun the battlecaller OnGossipHello interrupting movement and causing her to be stuck in air
UPDATE `waypoint_data` SET `move_type` = 3 WHERE `id` = 1287390;

-- insert scriptname f
delete from spell_script_names where spell_id = 52964;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (52694, 'spell_q12641_recall_eye_of_acherus');
