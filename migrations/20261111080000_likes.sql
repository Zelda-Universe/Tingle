CREATE TABLE IF NOT EXISTS `like` (
  `target_type` VARCHAR(16) NOT NULL,
  `target_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`target_type`, `target_id`, `user_id`),
  KEY `user_likes` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
