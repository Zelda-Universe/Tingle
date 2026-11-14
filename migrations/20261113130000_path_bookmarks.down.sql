DELETE FROM user_bookmark WHERE path_id IS NOT NULL;
ALTER TABLE user_bookmark DROP INDEX IF EXISTS index_user_bookmark_on_user_id_and_path_id;
ALTER TABLE user_bookmark DROP COLUMN IF EXISTS path_id;
