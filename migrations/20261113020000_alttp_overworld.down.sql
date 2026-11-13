-- Removes what 20261113020000_alttp_overworld added, where unchanged.
DELETE FROM marker_tab WHERE marker_id BETWEEN 3000001 AND 3000106;
DELETE FROM marker WHERE id BETWEEN 3000001 AND 3000106;
DELETE FROM marker_category WHERE container_id = 3 AND parent_id IS NOT NULL AND id BETWEEN 3000 AND 3089 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id BETWEEN 3000 AND 3089);
DELETE FROM marker_category WHERE container_id = 3 AND parent_id IS NULL AND id BETWEEN 3000 AND 3089 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id BETWEEN 3000 AND 3089);
