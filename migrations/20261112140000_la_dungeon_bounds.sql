-- Link's Awakening (Nintendo Switch): each dungeon's own pan limits, the
-- edges of its artwork (the rest of the tile square is empty), so the map
-- fits the screen when opened, as OoT's dungeons do. Only sets limits that
-- are still empty.
UPDATE submap SET bounds = '[[-208.75,46.5],[-79,209.5]]' WHERE id = 2001 AND bounds IS NULL;
UPDATE submap SET bounds = '[[-192.75,46.5],[-63.25,209.75]]' WHERE id BETWEEN 2002 AND 2009 AND bounds IS NULL;
