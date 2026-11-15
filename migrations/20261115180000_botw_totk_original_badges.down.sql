-- Back on the built-in styles, as before: each category's earlier colour,
-- shape and glyph colour from the history entry the migration added, then
-- that entry gone. (Only while still as the migration left it.)

UPDATE marker_category c JOIN map_revision r ON r.kind = 'category' AND r.target_id = c.id AND r.user_id = 15
  AND JSON_UNQUOTE(JSON_EXTRACT(r.data, '$.after.color')) = c.color AND JSON_UNQUOTE(JSON_EXTRACT(r.data, '$.after.glyphColor')) = c.glyph_color
  AND JSON_UNQUOTE(JSON_EXTRACT(r.data, '$.after.shape')) = c.shape AND JSON_EXTRACT(r.data, '$.before.customStyle') = 0
SET c.custom_style = 0, c.color = JSON_UNQUOTE(JSON_EXTRACT(r.data, '$.before.color')), c.glyph_color = NULL, c.shape = NULL
WHERE c.container_id IN (19, 21) AND c.id IN (1920, 1921, 1937, 1938, 2121, 2124, 2137, 2138, 2150, 2151, 2152, 2174, 2175) AND c.custom_style = 1;

DELETE FROM map_revision WHERE container_id IN (19, 21) AND kind = 'category' AND user_id = 15
  AND target_id IN (1920, 1921, 1937, 1938, 2121, 2124, 2137, 2138, 2150, 2151, 2152, 2174, 2175)
  AND JSON_EXTRACT(data, '$.before.customStyle') = 0 AND JSON_EXTRACT(data, '$.after.customStyle') = 1
  AND JSON_UNQUOTE(JSON_EXTRACT(data, '$.after.color')) = '#8f773a';
