class MarkerAddPathColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :marker, :path, :text, null: false, default: '', after: :global
  end
end
