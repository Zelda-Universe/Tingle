-- Hides A Link to the Past again, as before 20261113090000_alttp_admin_only.
UPDATE container SET visible = 0, enabled = 0 WHERE id = 3 AND visible = 2;
