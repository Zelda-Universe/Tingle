-- Paths: ordered routes through markers. A path is official (on the map for
-- everyone) or a user's own (on their profile), and either a guide (each
-- step is its own marker and its own check: a trading sequence, a route) or
-- single (the whole path is one marker with one check: a Korok pair, a
-- dragon's flight). A user's path is private (only they see it), unlisted
-- (anyone with its link) or public (on their profile too), and a draft
-- until published (published_at; a future time publishes it then). Every
-- save keeps a revision, for its history.
-- Steps are existing markers or bare points (a user's own
-- pins, a dragon's waypoints); a step can be hidden (waypoints).
CREATE TABLE IF NOT EXISTS path (
  id INT NOT NULL AUTO_INCREMENT,
  container_id INT NOT NULL,
  user_id INT NOT NULL,
  scope VARCHAR(16) NOT NULL DEFAULT 'user',
  name VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL,
  description TEXT NULL,
  kind VARCHAR(16) NOT NULL DEFAULT 'guide',
  loops TINYINT(1) NOT NULL DEFAULT 0,
  numbered TINYINT(1) NOT NULL DEFAULT 0,
  category_id INT NULL,
  color VARCHAR(7) NULL,
  visible TINYINT(1) NOT NULL DEFAULT 1,
  visibility VARCHAR(16) NOT NULL DEFAULT 'private',
  edit_access VARCHAR(16) NOT NULL DEFAULT 'owner',
  published_at DATETIME NULL,
  created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY path_container_slug (container_id, slug),
  KEY path_user (user_id),
  KEY path_category (category_id)
);
-- Who else may change it, as its owner sets: 'owner' (only them) or
-- 'editors' (anyone who can edit markers). Admins always can.
CREATE TABLE IF NOT EXISTS path_step (
  id INT NOT NULL AUTO_INCREMENT,
  path_id INT NOT NULL,
  step_order INT NOT NULL,
  marker_id INT NULL,
  submap_id INT NULL,
  x DOUBLE NULL,
  y DOUBLE NULL,
  name VARCHAR(120) NULL,
  note TEXT NULL,
  shown TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  KEY path_step_order (path_id, step_order),
  KEY path_step_marker (marker_id)
);
CREATE TABLE IF NOT EXISTS user_completed_path (
  user_id INT NOT NULL,
  path_id INT NOT NULL,
  completed DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, path_id),
  KEY user_completed_path_path (path_id)
);
CREATE TABLE IF NOT EXISTS path_revision (
  id INT NOT NULL AUTO_INCREMENT,
  path_id INT NOT NULL,
  user_id INT NOT NULL,
  action VARCHAR(16) NOT NULL DEFAULT 'edit',
  summary VARCHAR(255) NULL,
  snapshot MEDIUMTEXT NOT NULL,
  created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY path_revision_path (path_id, id),
  KEY path_revision_user (user_id)
);
-- Who has finished a path, and who has started it (completion stats,
-- Community Paths' Most Completed): completions looked up by marker.
ALTER TABLE user_completed_marker ADD INDEX IF NOT EXISTS index_user_completed_marker_on_marker (marker_id, user_id);
