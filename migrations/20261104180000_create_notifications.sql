-- Notifications, follows and push subscriptions (lib/common/notifications.php, push.php).
CREATE TABLE IF NOT EXISTS `notification` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT, `user_id` INT(11) NOT NULL, `type` VARCHAR(32) NOT NULL,
  `actor_id` INT(11) NULL, `page_type` VARCHAR(16) NULL, `page_id` INT(11) NULL, `marker_id` INT(11) NULL,
  `comment_id` BIGINT(20) NULL, `revision_id` BIGINT(20) NULL, `data` TEXT NULL,
  `in_app` TINYINT(1) NOT NULL DEFAULT 1, `created` DATETIME NOT NULL, `read_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  KEY `index_notification_on_user_id_and_id` (`user_id`, `id`),
  KEY `index_notification_on_user_id_and_read_at` (`user_id`, `read_at`)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `notification_setting` (
  `user_id` INT(11) NOT NULL, `type` VARCHAR(32) NOT NULL, `in_app` TINYINT(1) NOT NULL, `email` TINYINT(1) NOT NULL,
  UNIQUE KEY `index_notification_setting_on_user_id_and_type` (`user_id`, `type`)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `talk_follow` (
  `user_id` INT(11) NOT NULL, `page_type` VARCHAR(16) NOT NULL, `page_id` INT(11) NOT NULL, `created` DATETIME NOT NULL,
  UNIQUE KEY `index_talk_follow_on_user_id_and_page_type_and_page_id` (`user_id`, `page_type`, `page_id`),
  KEY `index_talk_follow_on_page_type_and_page_id` (`page_type`, `page_id`)
) ENGINE=InnoDB;
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `notify_follows_paused` TINYINT(1) NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS `notify_auto_follow` TINYINT(1) NOT NULL DEFAULT 1;
CREATE TABLE IF NOT EXISTS `push_subscription` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT, `user_id` INT(11) NOT NULL,
  `endpoint` TEXT NOT NULL, `endpoint_hash` VARCHAR(64) NOT NULL,
  `p256dh` VARCHAR(255) NULL, `auth` VARCHAR(64) NULL, `user_agent` VARCHAR(255) NULL,
  `created` DATETIME NOT NULL, `last_used` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_push_subscription_on_endpoint_hash` (`endpoint_hash`), KEY `index_push_subscription_on_user_id` (`user_id`)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `app_setting` (
  `name` VARCHAR(64) NOT NULL, `value` TEXT NOT NULL,
  UNIQUE KEY `index_app_setting_on_name` (`name`)
) ENGINE=InnoDB;
