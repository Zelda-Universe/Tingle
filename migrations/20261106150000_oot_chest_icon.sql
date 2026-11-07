-- Use the supplied OoT chest artwork without changing other games' icons.
UPDATE marker_category SET img = 'OoT_Chest' WHERE id = 64021 AND container_id = 64 AND img = 'BotW_Treasure-Chest';
