-- Hides Ocarina of Time from the game switcher again.
UPDATE container SET visible = 0 WHERE id = 64 AND LOWER(short_name) = 'ootr';
