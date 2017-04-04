#
# === Content 3.2.2 (Argent Tournament) ===
#

# Remove disables for raids and instances for current content
DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` IN (249);

# =============================================================================================

