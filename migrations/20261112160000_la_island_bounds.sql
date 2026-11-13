-- Link's Awakening (Nintendo Switch): Koholint Island's pan limits, the edges
-- of its artwork, so the map fills the screen when opened and can't be
-- zoomed out past the island, as on OoT's Hyrule. Only sets limits that are
-- still empty.
UPDATE submap SET bounds = '[[-199.5,0],[-56.5,256]]' WHERE id = 2000 AND bounds IS NULL;
