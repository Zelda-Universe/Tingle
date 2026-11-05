-- Offline map downloads, for Admin (ajax/offline_map_event.php).
CREATE TABLE IF NOT EXISTS `offline_map_event` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL, `container_id` INT(11) NOT NULL,
  `event` VARCHAR(16) NOT NULL, `bytes` BIGINT(20) NULL, `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_offline_map_event_on_created` (`created`),
  KEY `index_offline_map_event_on_user_id_and_container_id_and_id` (`user_id`, `container_id`, `id`),
  KEY `index_offline_map_event_on_container_id_and_event` (`container_id`, `event`)
) ENGINE=InnoDB;
