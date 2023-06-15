class MarkerAddPathDefault < ActiveRecord::Migration[7.0]
  def change
    change_table :marker do |t|
      t.change_default :path, from: nil, to: ''
    end
  end
end
