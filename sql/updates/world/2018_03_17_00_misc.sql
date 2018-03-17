UPDATE `creature_equip_template` SET `ItemID1` = 13262 WHERE `CreatureID` = 29175 AND `ID` = 1;

-- fix Wintergrasp aura limiting to its zone/area
INSERT INTO`spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
('55774', '4197', '0', '0', '0', '0', '2', '0', '0', '0');

INSERT INTO`spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
('55773', '4197', '0', '0', '0', '0', '2', '0', '0', '0');

UPDATE `creature_template` SET `mindmg`='100', `maxdmg`='175' WHERE  `entry`=25788; 

insert into `spell_script_names` (`spell_id`, `ScriptName`) values('-26889','spell_rog_vanish');

INSERT INTO version_db_world (`sql_rev`) VALUES ('1509271997120618300');

-- Quest: A Suitable Test Subject (11719)
DELETE FROM `spell_script_names` WHERE `ScriptName`="spell_q11719_bloodspore_ruination_45997";
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45997, "spell_q11719_bloodspore_ruination_45997");

UPDATE `creature_template` SET `ScriptName`="npc_bloodmage_laurith" WHERE `entry`=25381;

DELETE FROM `creature_text` WHERE `entry`=25381;
INSERT INTO `creature_text` (`entry`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(25381, 0, 0, "How positively awful! You were totally incapacitated? Weak? Hot flashes?", 15, 0, 100, 21, 0, 0, 24992, 0, "Bloodmage Laurith");

DELETE FROM `areatrigger_scripts` WHERE `entry` = 5709;
INSERT INTO `areatrigger_scripts` VALUES (5709, 'at_lady_deathwhisper_entrance');