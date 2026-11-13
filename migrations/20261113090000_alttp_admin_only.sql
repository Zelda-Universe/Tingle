-- A Link to the Past: playable for admins while it's being built. visible = 2
-- keeps it out of the public game list (get_games) and has its data
-- endpoints answer non-admins with nothing; admins see it in the game
-- switcher (get_admin_games). Set visible = 1 to launch it.
UPDATE container SET visible = 2, enabled = 1 WHERE id = 3 AND visible = 0;
