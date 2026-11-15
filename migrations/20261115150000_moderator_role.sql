-- Moderators (level 10) come in below admins, with everything admins have
-- for now (lib/common/admin.php); admins move up to 15 to make room. Every
-- admin today stays one: the Moderator role starts empty. (Run after
-- super_admin, which made Jess 20.)
UPDATE `user` SET `level` = 15 WHERE `level` = 10;
