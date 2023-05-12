class ChangelogAddHiddenFieldAndDisableBlankContent < ActiveRecord::Migration[7.0]
  def change
    change_table :changelog do |t|
      t.column :hidden, :boolean, null: false, default: 0, after: :version_patch

      t.change_null :content, false
    end
  end
end
