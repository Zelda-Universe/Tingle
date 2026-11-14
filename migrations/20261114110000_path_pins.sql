-- Pins on paths as places of their own (ajax/save_path_pin.php,
-- ajax/toggle_path_pin.php): a pin (a step that's a bare point, not a
-- marker) keeps a key through the path's edits, so it can be opened,
-- written about (content) and completed like a marker. Hidden waypoints get
-- a key too, so one shown again keeps its completions.
ALTER TABLE path_step ADD COLUMN IF NOT EXISTS pin_key VARCHAR(16) NULL AFTER shown;
ALTER TABLE path_step ADD COLUMN IF NOT EXISTS content TEXT NULL AFTER pin_key;
UPDATE path_step SET pin_key = LEFT(MD5(CONCAT(id, '-', path_id, '-', RAND())), 10) WHERE marker_id IS NULL AND pin_key IS NULL;
CREATE TABLE IF NOT EXISTS path_pin_complete (
  user_id INT NOT NULL,
  path_id INT NOT NULL,
  pin_key VARCHAR(16) NOT NULL,
  completed DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, path_id, pin_key),
  KEY path_pin_complete_pin (path_id, pin_key)
);
