-- Clears the island limits 20261112160000_la_island_bounds set, where unchanged.
UPDATE submap SET bounds = NULL WHERE id = 2000 AND bounds = '[[-199.5,0],[-56.5,256]]';
