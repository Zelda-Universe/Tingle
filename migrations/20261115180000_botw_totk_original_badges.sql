-- BotW and TotK keep their games' own brown-on-brown location badges now
-- that the built-in default (styles/poi.css) has a darker glyph: their
-- location, round location and cave badges restyled in Map Settings with
-- BotW's colours, shapes and icons as they were. Each
-- change is in the map's history as Jess's. Only categories not already
-- restyled are touched.

-- Locations (square): BotW's Locations, Village, Great Fairy, Stables;
-- TotK's Village, Shops, Great Fairy, Stables, Forge Construct, Bargainer Statue.
INSERT INTO map_revision (container_id, user_id, kind, target_id, summary, data, created)
SELECT container_id, 15, 'category', id, NULL, JSON_OBJECT('name', name, 'before', JSON_OBJECT('color', color, 'glyphColor', glyph_color, 'shape', shape, 'customStyle', 0), 'after', JSON_OBJECT('color', '#8f773a', 'glyphColor', '#684521', 'shape', 'square', 'customStyle', 1)), NOW()
FROM marker_category WHERE container_id IN (19, 21) AND id IN (1920, 1921, 1937, 1938, 2121, 2124, 2137, 2138, 2174, 2175) AND custom_style = 0;

UPDATE marker_category SET custom_style = 1, shape = 'square', color = '#8f773a', glyph_color = '#684521'
WHERE container_id IN (19, 21) AND id IN (1920, 1921, 1937, 1938, 2121, 2124, 2137, 2138, 2174, 2175) AND custom_style = 0;

-- Round locations (circle): TotK's Wells and Chasm.
INSERT INTO map_revision (container_id, user_id, kind, target_id, summary, data, created)
SELECT container_id, 15, 'category', id, NULL, JSON_OBJECT('name', name, 'before', JSON_OBJECT('color', color, 'glyphColor', glyph_color, 'shape', shape, 'customStyle', 0), 'after', JSON_OBJECT('color', '#8f773a', 'glyphColor', '#684521', 'shape', 'circle', 'customStyle', 1)), NOW()
FROM marker_category WHERE container_id = 21 AND id IN (2150, 2152) AND custom_style = 0;

UPDATE marker_category SET custom_style = 1, shape = 'circle', color = '#8f773a', glyph_color = '#684521'
WHERE container_id = 21 AND id IN (2150, 2152) AND custom_style = 0;

-- Caves (arch): TotK's Caves.
INSERT INTO map_revision (container_id, user_id, kind, target_id, summary, data, created)
SELECT container_id, 15, 'category', id, NULL, JSON_OBJECT('name', name, 'before', JSON_OBJECT('color', color, 'glyphColor', glyph_color, 'shape', shape, 'customStyle', 0), 'after', JSON_OBJECT('color', '#8f773a', 'glyphColor', '#684521', 'shape', 'arch', 'customStyle', 1)), NOW()
FROM marker_category WHERE container_id = 21 AND id = 2151 AND custom_style = 0;

UPDATE marker_category SET custom_style = 1, shape = 'arch', color = '#8f773a', glyph_color = '#684521'
WHERE container_id = 21 AND id = 2151 AND custom_style = 0;
