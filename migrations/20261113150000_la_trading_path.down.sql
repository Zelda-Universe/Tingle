-- Removes Link's Awakening's Trading Sequence path.
DELETE FROM path_revision WHERE path_id = 4001;
DELETE FROM user_bookmark WHERE path_id = 4001;
DELETE FROM `like` WHERE target_type = 'path' AND target_id = 4001;
DELETE FROM user_completed_path WHERE path_id = 4001;
DELETE FROM path_step WHERE path_id = 4001;
DELETE FROM path WHERE id = 4001;
