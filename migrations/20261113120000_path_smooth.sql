-- Paths can be drawn as smooth curves through their steps rather than
-- straight lines between them (scripts/services/Paths.js _smoothLine): a
-- setting on each path, off for paths that follow exact routes. Path Lab's
-- dragon flies a curve.
ALTER TABLE path ADD COLUMN IF NOT EXISTS smooth TINYINT(1) NOT NULL DEFAULT 0 AFTER numbered;
UPDATE path SET smooth = 1 WHERE id = 9003 AND container_id = 90;
