-- Removes what 20261113030000_alttp_dungeon_treasure added.
DELETE FROM marker_tab WHERE marker_id BETWEEN 3001001 AND 3001113;
DELETE FROM marker WHERE id BETWEEN 3001001 AND 3001113;
