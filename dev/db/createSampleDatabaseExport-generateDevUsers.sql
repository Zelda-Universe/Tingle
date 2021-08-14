SELECT
  `unique_marker_and_marker_tab_users`.`user_id` AS `id`,
  CONCAT('test', `unique_marker_and_marker_tab_users`.`user_id`) AS `username`,
  '$2y$13$6X4RYJqepBi2Te1pY1nq5.oGtUMY7aB6SOTO2lTEOx7lUTlNwOfqS' AS `password`,
  CONCAT('test', `unique_marker_and_marker_tab_users`.`user_id`) AS `name`,
  CONCAT('test', `unique_marker_and_marker_tab_users`.`user_id`, '@test.com') AS `email`,
  '2018-01-02 02:40:51' AS `created`,
  '127.0.0.1' AS `ip`,
  '2018-01-02 02:40:51' AS `last_login`,
  `user`.`level`,
  `user`.`visible`,
  '0' AS `seen_version_major`,
  '5' AS `seen_version_minor`,
  '0' AS `seen_version_patch`,
  '0' AS `seen_latest_changelog`
FROM
  (
    SELECT `user_id`
      FROM `marker`
      GROUP BY `user_id`
    UNION
    SELECT `user_id`
      FROM `marker_tab`
      GROUP BY `user_id`
      ORDER BY `user_id`
  ) AS `unique_marker_and_marker_tab_users`
LEFT JOIN `user`
ON `unique_marker_and_marker_tab_users`.`user_id` = `user`.`id`
;
