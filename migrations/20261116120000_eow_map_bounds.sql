-- Echoes of Wisdom's map limits, to its artwork (latitude -25 to 499,
-- longitude -51 to 714), so the furthest zoom out fits the map rather
-- than a wide empty border around it. Only if they're still the old ones.
UPDATE container SET bound_top_pos_x = -25, bound_top_pos_y = -51, bound_bottom_pos_x = 499, bound_bottom_pos_y = 714 WHERE short_name = 'EoW' AND bound_top_pos_x = -200 AND bound_top_pos_y = -200 AND bound_bottom_pos_x = 600 AND bound_bottom_pos_y = 800;
