-- The Minish Cap: playable for staff while it's being built, as ALttP is.
-- visible = 2 keeps it out of the public game list; set visible = 1 to launch.
UPDATE container SET visible = 2, enabled = 1 WHERE id = 12 AND visible = 0;
