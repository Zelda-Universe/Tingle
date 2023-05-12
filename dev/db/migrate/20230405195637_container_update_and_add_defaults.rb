class ContainerUpdateAndAddDefaults < ActiveRecord::Migration[7.0]
  def change
    change_table :container do |t|
      t.change_default :marker_url  , from: '/markers/',  to: 'markers/'
      t.change_default :icon_width  , from: nil        ,  to: 23
      t.change_default :icon_height , from: nil        ,  to: 23
    end
  end
end
