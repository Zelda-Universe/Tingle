ALTER TABLE `map` ADD COLUMN IF NOT EXISTS `always_show_categories` TINYINT(1) NOT NULL DEFAULT 0;
UPDATE `map` SET `always_show_categories`=1 WHERE `kind`='dungeon';
