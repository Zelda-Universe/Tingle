DROP TABLE IF EXISTS path_pin_complete;
ALTER TABLE path_step DROP COLUMN IF EXISTS content;
ALTER TABLE path_step DROP COLUMN IF EXISTS pin_key;
