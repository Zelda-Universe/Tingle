-- Marker revisions, Talk pages and profile pages (lib/common/wiki.php).
CREATE TABLE IF NOT EXISTS `marker_revision` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT, `marker_id` INT(11) NOT NULL, `user_id` INT(11) NOT NULL,
  `action` VARCHAR(16) NOT NULL, `summary` VARCHAR(255) NULL, `reverts_revision_id` BIGINT(20) NULL,
  `data` MEDIUMTEXT NOT NULL, `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_marker_revision_on_marker_id` (`marker_id`), KEY `index_marker_revision_on_user_id` (`user_id`)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `talk_comment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT, `page_type` VARCHAR(16) NOT NULL, `page_id` INT(11) NOT NULL,
  `parent_id` BIGINT(20) NULL, `user_id` INT(11) NOT NULL, `body` TEXT NOT NULL,
  `created` DATETIME NOT NULL, `deleted` DATETIME NULL,
  PRIMARY KEY (`id`), KEY `index_talk_comment_on_page_type_and_page_id` (`page_type`, `page_id`)
) ENGINE=InnoDB;
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `bio` TEXT NULL,
  ADD COLUMN IF NOT EXISTS `profile_banner` VARCHAR(255) NULL;
