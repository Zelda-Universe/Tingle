-- The Biggoron's Sword Trading Sequence path and its Trading Sequence
-- markers, from orange to lavender, matching. Each change is in its
-- history (the path's revisions, the map's category changes) as Jess's.
-- Only while still the old orange: a colour picked since is kept.

SET @trading = (SELECT id FROM marker_category WHERE container_id = 64 AND name = 'Trading Sequence' ORDER BY id LIMIT 1);

INSERT INTO map_revision (container_id, user_id, kind, target_id, summary, data, created)
SELECT 64, 15, 'category', @trading, NULL, '{"name":"Trading Sequence","before":{"color":"#ffad47"},"after":{"color":"#8a68d0"}}', NOW()
FROM marker_category WHERE id = @trading AND color = '#ffad47';

UPDATE marker_category SET color = '#8a68d0' WHERE id = @trading AND color = '#ffad47';

INSERT INTO path_revision (path_id, user_id, action, summary, snapshot)
SELECT 4002, 15, 'edit', 'The look', JSON_SET(r.snapshot, '$.color', '#8a68d0')
FROM path_revision r
WHERE r.path_id = 4002 AND (SELECT color FROM path WHERE id = 4002) = '#ffad47'
ORDER BY r.id DESC LIMIT 1;

UPDATE path SET color = '#8a68d0' WHERE id = 4002 AND color = '#ffad47';
