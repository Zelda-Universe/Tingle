class MarkerAddAndUpdateColumns < ActiveRecord::Migration[7.0]
  def change
    change_table :marker do |t|
      t.column      :game_data    , :text   , null: true, after: :path
      t.column      :z            , :double , null: true, after: :y

      t.change_null :last_updated , true
    end
  end
end
