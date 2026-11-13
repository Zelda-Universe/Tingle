-- Drops the path tables, only while they're empty.
ALTER TABLE user_completed_marker DROP INDEX IF EXISTS index_user_completed_marker_on_marker;
DROP TABLE IF EXISTS path_revision;
DROP TABLE IF EXISTS user_completed_path;
DROP TABLE IF EXISTS path_step;
DROP TABLE IF EXISTS path;
