-- Credits the markers imported on 6 November to Jess (account 15 on
-- production), who added them: Ocarina of Time's markers and place names
-- (641xxxxx-644xxxxx) and their how-to tabs, and Breath of the Wild's place
-- names from game data. They went in as account 1.
-- Only rows still credited to account 1 change, so later edits keep their
-- author, and nothing changes where account 15 doesn't exist (local copies).

UPDATE marker SET user_id = 15
 WHERE id BETWEEN 64100000 AND 64499999 AND user_id = 1
   AND EXISTS (SELECT 1 FROM user WHERE id = 15);

UPDATE marker_tab SET user_id = 15
 WHERE marker_id BETWEEN 64100000 AND 64499999 AND user_id = 1
   AND EXISTS (SELECT 1 FROM user WHERE id = 15);

UPDATE marker SET user_id = 15
 WHERE game_data LIKE '{"source":"BotW LocationMarker"%' AND user_id = 1
   AND EXISTS (SELECT 1 FROM user WHERE id = 15);
