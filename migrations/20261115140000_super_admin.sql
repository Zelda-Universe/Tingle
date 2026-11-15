-- Jess (user 15) as the site's super admin: an admin who also manages the
-- other admins from the admin panel (lib/common/admin.php). Only if the
-- account is an admin already; the site still shows it as "Admin".
UPDATE `user` SET `level` = 20 WHERE `id` = 15 AND `level` >= 10 AND `level` < 20;
