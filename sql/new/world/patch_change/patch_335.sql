#
# === Content 3.3.5 (Ruby Sanctum) ===
# 

# Remove disables for raids and instances for current content
DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` IN (724);