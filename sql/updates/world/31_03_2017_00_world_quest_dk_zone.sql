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

-- citizens
delete from smart_scripts where entryorguid in(28557, 28577, 28576);
update creature_template set AIName = '', scriptname = 'npc_citizen_of_havenshire' where entry in(28557, 28577, 28576);
delete from creature_text where entry in(28557, 28577, 28576);
insert into `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) values 
(28557, 0, 0, 'Don\'t kill me! I only took this job for the benefits!', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 1, 'I picked the wrong week to quit drinkin\'!', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 2, 'I\'ve got five kids! They\'ll die without me!', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 3, 'I... I got a sick grandma at home... I... I\'m all she\'s got.', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 4, 'Let me live! I\'ll do whatever you say!', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 5, 'Please, no! Spare me!', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 6, 'Ungh... I... I think I pooped...', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 7, 'You don\'t have to do this! Nobody has to die!', 12, 0, 100, 0, 0, 0, 0, 'Scarlet Peasant'),
(28576, 0, 0, 'Come then, death knight!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 0, 1, 'Die Scourge dog! DIE!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 0, 2, 'DIE!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 0, 3, 'I won\'t go down that easy!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 0, 4, 'You\'re not taking me without a fight!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 1, 0, 'Have mercy!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 1, 1, 'No! Please! I... I have children! I... I...', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 1, 2, 'P... Please don\'t...', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 1, 3, 'Spare my life! I will leave this place forever! Please!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 2, 0, 'I almost... made it...', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 2, 1, 'May the Light take mercy on your soul, death knight.', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 2, 2, 'Why?', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 2, 3, 'You make my children orphans on this day, fiend!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28576, 2, 4, 'You may take my life, but you won\'t take my freedom!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 0, 0, 'Come then, death knight!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 0, 1, 'Die Scourge dog! DIE!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 0, 2, 'DIE!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 0, 3, 'I won\'t go down that easy!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 0, 4, 'You\'re not taking me without a fight!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 1, 0, 'Have mercy!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 1, 1, 'No! Please! I... I have children! I... I...', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 1, 2, 'P... Please don\'t...', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 1, 3, 'Spare my life! I will leave this place forever! Please!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 2, 0, 'I almost... made it...', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 2, 1, 'May the Light take mercy on your soul, death knight.', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 2, 2, 'Why?', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 2, 3, 'You make my children orphans on this day, fiend!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire'),
(28577, 2, 4, 'You may take my life, but you won\'t take my freedom!', 12, 0, 100, 0, 0, 0, 0, 'Citizen of Havenshire');

-- scarlet captain aggro/movement issues
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28611;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28611, 0, 1, 0, 9, 0, 100, 0, 0, 5, 6000, 9000, 11, 52221, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Captain - Within 0-5 Range - Cast \'Heroic Strike\' (No Repeat)'),
(28611, 0, 3, 0, 23, 0, 100, 0, 48356, 0, 0, 0, 11, 48356, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Captain - On Spawn - Cast See Wintergarde Invisibility'),
(28611, 0, 2, 0, 7, 0, 100, 1, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Captain - On Evade - Set Sheath Melee');