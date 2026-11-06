-- Removes what the labels migration added: its markers, found by their
-- game data, then the label categories if nothing else uses them.
DELETE FROM marker WHERE submap_id = 1901 AND game_data LIKE '{"source":"BotW LocationMarker"%';
DELETE c FROM marker_category c LEFT JOIN marker m ON m.marker_category_id = c.id WHERE c.container_id = 19 AND c.marker_category_type_id = 3 AND c.parent_id IS NOT NULL AND m.id IS NULL;
DELETE c FROM marker_category c LEFT JOIN marker_category k ON k.parent_id = c.id WHERE c.container_id = 19 AND c.marker_category_type_id = 3 AND c.name = 'Labels' AND k.id IS NULL;
