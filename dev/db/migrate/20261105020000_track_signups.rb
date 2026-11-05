class TrackSignups < ActiveRecord::Migration[7.1]
  def up
    # Where each account was registered from: bookmark, complete or account
    # (ajax/user_add.php). Null for accounts from before it was kept.
    add_column :user, :signup_source, :string, limit: 32
    # The A/B group of the prompt they signed up from (Complete's reminder
    # timing: milestone or visit). Null otherwise.
    add_column :user, :signup_variant, :string, limit: 16

    # Anonymous counts of the sign-up prompts and what people chose, for
    # Admin's Sign-Up Sources (ajax/track_event.php). ip_hash only limits how
    # fast one visitor can add rows; it's a salted hash, never shown.
    create_table :feature_event do |t|
      t.string   :event  , null: false, limit: 32
      t.string   :feature, null: false, limit: 32
      t.string   :variant, limit: 16
      t.string   :ip_hash, limit: 64
      t.datetime :created, null: false
    end
    add_index :feature_event, :created
    add_index :feature_event, [:ip_hash, :created]
  end

  def down
    drop_table :feature_event
    remove_column :user, :signup_variant
    remove_column :user, :signup_source
  end
end
