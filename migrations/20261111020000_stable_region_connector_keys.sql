-- Connector endpoints use the imported region name as an immutable key,
-- independent of its editable display name. Recover already-renamed keys.
ALTER TABLE `map_region` ADD COLUMN IF NOT EXISTS `connection_key` VARCHAR(255) NULL;
UPDATE `map_region` r
SET r.connection_key = COALESCE(
  (SELECT JSON_UNQUOTE(JSON_EXTRACT(mr.data, '$.before.name'))
   FROM `map_revision` mr
   WHERE mr.kind = 'region' AND mr.target_id = r.id
     AND JSON_VALID(mr.data)
     AND JSON_EXTRACT(mr.data, '$.before.name') IS NOT NULL
   ORDER BY mr.id LIMIT 1),
  r.name
)
WHERE r.connection_key IS NULL;
