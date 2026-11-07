-- Removes the markers objects-to-sql.cjs added, their text, and their categories.
DELETE FROM user_completed_marker WHERE marker_id IN (64701001, 64701005, 64701002, 64701003, 64701004);
DELETE FROM user_bookmark WHERE marker_id IN (64701001, 64701005, 64701002, 64701003, 64701004);
DELETE FROM marker_tab WHERE marker_id IN (64701001, 64701005, 64701002, 64701003, 64701004);
DELETE FROM marker WHERE id IN (64701001, 64701005, 64701002, 64701003, 64701004);
DELETE FROM marker_category WHERE id IN (64006);
