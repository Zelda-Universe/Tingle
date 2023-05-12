class ContainerAddIconAndOtherMissingFields < ActiveRecord::Migration[6.0]
  def change
    change_table :container do |t|
      t.string :icon, null: false, limit: 60, after: :background_color
      t.float :bound_top_pos_x, null: false, default: 0, after: :default_pos_y
      t.float :bound_top_pos_y, null: false, default: 0, after: :bound_top_pos_x
      t.float :bound_bottom_pos_x, null: false, default: -256, after: :bound_top_pos_y
      t.float :bound_bottom_pos_y, null: false, default: 256, after: :bound_bottom_pos_x
      t.integer :icon_small_width, null: false, default: 16, after: :icon_height
      t.integer :icon_small_height, null: false, default: 16, after: :icon_small_width
      t.integer :switch_icons_at_zoom, null: false, default: 5, after: :icon_small_height
      t.integer :default_zoom, null: false, default: 3, after: :visible
    end
  end
end
