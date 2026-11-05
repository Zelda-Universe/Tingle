-- Staying signed in (lib/common/auth_token.php).
CREATE TABLE IF NOT EXISTS `user_login_token` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT, `user_id` INT(11) NOT NULL,
  `selector` VARCHAR(24) NOT NULL, `token_hash` VARCHAR(64) NOT NULL,
  `user_agent` VARCHAR(255) NULL, `ip` VARCHAR(46) NULL,
  `created` DATETIME NOT NULL, `last_used` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_login_token_on_selector` (`selector`), KEY `index_user_login_token_on_user_id` (`user_id`)
) ENGINE=InnoDB;
