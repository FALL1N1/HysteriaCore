-- blade warding
delete from `spell_script_names` where `ScriptName`='spell_gen_blade_warding';
insert into `spell_script_names` (`spell_id`, `ScriptName`) values (64440, 'spell_gen_blade_warding');
update `spell_proc` set `Cooldown`=0 where `SpellId`=64440;

-- more duplicated ore spawns
delete from `gameobject` where id = 2040 and guid in(7304, 7321);
delete from `gameobject` where id = 1732 and guid in(5503, 5535, 5666);
delete from `gameobject` where id = 1734 and guid = 5907;
delete from `gameobject` where id = 73941 and guid = 14685;

-- landro's pet/gift box
DELETE FROM `item_loot_template` WHERE `Entry` IN (50301,54218);
INSERT INTO `item_loot_template` (`Entry`,`Item`,`ChanceOrQuestChance`,`LootMode`,`GroupId`,`mincountOrRef`,`maxcount`) VALUES
(50301,46779,36.36,1,1,50,50),
(50301,35223,36.36,1,1,50,50),
(50301,45047,27.28,1,1,50,50),
(50301,32588,0.45,1,2,1,1),
(50301,38050,0.45,1,2,1,1),
(50301,34493,0.10,1,2,1,1),
(54218,46779,36.36,1,1,50,50),
(54218,35223,36.36,1,1,50,50),
(54218,45047,27.28,1,1,50,50),
(54218,23720,0.50,1,2,1,1),
(54218,49284,0.30,1,2,1,1),
(54218,49283,0.30,1,2,1,1),
(54218,49286,0.30,1,2,1,1),
(54218,49285,0.10,1,2,1,1),
(54218,49282,0.20,1,2,1,1);


-- disable command port from trinitycore
DELETE FROM `command` WHERE `name` IN ('disable add quest', 'disable add map', 'disable add battleground', 'disable add spell', 'disable add outdoorpvp', 'disable add vmap', 'disable remove quest', 'disable remove map', 'disable remove battleground', 'disable remove spell', 'disable remove outdoorpvp', 'disable remove vmap');
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('disable add quest', 3, 'Syntax: .disable add quest $entry $flag $comment'),
('disable add map', 3, 'Syntax: .disable add map $entry $flag $comment'),
('disable add battleground', 3, 'Syntax: .disable add battleground $entry $flag $comment'),
('disable add spell', 3, 'Syntax: .disable add spell $entry $flag $comment'),
('disable add outdoorpvp', 3, 'Syntax: .disable add outdoorpvp $entry $flag $comment'),
('disable add vmap', 3, 'Syntax: .disable add vmap $entry $flag $comment'),
('disable remove quest', 3, 'Syntax: .disable remove quest $entry'),
('disable remove map', 3, 'Syntax: .disable remove map $entry'),
('disable remove battleground', 3, 'Syntax: .disable remove battleground $entry'),
('disable remove spell', 3, 'Syntax: .disable remove spell $entry'),
('disable remove outdoorpvp', 3, 'Syntax: .disable remove outdoorpvp $entry'),
('disable remove vmap', 3, 'Syntax: .disable remove vmap $entry');

-- spell 6870/31399 moss covered feet
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_moss_covered_feet';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(6870, 'spell_gen_moss_covered_feet'),
(31399, 'spell_gen_moss_covered_feet');

-- Move Lagoon Eel below water surface
DELETE FROM `creature` WHERE `GUID` IN(72106);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(72106, 20290, 530, 1, 1, 0, 0, -284.632, 6580.16, 15.1109, 4.78078, 300, 5, 0, 5158, 0, 1, 0, 0, 0);

-- Rotting Agam'ar
UPDATE `creature` SET `map` = 47 WHERE `guid` = 84369 AND `id` = 4512;

-- karazhan releated
DELETE FROM `disables` WHERE `entry` = "532";
DELETE FROM `creature` WHERE `guid` = "135921";
DELETE FROM `creature` WHERE `ID` = "17644";
UPDATE `creature_template` SET `ScriptName` = "prince_axes" WHERE `entry` = "17650";
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (30843, 41624, 0, 'Prince Enfeelble');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
 (135921, 17645, 532, 1, 1, 11686, 0, -10935.6, -2043.06, 324.012, 2.17745, 604800, 0, 0, 42, 0, 0, 0, 0, 0);

-- bloodlord mandokir
UPDATE `creature_text` SET `text` = "$N! I'm watching you!" WHERE `entry` = "11382" AND `groupid` = "2";

-- image of drakuru
insert into `creature_queststarter` values (26500, 12238);

-- Dream Vision make it trigger
UPDATE `creature_template` SET `flags_extra`='128'WHERE (`entry`='7863');

-- Eye of Kilrogg (Summon) apply stealth aura
UPDATE `creature_template_addon` SET `auras`='2585' WHERE (`entry`='4277');