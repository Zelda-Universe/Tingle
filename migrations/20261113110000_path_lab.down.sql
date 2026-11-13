-- Removes the Path Lab test game.
DELETE FROM path_revision WHERE path_id IN (SELECT id FROM path WHERE container_id = 90);
DELETE FROM user_completed_path WHERE path_id IN (SELECT id FROM path WHERE container_id = 90);
DELETE FROM path_step WHERE path_id IN (SELECT id FROM path WHERE container_id = 90);
DELETE FROM path WHERE container_id = 90;
DELETE FROM user_completed_marker WHERE marker_id BETWEEN 9000001 AND 9009999;
DELETE FROM marker_tab WHERE marker_id BETWEEN 9000001 AND 9009999;
DELETE FROM marker WHERE id BETWEEN 9000001 AND 9009999;
DELETE FROM marker_category WHERE container_id = 90 AND parent_id IS NOT NULL;
DELETE FROM marker_category WHERE container_id = 90;
DELETE FROM submap WHERE id = 90001;
DELETE FROM map WHERE id = 9000;
DELETE FROM container WHERE id = 90;
