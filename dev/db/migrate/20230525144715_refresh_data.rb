class RefreshData < ActiveRecord::Migration[7.0]
  def sqlFileNames
    [
      '1-marker'    ,
      '2-user'      ,
      '3-marker_tab'
    ]
  end

  def up
    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` BETWEEN 400 AND 435
      AND `parent_id` IS NOT NULL
      ;
    SQL
    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` BETWEEN 400 AND 435
      AND `parent_id` IS NULL
      ;
    SQL

    execute <<-SQL
      DELETE FROM `marker`
      WHERE `id` BETWEEN '12522' AND '13297'
      ;
    SQL

    filePathPattern = "#{__dir__}/sql/" +
      File.basename(__FILE__).
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNames.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      # print "sqlFile: #{sqlFile}"
      execute File.open(sqlFile).read
    end

    execute <<-SQL
      ALTER TABLE `marker`
      AUTO_INCREMENT=13298
      ;
    SQL
  end
end
