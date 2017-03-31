-- assign scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_runebladed_sword' WHERE  `entry`=28476;
UPDATE `creature_template` SET `ScriptName`='npc_runeforge_trigger', `AIName`='' WHERE  `entry`=28481;

-- remove current sai
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28481;

-- remove sword spawns
delete from creature where id = 28476;