-- Removes what 20261113070000_alttp_regions added, where unchanged.
DELETE FROM map_region WHERE submap_id IN (140, 141) AND kind = 'area' AND label_marker_id BETWEEN 3005001 AND 3005027;
DELETE FROM marker WHERE id BETWEEN 3005001 AND 3005027;
DELETE FROM marker_category WHERE id = 3091 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id = 3091);
DELETE FROM marker_category WHERE id = 3090 AND NOT EXISTS (SELECT 1 FROM marker_category WHERE parent_id = 3090);
