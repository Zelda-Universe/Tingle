-- Removes what 20261112150000_la_regions added, where unchanged.
DELETE FROM map_region WHERE submap_id = 2000 AND kind = 'area' AND label_marker_id BETWEEN 4100001 AND 4100021;
DELETE FROM marker_tab WHERE marker_id BETWEEN 4100001 AND 4100021;
DELETE FROM marker WHERE id BETWEEN 4100001 AND 4100021;
DELETE FROM marker_category WHERE id = 1982 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id = 1982);
DELETE FROM marker_category WHERE id = 1981 AND NOT EXISTS (SELECT 1 FROM marker_category WHERE parent_id = 1981);
