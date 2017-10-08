-- grobbulus - melee distance
UPDATE `creature_model_info` SET `bounding_radius`='1.5', `combat_reach`='1.5' WHERE  `modelid`=16035; 

-- maexxna portals
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`) VALUES 
(65857, 181233, 533, 3, 1, 3465.16, -3940.45, 308.788, 0.441179, -0.305481, 0.637715, 0.305481, 0.637716, 180, 0, 1, 0, 0, 0),
(268045, 181575, 533, 3, 2, 3465.16, -3940.45, 308.788, 0.441179, -0.305481, 0.637715, 0.305481, 0.637716, 180, 0, 1, 0, 0, 0);

-- thaddius tesla coils
delete from disables where sourcetype = 0 and entry = 28099;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES 
('0', '28099', '64', 'Tesla Coil - LOS - Thaddius');

-- thaddius portal location
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `zoneId`, `areaId`) VALUES 
(65856, 181232, 533, 3, 1, 3539.02, -2936.82, 302.476, 3.14159, 0, 0, 1, 0, 180, 0, 1, 0, 0, 0),
(268047, 181576, 533, 3, 1, 3539.02, -2936.82, 302.476, 3.14159, 0, 0, 0.183921, 0.982941, 180, 0, 1, 0, 0, 0);
















