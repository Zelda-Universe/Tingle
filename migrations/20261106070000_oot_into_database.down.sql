-- Removes the OoT rows the migration added (children first, for the foreign
-- keys). Completions and bookmarks keep their IDs and are untouched.
DELETE FROM map_region WHERE kind = 'area' AND submap_id IN (SELECT s.id FROM submap s JOIN map m ON m.id = s.map_id WHERE m.container_id = 64);
DELETE FROM marker_tab WHERE marker_id BETWEEN 64100000 AND 64499999;
DELETE FROM marker WHERE id BETWEEN 64100000 AND 64499999;
DELETE FROM submap WHERE map_id IN (SELECT id FROM map WHERE container_id = 64);
DELETE FROM map WHERE container_id = 64;
DELETE FROM marker_category WHERE container_id = 64 AND parent_id IS NOT NULL;
DELETE FROM marker_category WHERE container_id = 64;
DELETE FROM container WHERE id = 64;
