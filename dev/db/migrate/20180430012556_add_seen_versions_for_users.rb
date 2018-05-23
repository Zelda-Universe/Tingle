class AddSeenVersionsForUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :user do |t|
      t.integer :seen_version_major, null: false, default: 0
      t.integer :seen_version_minor, null: false, default: 0
      t.integer :seen_version_patch, null: false, default: 0
      t.boolean :seen_latest_changelog, null: false, default: true
    end
  end
end
