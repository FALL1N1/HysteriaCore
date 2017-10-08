#
# === Content 3.3.x (ICC) ===
# 
SET @EmblemHighPREV := 47241; # Emblem of Triumph
SET @EmblemLowPREV  := 45624; # Emblem of Conquest

SET @EmblemHighCURR := 49426; # Emblem of Frost
SET @EmblemLowCURR  := 47241; # Emblem of Triumph

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
DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` IN (632, 658, 668, 631);

# Disable quests "Proof of demise: ..."
DELETE FROM `creature_queststarter` WHERE `quest IN (13245, 13246, 13247, 13248, 13249, 13250, 13251, 13252, 13253, 13254, 13255, 13256);
DELETE FROM `creature_questender` WHERE `quest IN (13245, 13246, 13247, 13248, 13249, 13250, 13251, 13252, 13253, 13254, 13255, 13256);

# Disable quests "Timear forces: ..."
DELETE FROM `creature_queststarter` WHERE `quest IN (13240, 13241, 13243, 13244);
DELETE FROM `creature_questender` WHERE `quest IN (13240, 13241, 13243, 13244);
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=31439;


# =============================================================================================

