-- Puts back the ALttP stub 20261113010000_alttp_maps replaced, where unchanged.
DELETE FROM submap WHERE map_id BETWEEN 301 AND 313;
DELETE FROM map WHERE id BETWEEN 301 AND 313 AND container_id = 3;
UPDATE submap SET name = 'Light World', tile_url = 'alttp/overworld/light/', tile_ext = 'png', tile_version = NULL, bounds = NULL, mapper_id = NULL WHERE id = 140;
UPDATE submap SET name = 'Dark World', tile_url = 'alttp/overworld/dark/', tile_ext = 'png', tile_version = NULL, bounds = NULL, mapper_id = NULL WHERE id = 141;
UPDATE map SET name = 'Overworld', kind = NULL, default_zoom = 2, max_zoom = 6, map_copyright = '(c) Nintendo' WHERE id = 3;
UPDATE container SET default_zoom = 3, icon = '' WHERE id = 3;
