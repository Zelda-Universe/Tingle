-- Removes what 20261113080000_alttp_caves added.
DELETE FROM map_region WHERE submap_id = 31401;
DELETE FROM marker WHERE id BETWEEN 3006001 AND 3006074;
DELETE FROM submap WHERE id = 31401;
DELETE FROM map WHERE id = 314;
