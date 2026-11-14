-- Who has started each user's path (ajax/start_path.php): pressing its
-- Start or Continue, or completing a step from its page. A user's path's
-- "started" and "finish" figures come from these, since completing one of
-- its markers elsewhere doesn't mean someone was following it. (Official
-- paths, all trading-sequence-like, keep counting from completions.)
CREATE TABLE IF NOT EXISTS path_start (
  path_id INT NOT NULL,
  user_id INT NOT NULL,
  started_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (path_id, user_id),
  KEY path_start_user (user_id)
);
