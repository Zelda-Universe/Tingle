-- Echoes of Wisdom's earlier map limits.
UPDATE container SET bound_top_pos_x = -200, bound_top_pos_y = -200, bound_bottom_pos_x = 600, bound_bottom_pos_y = 800 WHERE short_name = 'EoW' AND bound_top_pos_x = -25 AND bound_top_pos_y = -51 AND bound_bottom_pos_x = 499 AND bound_bottom_pos_y = 714;
