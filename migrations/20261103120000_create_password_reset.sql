-- Link-based password reset (ajax/lost_password.php, ajax/reset_password.php).
CREATE TABLE IF NOT EXISTS `password_reset` (
  `id` INT(11) NOT NULL AUTO_INCREMENT, `user_id` INT(11) NOT NULL,
  `token_hash` CHAR(64) NOT NULL, `expires` DATETIME NOT NULL, `used` DATETIME NULL,
  `created` DATETIME NOT NULL, `ip` VARCHAR(46) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_password_reset_on_token_hash` (`token_hash`),
  KEY `index_password_reset_on_user_id` (`user_id`)
) ENGINE=InnoDB;
