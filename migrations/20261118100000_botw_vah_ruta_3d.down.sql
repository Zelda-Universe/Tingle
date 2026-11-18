-- Removes what 20261118100000_botw_vah_ruta_3d added.
DELETE FROM marker WHERE id BETWEEN 19510001 AND 19511000;
DELETE FROM submap WHERE id = 195101;
DELETE FROM map WHERE id = 1951 AND container_id = 19;
