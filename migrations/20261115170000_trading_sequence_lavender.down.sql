-- Back to orange, the history entries the migration added gone with it.

SET @trading = (SELECT id FROM marker_category WHERE container_id = 64 AND name = 'Trading Sequence' ORDER BY id LIMIT 1);

DELETE FROM map_revision WHERE container_id = 64 AND kind = 'category' AND target_id = @trading AND data = '{"name":"Trading Sequence","before":{"color":"#ffad47"},"after":{"color":"#8a68d0"}}';

UPDATE marker_category SET color = '#ffad47' WHERE id = @trading AND color = '#8a68d0';

DELETE FROM path_revision WHERE path_id = 4002 AND action = 'edit' AND summary = 'The look' AND JSON_UNQUOTE(JSON_EXTRACT(snapshot, '$.color')) = '#8a68d0';

UPDATE path SET color = '#ffad47' WHERE id = 4002 AND color = '#8a68d0';
