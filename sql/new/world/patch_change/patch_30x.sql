#
# === Content 3.0.x (Naxx, OS, EoE) ===
#
 
SET @EmblemHighPREV := 49426; # Emblem of Frost
SET @EmblemLowPREV  := 47241; # Emblem of Triumph

SET @EmblemHighCURR := 40753; # Emblem of Valor
SET @EmblemLowCURR  := 40752; # Emblem of Heroism

# Update loot tables
UPDATE `creature_loot_template` SET `item`=@EmblemHighCURR WHERE `item`=@EmblemHighPREV;
UPDATE `creature_loot_template` SET `item`=@EmblemLowCURR WHERE `item`=@EmblemLowPREV;

UPDATE `gameobject_loot_template` SET `item`=@EmblemHighCURR WHERE `item`=@EmblemHighPREV;
UPDATE `gameobject_loot_template` SET `item`=@EmblemLowCURR WHERE `item`=@EmblemLowPREV;

UPDATE `item_loot_template` SET `item`=@EmblemHighCURR WHERE `item`=@EmblemHighPREV;
UPDATE `item_loot_template` SET `item`=@EmblemLowCURR WHERE `item`=@EmblemLowPREV;

UPDATE `reference_loot_template` SET `item`=@EmblemHighCURR WHERE `item`=@EmblemHighPREV;
UPDATE `reference_loot_template` SET `item`=@EmblemLowCURR WHERE `item`=@EmblemLowPREV;

UPDATE `spell_loot_template` SET `item`=@EmblemHighCURR WHERE `item`=@EmblemHighPREV;
UPDATE `spell_loot_template` SET `item`=@EmblemLowCURR WHERE `item`=@EmblemLowPREV;

# Update quest emblems
UPDATE `quest_template` SET `RewardItemId1`=@EmblemHighCURR WHERE `RewardItemId1`=@EmblemHighPREV;
UPDATE `quest_template` SET `RewardItemId2`=@EmblemHighCURR WHERE `RewardItemId2`=@EmblemHighPREV;
UPDATE `quest_template` SET `RewardItemId3`=@EmblemHighCURR WHERE `RewardItemId3`=@EmblemHighPREV;
UPDATE `quest_template` SET `RewardItemId4`=@EmblemHighCURR WHERE `RewardItemId4`=@EmblemHighPREV;

UPDATE `quest_template` SET `RewardItemId1`=@EmblemLowCURR WHERE `RewardItemId1`=@EmblemLowPREV;
UPDATE `quest_template` SET `RewardItemId2`=@EmblemLowCURR WHERE `RewardItemId2`=@EmblemLowPREV;
UPDATE `quest_template` SET `RewardItemId3`=@EmblemLowCURR WHERE `RewardItemId3`=@EmblemLowPREV;
UPDATE `quest_template` SET `RewardItemId4`=@EmblemLowCURR WHERE `RewardItemId4`=@EmblemLowPREV;

# Remove disables for raids and instances for current content
DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` IN (533, 574, 575, 576, 578, 595, 599, 600, 601, 602, 604, 607, 608, 609, 615, 616, 617, 618, 619, 624, 628);
# Add disables for raids and instances for future content
REPLACE INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 650, 3, '', '', 'Disable dungeon "Trial of the Champion" - patch 3.2.x content'),
(2, 632, 3, '', '', 'Disable dungeon "The Forge of Souls" - patch 3.3.x content'),
(2, 658, 3, '', '', 'Disable dungeon "Pit of Saron" - patch 3.3.x content'),
(2, 668, 3, '', '', 'Disable dungeon "Halls of Reflection" - patch 3.3.x content'),
(2, 603, 3, '', '', 'Disable raid non-hc "Ulduar" - patch 3.1.x content'),
(2, 249, 3, '', '', 'Disable raid non-hc "Onyxia''s Lair" - patch 3.2.x content'),
(2, 649, 15, '', '', 'Disable raid with hc "Trial of the Crusader" - patch 3.2.x content'),
(2, 631, 15, '', '', 'Disable raid with hc "Icecrown Citadel" - patch 3.3.x content'),
(2, 724, 15, '', '', 'Disable raid with hc "Ruby Sanctum" - patch 3.3.5 content');

# Proof of demise
DELETE FROM `creature_queststarter` WHERE `quest` > 20000 AND `id` = 20735;
REPLACE INTO `creature_queststarter` (`quest`, `id`) VALUES
(13245, 20735),
(13246, 20735),
(13247, 20735),
(13248, 20735),
(13249, 20735),
(13250, 20735),
(13251, 20735),
(13252, 20735),
(13253, 20735),
(13254, 20735),
(13255, 20735),
(13256, 20735);

REPLACE INTO `creature_questender` (`quest`, `id`) VALUES
(13245, 20735),
(13246, 20735),
(13247, 20735),
(13248, 20735),
(13249, 20735),
(13250, 20735),
(13251, 20735),
(13252, 20735),
(13253, 20735),
(13254, 20735),
(13255, 20735),
(13256, 20735);

REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (60004, 1, 'Proof of demise: ... - Dalaran dungeon daily quests');
REPLACE INTO `pool_quest` VALUES 
(13245, 60004, 'Proof of Demise: Ingvar the Plunderer'),
(13246, 60004, 'Proof of Demise: Keristrasza'),
(13247, 60004, 'Proof of Demise: Ley-Guardian Eregos'),
(13248, 60004, 'Proof of Demise: King Ymiron'),
(13249, 60004, 'Proof of Demise: The Prophet Tharon''ja'),
(13250, 60004, 'Proof of Demise: Gal''darah'),
(13251, 60004, 'Proof of Demise: Mal''Ganis'),
(13252, 60004, 'Proof of Demise: Sjonnir The Ironshaper'),
(13253, 60004, 'Proof of Demise: Loken'),
(13254, 60004, 'Proof of Demise: Anub''arak'),
(13255, 60004, 'Proof of Demise: Herald Volazj'),
(13256, 60004, 'Proof of Demise: Cyanigosa');

# Timear forces
REPLACE INTO `creature_queststarter` (`quest`, `id`) VALUES
(13240, 31439),
(13241, 31439),
(13243, 31439),
(13244, 31439);

REPLACE INTO `creature_questender` (`quest`, `id`) VALUES
(13240, 31439),
(13241, 31439),
(13243, 31439),
(13244, 31439);

REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (60005, 1, 'Timear forces: ... - Dalaran dungeon daily quests');
REPLACE INTO `pool_quest` VALUES 
(13240, 60005, 'Timear Foresees Centrifuge Constructs in your Future!'),
(13241, 60005, 'Timear Foresees Ymirjar Berserkers in your Future!'),
(13243, 60005, 'Timear Foresees Infinite Agents in your Future!'),
(13244, 60005, 'Timear Foresees Titanium Vanguards in your Future!');

UPDATE `creature_template` SET `ScriptName`='npc_archmage_timear' WHERE `entry`=31439;

# AT phasing for objects

DELETE FROM `spell_area` WHERE `spell` = 61831; -- 3.1 phase
REPLACE INTO `spell_area` (`spell`, `area`, `autocast`) VALUES 
(61831, 4670, 1),
(61831, 4671, 1),
(61831, 4673, 1),
(61831, 4669, 1),
(61831, 4672, 1),
(61831, 4658, 1),
(61831, 4666, 1),
(61831, 4667, 1),
(61831, 4674, 1),
(61831, 4676, 1),
(61831, 4677, 1);

# =============================================================================================

