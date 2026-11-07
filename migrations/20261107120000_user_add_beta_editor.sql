-- The community editing beta: when an account opted in (lib/common/
-- account_status.php). Opted-in accounts work as Contributors, except that
-- they can't delete markers; leaving the beta clears it.
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `beta_editor` DATETIME NULL;
