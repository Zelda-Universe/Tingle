class CreateNotifications < ActiveRecord::Migration[7.1]
  def up
    # One row per notification shown in the app (lib/common/notifications.php).
    # data holds what it says (titles, an excerpt) as JSON, as it was then.
    create_table :notification do |t|
      t.integer  :user_id    , null: false
      t.string   :type       , null: false, limit: 32
      t.integer  :actor_id
      t.string   :page_type  , limit: 16
      t.integer  :page_id
      t.integer  :marker_id
      t.bigint   :comment_id
      t.bigint   :revision_id
      t.text     :data
      # False for ones sent only by email, which the app doesn't list.
      t.boolean  :in_app     , null: false, default: true
      t.datetime :created    , null: false
      t.datetime :read_at
    end
    add_index :notification, [:user_id, :id]
    add_index :notification, [:user_id, :read_at]

    # How each kind of notification arrives: in the app (and as push
    # notifications), by email, both, or not at all. No row means the default.
    create_table :notification_setting, id: false do |t|
      t.integer :user_id, null: false
      t.string  :type   , null: false, limit: 32
      t.boolean :in_app , null: false
      t.boolean :email  , null: false
    end
    add_index :notification_setting, [:user_id, :type], unique: true

    # Talk pages people follow (markers, for now).
    create_table :talk_follow, id: false do |t|
      t.integer  :user_id  , null: false
      t.string   :page_type, null: false, limit: 16
      t.integer  :page_id  , null: false
      t.datetime :created  , null: false
    end
    add_index :talk_follow, [:user_id, :page_type, :page_id], unique: true
    add_index :talk_follow, [:page_type, :page_id]

    # Pausing every followed marker at once keeps the list.
    add_column :user, :notify_follows_paused, :boolean, null: false, default: false
    add_column :user, :notify_auto_follow   , :boolean, null: false, default: true

    # Browsers subscribed to push notifications. Pushes carry no payload:
    # the service worker fetches what's new.
    create_table :push_subscription do |t|
      t.integer  :user_id      , null: false
      t.text     :endpoint     , null: false
      t.string   :endpoint_hash, null: false, limit: 64
      t.string   :p256dh       , limit: 255
      t.string   :auth         , limit: 64
      t.string   :user_agent   , limit: 255
      t.datetime :created      , null: false
      t.datetime :last_used
    end
    add_index :push_subscription, :endpoint_hash, unique: true
    add_index :push_subscription, :user_id

    # Values the app generates for itself, like its push (VAPID) keys.
    create_table :app_setting, id: false do |t|
      t.string :name , null: false, limit: 64
      t.text   :value, null: false
    end
    add_index :app_setting, :name, unique: true
  end

  def down
    drop_table :app_setting
    drop_table :push_subscription
    remove_column :user, :notify_auto_follow
    remove_column :user, :notify_follows_paused
    drop_table :talk_follow
    drop_table :notification_setting
    drop_table :notification
  end
end
