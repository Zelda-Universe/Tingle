-- Map settings saved to the account as JSON (lib/common/user_settings.php).
ALTER TABLE `user` ADD COLUMN IF NOT EXISTS `settings` TEXT NULL;
