-- Removes what 20261117100000_tmc_maps added.
DELETE FROM submap WHERE map_id BETWEEN 1200 AND 1299;
DELETE FROM map WHERE id BETWEEN 1200 AND 1299 AND container_id = 12;
UPDATE container SET default_zoom = 3, max_zoom = 6, icon = '' WHERE id = 12;
