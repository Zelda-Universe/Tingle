-- Removes Ocarina of Time Remake's Biggoron's Sword trading sequence path, and
-- its Trading Sequence category while nothing else is in it.
DELETE FROM path_revision WHERE path_id = 4002;
DELETE FROM user_bookmark WHERE path_id = 4002;
DELETE FROM `like` WHERE target_type = 'path' AND target_id = 4002;
DELETE FROM user_completed_path WHERE path_id = 4002;
DELETE FROM path_start WHERE path_id = 4002;
DELETE FROM path_step WHERE path_id = 4002;
DELETE FROM path WHERE id = 4002;
DELETE c FROM marker_category c WHERE c.container_id = 64 AND c.name = 'Trading Sequence' AND NOT EXISTS (SELECT 1 FROM marker m WHERE m.marker_category_id = c.id) AND NOT EXISTS (SELECT 1 FROM path p WHERE p.category_id = c.id) AND NOT EXISTS (SELECT 1 FROM marker_category k WHERE k.parent_id = c.id);
