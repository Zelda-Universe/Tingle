class ContainerAddCrsOptionsAndUpdateTotKAreas < ActiveRecord::Migration[7.0]
  def change
    change_table :container do |t|
      t.column :scaleP  , :float, null: false, default: 1 , after: :switch_icons_at_zoom
      t.column :scaleN  , :float, null: false, default: -1, after: :scaleP
      t.column :offsetX , :float, null: false, default: 0 , after: :scaleN
      t.column :offsetY , :float, null: false, default: 0 , after: :offsetX
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE `container`
          SET
            `default_pos_x`       = '378.6650510291156' ,
            `default_pos_y`       = '-1335.990033109192',
            `bound_top_pos_x`     = '7000'              ,
            `bound_top_pos_y`     = '-8000'             ,
            `bound_bottom_pos_x`  = '-7000'             ,
            `bound_bottom_pos_y`  = '8000'              ,
            `scaleP`              = '0.01171875'        ,
            `scaleN`              = '-0.01171875'       ,
            `offsetX`             = '70.3125'           ,
            `offsetY`             = '58.59375'
          WHERE `id` = '21'
          ;
        SQL
      end
      dir.down do
        execute <<-SQL
          UPDATE `container`
          SET
            `default_pos_x`       = '74.9648' ,
            `default_pos_y`       = '-74.0977',
            `bound_top_pos_x`     = '16'      ,
            `bound_top_pos_y`     = '-16'     ,
            `bound_bottom_pos_x`  = '-134'    ,
            `bound_bottom_pos_y`  = '157'
          WHERE `id` = '21'
          ;
        SQL
      end
    end
  end
end
