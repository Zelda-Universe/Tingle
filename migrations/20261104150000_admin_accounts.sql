-- Admin account controls: last seen, disable, ban (lib/common/account_status.php).
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `last_seen` DATETIME NULL,
  ADD COLUMN IF NOT EXISTS `disabled` DATETIME NULL,
  ADD COLUMN IF NOT EXISTS `banned` DATETIME NULL,
  ADD COLUMN IF NOT EXISTS `ban_reason` VARCHAR(500) NULL;
UPDATE `user` SET `last_seen` = `last_login` WHERE `deleted` IS NULL AND `last_seen` IS NULL;
CREATE TABLE IF NOT EXISTS `banned_email` (
  `email` VARCHAR(255) NOT NULL, `user_id` INT(11) NOT NULL, `created` DATETIME NOT NULL,
  PRIMARY KEY (`email`), KEY `index_banned_email_on_user_id` (`user_id`)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `admin_log` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT, `admin_id` INT(11) NOT NULL, `user_id` INT(11) NOT NULL,
  `action` VARCHAR(32) NOT NULL, `details` TEXT NULL, `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`), KEY `index_admin_log_on_user_id` (`user_id`)
) ENGINE=InnoDB;
