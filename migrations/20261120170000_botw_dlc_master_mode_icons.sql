-- Breath of the Wild: DLC quests blue circles; the DLC and Master Mode treasure chests shapeless, like
-- the other chests (a glyph in their colour, outlined dark), and Master Mode's
-- platforms and enemies circles. Only while still styled as first made
-- (20261120130000_botw_missing_data), so Map Settings changes stay.

UPDATE marker_category SET custom_style = 1, shape = 'circle', color = '#4395f7', glyph_color = '#ffffff' WHERE id = 2288 AND shape = 'diamond' AND color = '#4395f7' AND glyph_color = '#ffffff';
UPDATE marker_category SET custom_style = 1, shape = 'none', color = '#0d2b52', glyph_color = '#4395f7' WHERE id = 2289 AND shape = 'diamond' AND color = '#4395f7' AND glyph_color = '#ffffff';
UPDATE marker_category SET custom_style = 1, shape = 'none', color = '#3a0b16', glyph_color = '#a8324a' WHERE id = 2290 AND shape = 'diamond' AND color = '#a8324a' AND glyph_color = '#ffffff';
UPDATE marker_category SET custom_style = 1, shape = 'circle', color = '#a8324a', glyph_color = '#ffffff' WHERE id = 2291 AND shape = 'diamond' AND color = '#a8324a' AND glyph_color = '#ffffff';
UPDATE marker_category SET custom_style = 1, shape = 'circle', color = '#a8324a', glyph_color = '#ffffff' WHERE id = 2292 AND shape = 'diamond' AND color = '#a8324a' AND glyph_color = '#ffffff';
