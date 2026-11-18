-- Hides The Minish Cap again, as before 20261117130000_tmc_admin_only.
UPDATE container SET visible = 0, enabled = 0 WHERE id = 12 AND visible = 2;
