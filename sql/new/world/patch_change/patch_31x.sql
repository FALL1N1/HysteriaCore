#
# === Content 3.1.x (Ulduar, Basic AT) ===
#

SET @EmblemHighPREV := 40753; # Emblem of Valor
SET @EmblemLowPREV  := 40752; # Emblem of Heroism

SET @EmblemHighCURR := 45624; # Emblem of Conquest
SET @EmblemLowCURR  := 40753; # Emblem of Valor

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
DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` IN (603);

DELETE FROM `spell_area` WHERE `spell` = 61831; -- 3.1 phase

# =============================================================================================

