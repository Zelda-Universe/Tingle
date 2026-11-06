-- Removes the area borders and TotK tower regions (BotW tower regions stay).
DELETE FROM map_region WHERE kind = 'area' OR submap_id IN (2101, 2102, 2103);
