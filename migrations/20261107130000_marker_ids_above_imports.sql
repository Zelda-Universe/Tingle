-- New markers (added on the site, now by beta testers too) took the next ID
-- after the highest, which is inside the ranges reserved for imported game
-- data (Ocarina of Time's 641xxxxx-647xxxxx). The import scripts skip IDs
-- that are taken, so a community marker there would block a game marker.
-- Number new markers from 70,000,000 on instead. Harmless to run again:
-- MySQL never moves AUTO_INCREMENT below the highest ID in use.
ALTER TABLE `marker` AUTO_INCREMENT = 70000000;
