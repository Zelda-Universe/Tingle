-- Who made an image in a marker's contents, and where it's from, for its
-- credit line (lib/common/image_credits.php, scripts/services/ImageCredits.js):
-- an author, a source link and a license, set from the marker editor's
-- Credit button. Keyed by the image's address (src: an upload's path, as
-- uploads/marker-images/..., or another site's full URL), so an image used
-- in several places is credited once. An image with no row is the site's
-- own and shows no credit.
CREATE TABLE IF NOT EXISTS image_credit (
  id INT NOT NULL AUTO_INCREMENT,
  src VARCHAR(500) NOT NULL,
  src_hash CHAR(64) NOT NULL,
  author VARCHAR(120) NOT NULL DEFAULT '',
  source_url VARCHAR(500) NOT NULL DEFAULT '',
  license VARCHAR(16) NOT NULL DEFAULT 'own',
  user_id INT NOT NULL,
  created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY image_credit_src (src_hash)
);
