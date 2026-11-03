class CreateUserBookmark < ActiveRecord::Migration[7.1]
  def change
    # A bookmark is either a POI (marker_id) or a dropped pin (map, submap and
    # coordinates).
    create_table :user_bookmark, id: :integer do |t|
      t.integer  :user_id  , null: false
      t.integer  :marker_id
      t.integer  :map_id
      t.integer  :submap_id
      t.decimal  :x        , precision: 12, scale: 4
      t.decimal  :y        , precision: 12, scale: 4
      t.datetime :created  , null: false
    end

    add_index :user_bookmark, [:user_id, :marker_id], unique: true
  end
end
