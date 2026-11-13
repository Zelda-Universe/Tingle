-- Removes what 20261112120000_la_overworld_markers added, where unchanged.

DELETE FROM marker_tab WHERE marker_id BETWEEN 4000001 AND 4000035;
DELETE FROM marker WHERE id BETWEEN 4000001 AND 4000035;
DELETE FROM marker_category WHERE id BETWEEN 1970 AND 1974 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id BETWEEN 1970 AND 1974);
