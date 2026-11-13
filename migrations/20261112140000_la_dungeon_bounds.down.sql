-- Clears the dungeon limits 20261112140000_la_dungeon_bounds set, where unchanged.
UPDATE submap SET bounds = NULL WHERE id = 2001 AND bounds = '[[-208.75,46.5],[-79,209.5]]';
UPDATE submap SET bounds = NULL WHERE id BETWEEN 2002 AND 2009 AND bounds = '[[-192.75,46.5],[-63.25,209.75]]';
