-- Block 1 of the 11/03 schema work: Jess's profile pictures and account
-- deletion (dev/db/migrate/20261102123000_user_add_profile_picture.rb,
-- 20261102140000_create_user_bookmark.rb, deletion in delete_account.php).
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `deleted` DATETIME NULL AFTER `created`,
  ADD COLUMN IF NOT EXISTS `profile_picture` VARCHAR(255) NULL AFTER `email`;
CREATE TABLE IF NOT EXISTS `user_bookmark` (
  `id` INT(11) NOT NULL AUTO_INCREMENT, `user_id` INT(11) NOT NULL,
  `marker_id` INT(11) DEFAULT NULL, `map_id` INT(11) DEFAULT NULL, `submap_id` INT(11) DEFAULT NULL,
  `x` DECIMAL(12,4) DEFAULT NULL, `y` DECIMAL(12,4) DEFAULT NULL, `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_bookmark_on_user_id_and_marker_id` (`user_id`,`marker_id`),
  KEY `index_user_bookmark_on_user_id` (`user_id`)
) ENGINE=InnoDB;
