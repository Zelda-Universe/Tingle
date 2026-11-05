-- Where accounts sign up from, and anonymous prompt counts (lib/common/signups.php).
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `signup_source` VARCHAR(32) NULL,
  ADD COLUMN IF NOT EXISTS `signup_variant` VARCHAR(16) NULL;
CREATE TABLE IF NOT EXISTS `feature_event` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `event` VARCHAR(32) NOT NULL, `feature` VARCHAR(32) NOT NULL, `variant` VARCHAR(16) NULL,
  `ip_hash` VARCHAR(64) NULL, `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_feature_event_on_created` (`created`),
  KEY `index_feature_event_on_ip_hash_and_created` (`ip_hash`, `created`)
) ENGINE=InnoDB;
