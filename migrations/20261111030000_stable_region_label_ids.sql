-- Display names are editable; polygon/label associations are not.
ALTER TABLE `map_region` ADD COLUMN IF NOT EXISTS `label_marker_id` INT NULL;
UPDATE `map_region` r
JOIN (
  SELECT r.id, MIN(p.id) AS marker_id
  FROM `map_region` r
  JOIN `marker` p ON p.submap_id=r.submap_id
    AND (p.name=r.name OR p.name=r.short_name OR p.name=r.connection_key)
  JOIN `marker_category` c ON c.id=p.marker_category_id AND c.marker_category_type_id=3
  GROUP BY r.id HAVING COUNT(DISTINCT p.id)=1
) matches ON matches.id=r.id
SET r.label_marker_id=matches.marker_id
WHERE r.label_marker_id IS NULL;
