class CreateOfflineMapEvent < ActiveRecord::Migration[7.1]
  def up
    # Offline map downloads, for Admin (ajax/offline_map_event.php). Downloads
    # happen in the browser; the page reports each start, finish, update,
    # failure and removal. A person's latest event for a game says whether
    # they still have it.
    create_table :offline_map_event do |t|
      t.integer  :user_id     , null: false
      t.integer  :container_id, null: false
      t.string   :event       , null: false, limit: 16
      t.bigint   :bytes
      t.datetime :created     , null: false
    end
    add_index :offline_map_event, :created
    add_index :offline_map_event, [:user_id, :container_id, :id]
    add_index :offline_map_event, [:container_id, :event]
  end

  def down
    drop_table :offline_map_event
  end
end
