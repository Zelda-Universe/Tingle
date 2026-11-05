DROP TABLE IF EXISTS `feature_event`;
ALTER TABLE `user`
  DROP COLUMN IF EXISTS `signup_variant`,
  DROP COLUMN IF EXISTS `signup_source`;
