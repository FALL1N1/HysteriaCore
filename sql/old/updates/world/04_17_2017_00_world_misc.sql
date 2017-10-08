-- NPC: Den Mother & Thisle cubs are not linked
-- https://github.com/FireFly-WoW/FireFly-IssueTracker/issues/43
DELETE FROM `creature_formations` WHERE `leaderGUID` in(37523, 37566, 37567, 37568, 37569);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(37523, 37566, 0, 0, 2, 0, 0), -- Thistle Cub linked to Den Mother
(37523, 37567, 0, 0, 2, 0, 0), -- Thistle Cub linked to Den Mother
(37523, 37568, 0, 0, 2, 0, 0), -- Thistle Cub linked to Den Mother
(37523, 37569, 0, 0, 2, 0, 0), -- Thistle Cub linked to Den Mother
(37567, 37523, 0, 0, 2, 0, 0); -- Thistle Cub linked to Den Mother