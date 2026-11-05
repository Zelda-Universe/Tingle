-- One row per account per day it's used (lib/common/activity.php), seeded
-- from each account's last sign-in.
CREATE TABLE IF NOT EXISTS `user_activity` (
  `user_id` INT(11) NOT NULL, `day` DATE NOT NULL,
  PRIMARY KEY (`user_id`, `day`),
  KEY `index_user_activity_on_day` (`day`)
) ENGINE=InnoDB;
INSERT IGNORE INTO `user_activity` (`user_id`, `day`)
  SELECT `id`, DATE(`last_login`) FROM `user`
   WHERE `last_login` IS NOT NULL AND `deleted` IS NULL;
