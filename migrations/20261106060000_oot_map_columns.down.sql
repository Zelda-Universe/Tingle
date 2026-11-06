-- Removes the OoT map columns. Anything stored in them is lost.
ALTER TABLE map DROP COLUMN IF EXISTS kind;
ALTER TABLE submap DROP COLUMN IF EXISTS tile_version;
ALTER TABLE submap DROP COLUMN IF EXISTS bounds;
ALTER TABLE submap DROP COLUMN IF EXISTS connections;
-- tile_ext stays VARCHAR(8): narrowing it again would cut OoT's webp to web.
