-- Embed usage (ajax/track_embed.php, embed.php): each Embed Code copied, and
-- each time an embed is shown on another site, with that site's name (its
-- host, from the browser's Referer) but nothing about the reader beyond a
-- hash of their address that changes daily (rate limiting only:
-- lib/common/embeds.php). Admin's Embeds section reads it.
CREATE TABLE IF NOT EXISTS embed_event (
  id INT NOT NULL AUTO_INCREMENT,
  kind VARCHAR(8) NOT NULL,
  target VARCHAR(8) NOT NULL,
  game VARCHAR(32) NULL,
  host VARCHAR(190) NULL,
  ip_hash CHAR(64) NOT NULL,
  created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY embed_event_kind_created (kind, created),
  KEY embed_event_ip (ip_hash, created)
);
