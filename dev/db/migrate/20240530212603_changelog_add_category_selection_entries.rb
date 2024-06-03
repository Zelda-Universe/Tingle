class ChangelogAddCategorySelectionEntries < ActiveRecord::Migration[7.1]
  def up
    File.open(
      'dev/db/migrate/sql/20240530212603_changelog_add_category_selection_entries.sql'
    ).read.lines.each do |line|
      execute line if line != "\n"
    end
  end
end
