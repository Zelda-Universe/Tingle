-- Lists Ocarina of Time (container 64, OoTR) in the game switcher, now that
-- its maps and markers are served from the database. Until this release the
-- read-only pack added OoT to the list by hand, so the row stayed hidden.
-- Ships with the code that removes the pack: run alone, the old code would
-- list OoT twice.
UPDATE container SET visible = 1 WHERE id = 64 AND LOWER(short_name) = 'ootr';
