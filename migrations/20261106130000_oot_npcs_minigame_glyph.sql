-- OoT's "People" category becomes "NPCs", and Minigames gets the rupee glyph
-- (BotW_Mini-Game, as BotW's Minigame category). Only changes values that are
-- still as 20261106120000_oot_places set them.
UPDATE marker_category SET name = 'NPCs' WHERE id = 64041 AND name = 'People';
UPDATE marker_category SET img = 'BotW_Mini-Game' WHERE id = 64033 AND img = 'BotW_Locations';
