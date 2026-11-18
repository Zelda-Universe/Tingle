-- Removes what 20261117110000_tmc_categories added, unless markers use it.
DELETE FROM marker_category WHERE container_id = 12 AND parent_id IS NOT NULL AND id BETWEEN 12000 AND 12089 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id BETWEEN 12000 AND 12089);
DELETE FROM marker_category WHERE container_id = 12 AND parent_id IS NULL AND id BETWEEN 12000 AND 12089 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker_category_id BETWEEN 12000 AND 12089) AND NOT EXISTS (SELECT 1 FROM (SELECT parent_id FROM marker_category WHERE parent_id BETWEEN 12000 AND 12089) c);
