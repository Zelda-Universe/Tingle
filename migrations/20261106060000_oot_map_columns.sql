-- Room in the map tables for what Ocarina of Time's maps need, so OoT can
-- move from its read-only pack (data/OoT) into the database like every other
-- game. Nothing reads these columns yet: other games leave them empty, and
-- the site works the same whether or not this has run.

-- 'world' or 'dungeon'. A map with a kind shows each of its submaps (ages,
-- floors, water levels) as its own choice in the floor and age switch.
ALTER TABLE map ADD COLUMN IF NOT EXISTS kind VARCHAR(16) NULL;

-- A fingerprint of the submap's artwork (the start of its SHA-256). Tile
-- addresses end in ?v=<it>, so new artwork is never served from an old
-- cached copy, in browsers, Cloudflare or offline downloads.
ALTER TABLE submap ADD COLUMN IF NOT EXISTS tile_version VARCHAR(32) NULL;

-- How far the map can be panned, as [[south, west], [north, east]] in map
-- units (JSON). Hyrule is a wide rectangle, not the usual square.
ALTER TABLE submap ADD COLUMN IF NOT EXISTS bounds TEXT NULL;

-- The lines joining Hyrule's area exits (JSON): each end is [area, u, v]
-- inside an area's artwork, so the lines follow the areas wherever the
-- layout puts them.
ALTER TABLE submap ADD COLUMN IF NOT EXISTS connections MEDIUMTEXT NULL;

-- File extensions were three letters (png); OoT's tiles are webp. As CHAR(3)
-- "webp" was cut to "web" (silently, under INSERT IGNORE). Widening is safe:
-- every existing value still fits.
ALTER TABLE submap MODIFY COLUMN tile_ext VARCHAR(8) NOT NULL DEFAULT 'png';
