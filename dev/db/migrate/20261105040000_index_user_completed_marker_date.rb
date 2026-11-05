class IndexUserCompletedMarkerDate < ActiveRecord::Migration[7.1]
  # Admin's feature graphs (ajax/admin_get_activity.php) count completes by
  # when they were saved. user_completed_marker has 66 million rows and only
  # its primary key (user_id, marker_id), so every ranged count was a full
  # scan of the table and one page load ran ten of them.
  #
  # Online on InnoDB (reads and writes continue), a few minutes and about a
  # gigabyte on production. By hand:
  #   ALTER TABLE `user_completed_marker`
  #     ADD INDEX `index_user_completed_marker_on_complete_date` (`complete_date`),
  #     ALGORITHM=INPLACE, LOCK=NONE;
  def change
    add_index :user_completed_marker, :complete_date
  end
end
