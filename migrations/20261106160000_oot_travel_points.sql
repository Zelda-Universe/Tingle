-- Rename only the OoT travel section.
UPDATE marker_category SET name = 'Travel Points' WHERE id = 64050 AND container_id = 64 AND name = 'Travel';
