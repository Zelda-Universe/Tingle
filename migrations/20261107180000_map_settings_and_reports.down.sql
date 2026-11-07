ALTER TABLE `user` DROP COLUMN IF EXISTS `warnings`;
DROP TABLE IF EXISTS `edit_report`;
ALTER TABLE `marker_category` DROP COLUMN IF EXISTS `menu_order`, DROP COLUMN IF EXISTS `menu_section`,
  DROP COLUMN IF EXISTS `glyph_color`, DROP COLUMN IF EXISTS `shape`, DROP COLUMN IF EXISTS `custom_style`;
DROP TABLE IF EXISTS `map_revision`;
