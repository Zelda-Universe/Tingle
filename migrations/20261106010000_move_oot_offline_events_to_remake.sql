-- Offline download events for the OoT remake were recorded under the
-- database's hidden 'OoT' row (the N64 game, which can't be downloaded).
-- The remake is container 64 (data/OoT, not a container row). Safe to run
-- twice: once moved, nothing matches.
UPDATE `offline_map_event` SET `container_id` = 64 WHERE `container_id` IN (SELECT `id` FROM `container` WHERE LOWER(`short_name`) IN ('oot', 'ootr'));
