-- Map Settings (ajax/map_settings*.php): each change to a game's maps,
-- sections and categories, with the values before and after, for the map's
-- history. A category styled there (custom_style) keeps the colour and icon
-- it was given instead of its game's built-in style (scripts/util/poiStyle.js):
-- its shape (circle, diamond, square, or none), badge colour (color; for no
-- shape, the glyph's outline) and glyph colour. menu_section and menu_order
-- lay out the category list: once a game's are set, they replace its built-in
-- sections and order.
CREATE TABLE IF NOT EXISTS `map_revision` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `container_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `kind` VARCHAR(16) NOT NULL,
  `target_id` INT(11) NOT NULL,
  `summary` VARCHAR(255) NULL,
  `data` MEDIUMTEXT NOT NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_map_revision_on_container_id` (`container_id`)
) ENGINE=InnoDB;
ALTER TABLE `marker_category`
  ADD COLUMN IF NOT EXISTS `custom_style` TINYINT(1) NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS `shape` VARCHAR(16) NULL,
  ADD COLUMN IF NOT EXISTS `glyph_color` VARCHAR(7) NULL,
  ADD COLUMN IF NOT EXISTS `menu_section` VARCHAR(45) NULL,
  ADD COLUMN IF NOT EXISTS `menu_order` INT(11) NULL;

-- Reports of problem edits (ajax/report_edit.php, admin_reports.php), and
-- each account's warnings (three strikes).
CREATE TABLE IF NOT EXISTS `edit_report` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `revision_id` BIGINT NOT NULL,
  `reporter_id` INT(11) NOT NULL,
  `reason` TEXT NOT NULL,
  `status` VARCHAR(16) NOT NULL DEFAULT 'open',
  `resolution` VARCHAR(16) NULL,
  `resolved_by` INT(11) NULL,
  `created` DATETIME NOT NULL,
  `resolved` DATETIME NULL,
  PRIMARY KEY (`id`),
  KEY `index_edit_report_on_status` (`status`),
  KEY `index_edit_report_on_revision_id` (`revision_id`)
) ENGINE=InnoDB;
ALTER TABLE `user`
  ADD COLUMN IF NOT EXISTS `warnings` INT(11) NOT NULL DEFAULT 0;
