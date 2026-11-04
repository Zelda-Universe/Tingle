class AdminAccounts < ActiveRecord::Migration[7.1]
  def up
    # When the account last used the site: set on sign-in and, at most every
    # few minutes, on visits (lib/common/activity.php). Starts from the last
    # sign-in, the only history there is.
    add_column :user, :last_seen, :datetime
    execute 'UPDATE `user` SET `last_seen` = `last_login` WHERE `deleted` IS NULL'

    # Set while an admin has disabled the account: it can't sign in, and
    # existing sessions end. Unlike deletion, nothing is wiped.
    add_column :user, :disabled, :datetime

    # Set while an admin has banned the account, with their reason. Like a
    # disabled account it can't sign in, and its email (normalized; see
    # lib/common/account_status.php) can't be used to sign up again.
    add_column :user, :banned, :datetime
    add_column :user, :ban_reason, :string, limit: 500
    create_table :banned_email, id: false do |t|
      t.string   :email  , null: false
      t.integer  :user_id, null: false
      t.datetime :created, null: false
    end
    execute 'ALTER TABLE `banned_email` ADD PRIMARY KEY (`email`)'
    add_index :banned_email, :user_id

    # Changes admins make to accounts, shown on the admin account page.
    create_table :admin_log do |t|
      t.integer  :admin_id, null: false
      t.integer  :user_id , null: false
      t.string   :action  , null: false, limit: 32
      # JSON: the fields changed, e.g. {"level":[1,10]}. Passwords are only
      # recorded as changed.
      t.text     :details
      t.datetime :created , null: false
    end
    add_index :admin_log, :user_id
  end

  def down
    drop_table :admin_log
    drop_table :banned_email
    remove_column :user, :ban_reason
    remove_column :user, :banned
    remove_column :user, :disabled
    remove_column :user, :last_seen
  end
end
