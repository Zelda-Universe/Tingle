class AddDragonData < ActiveRecord::Migration[7.0]
  def sqlFileNames
    [
      '1-marker_category' ,
      '2-marker'          ,
      '3-marker_tab'
    ]
  end

  def up
    execute <<-SQL
      ALTER TABLE `marker`
      MODIFY COLUMN `last_updated` datetime NULL
    SQL

    filePathPattern = "#{__dir__}/sql/" +
      File.basename(__FILE__).
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNames.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      execute File.open(sqlFile).read
    end
  end

  def down
    execute <<-SQL
      DELETE FROM `marker_tab`
      WHERE `id` BETWEEN 29342 AND 29348
      ;
    SQL
    execute <<-SQL
      DELETE FROM `marker`
      WHERE `id` BETWEEN 30175 AND 30181
      ;
    SQL
    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` = '2173'
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `marker`
      MODIFY COLUMN `last_updated` datetime NOT NULL
    SQL
  end
end
