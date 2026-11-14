-- Paths can be bookmarked (ajax/add_bookmark.php with pathId), as markers
-- and dropped pins are: one bookmark per path per person.
ALTER TABLE user_bookmark ADD COLUMN IF NOT EXISTS path_id INT NULL AFTER marker_id;
ALTER TABLE user_bookmark ADD UNIQUE INDEX IF NOT EXISTS index_user_bookmark_on_user_id_and_path_id (user_id, path_id);
