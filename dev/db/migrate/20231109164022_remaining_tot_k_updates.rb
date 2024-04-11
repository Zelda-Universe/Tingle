class RemainingTotKUpdates < ActiveRecord::Migration[7.0]
  def sqlFileNamesMultiple
    [
      '1-marker_category-updates'
    ]
  end
  def sqlFileNames
    [
      '1-marker_category-updates' ,
      '2-marker_category'         ,
      '3-marker-remove'           ,
      '4-marker'                  ,
      '5-user'                    ,
      '6-marker_tab-remove'       ,
      '7-marker_tab'              ,
      '8-submap'
    ]
  end

  def up
    filePathPattern = "#{__dir__}/sql/" +
      File.basename(__FILE__).
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNames.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      if sqlFileNamesMultiple.include?(sqlFileName)
        File.open(sqlFile).read.lines.each do |line|
          execute line if line != "\n"
        end
      else
        execute File.open(sqlFile).read
      end
    end
  end

  def down
    puts 'Error: Not yet implemented.'
    exit 254
  end
end
