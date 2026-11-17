-- Settings for the whole site, changed by admins in the admin panel's
-- Settings (ajax/admin_site_settings.php, lib/common/site_settings.php):
-- one row per setting that's been changed from its default.
CREATE TABLE IF NOT EXISTS `site_setting` (
  `name` VARCHAR(64) NOT NULL PRIMARY KEY,
  `value` VARCHAR(255) NOT NULL,
  `updated` DATETIME NOT NULL,
  `updated_by` INT NULL
);
