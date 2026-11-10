ALTER TABLE `marker_category` ADD COLUMN IF NOT EXISTS `description` TEXT NULL;

UPDATE `marker_category` mc
JOIN `container` c ON c.id = mc.container_id
SET mc.description = CONCAT('Find ', mc.name, ' locations in The Legend of Zelda: ', c.name,
  '. Explore the interactive map, view location details, and track your completion.')
WHERE mc.marker_category_type_id = 1 AND (mc.description IS NULL OR mc.description = '');
