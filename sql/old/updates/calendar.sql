-- Fix Darkmoon Faire Dates
UPDATE `game_event` SET `start_time`='2017-02-05 00:01:00', `length`=10080 WHERE `eventEntry`=3;
UPDATE `game_event` SET `start_time`='2017-03-05 00:01:00', `length`=10080 WHERE `eventEntry`=4;
UPDATE `game_event` SET `length`=10080 WHERE `eventEntry`=5;

-- Noblegarden
UPDATE `game_event` SET `start_time`='2017-04-17 10:00:00' WHERE `eventEntry`=9;

-- Childrens Week
UPDATE `game_event` SET `start_time`='2017-05-01 10:00:00' WHERE  `eventEntry`=10;

-- Midsummer Fire Festival
UPDATE `game_event` SET `start_time`='2017-06-21 10:00:00' WHERE  `eventEntry`=1;

-- Fireworks Spectacular
UPDATE `game_event` SET `start_time`='2017-07-04 10:00:00', `length`='1080' WHERE  `eventEntry`=72;

-- Pirates Day
UPDATE `game_event` SET `start_time`='2017-09-19 10:00:00' WHERE  `eventEntry`=50;

-- Brewfest
UPDATE `game_event` SET `start_time`='2017-09-20 10:00:00', `length`='23040' WHERE  `eventEntry`=24;

-- Harvest Festival
UPDATE `game_event` SET `start_time`='2017-09-29 10:00:00' WHERE  `eventEntry`=11;

-- Hallows End
UPDATE `game_event` SET `start_time`='2017-10-18 10:00:00', `length`='20220' WHERE  `eventEntry`=12;

-- Day of the Dead
UPDATE `game_event` SET `start_time`='2017-11-01 10:00:00', `length`='2880' WHERE  `eventEntry`=51;

-- Pilgrims Bounty
UPDATE `game_event` SET `start_time`='2017-11-20 10:00:00', `length`='20100' WHERE  `eventEntry`=26;

-- Winter Veil
UPDATE `game_event` SET `start_time`='2017-12-16 10:00:00', `length`='24240' WHERE  `eventEntry`=2;

-- Love is in the Air
UPDATE `game_event` SET `start_time`='2018-02-09 10:00:00' WHERE  `eventEntry`=8;

-- Lunar Festival
UPDATE `game_event` SET `start_time`='2018-02-09 10:00:00' WHERE  `eventEntry`=7;

-- Set PvP Weekly Holidays to be way far ahead so that these can be resolved properly in another update
UPDATE `game_event` SET `start_time`='2019-11-25 00:01:00' WHERE  `eventEntry` IN (18, 20, 21, 54, 53, 19);