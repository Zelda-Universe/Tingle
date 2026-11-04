class CreateUserActivity < ActiveRecord::Migration[7.1]
  def up
    # One row per account per day it's used (sign-in or visit), for daily,
    # weekly and monthly active users. See lib/common/activity.php.
    create_table :user_activity, id: false do |t|
      t.integer :user_id, null: false
      t.date    :day    , null: false
    end
    execute 'ALTER TABLE `user_activity` ADD PRIMARY KEY (`user_id`, `day`)'
    add_index :user_activity, :day

    # Start from each account's last sign-in, the only history there is.
    execute <<~SQL
      INSERT IGNORE INTO `user_activity` (`user_id`, `day`)
      SELECT `id`, DATE(`last_login`) FROM `user`
       WHERE `last_login` IS NOT NULL AND `deleted` IS NULL
    SQL
  end

  def down
    drop_table :user_activity
  end
end
