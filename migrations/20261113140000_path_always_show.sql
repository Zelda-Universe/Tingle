-- A path can be always on the map (as before), or only shown once one of its
-- markers or its own page is opened: until then its markers are just markers
-- (scripts/services/Paths.js _pathShown). Path Lab's Shrine Route shows it.
-- And Path Lab's markers take the full-size style other maps use (as Link's
-- Awakening's), so paths are judged against real markers.
ALTER TABLE path ADD COLUMN IF NOT EXISTS always_show TINYINT(1) NOT NULL DEFAULT 1 AFTER smooth;
UPDATE path SET always_show = 0 WHERE id = 9004 AND container_id = 90;
UPDATE container SET switch_icons_at_zoom = -1 WHERE id = 90;
