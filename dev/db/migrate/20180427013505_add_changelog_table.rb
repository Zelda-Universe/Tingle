class AddChangelogTable < ActiveRecord::Migration[5.1]
  def change
    create_table :changelog do |t|
      t.integer :version_major, null: false
      t.integer :version_minor, null: false
      t.integer :version_patch, null: false
      t.text :content
    end
  end
end
