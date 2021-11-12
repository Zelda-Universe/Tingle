# Usage:
#
# In a migration file:
# require './lib/VersionMigrator.rb'
# VersionMigrator.createSeenVersionMigrationSQLStatements.each do |sqlStatement|
#   execute sqlStatement
# end
#
# Debug/Other:
# puts VersionMigrator.createSeenVersionMigrationSQLStatements

class VersionMigrator
  require 'json'
  require 'active_support/core_ext/hash/indifferent_access'
  @@versionsInfo = JSON.parse(
    File.read('./dev/info/versionsInfo.json').gsub(/\n/,'')
  ).map { |versionInfo| versionInfo.with_indifferent_access }
  # This step is essential for properly creating the ranges through the contiguous timeline in the correct order.
  @@versionsInfo.sort_by { |versionDatePair| versionDatePair[:timestamp] }

  def self.createSeenVersionMigrationSQLStatements
    createSQLStatements(createVersionRanges)
  end

  private

  def self.createVersionRanges
    [{
      version: "0.0.-1",
      end_timestamp: @@versionsInfo[0][:timestamp]
    }].concat(@@versionsInfo.map.with_index do |versionInfo, index|
      versionRange = {
        version: versionInfo[:version],
        start_timestamp: versionInfo[:timestamp]
      }
      versionRange[:end_timestamp] = @@versionsInfo[index+1][:timestamp] - 1 if index < @@versionsInfo.length - 1
      versionRange
    end)
  end

  def self.createSQLStatements(versionRanges)
    versionRanges.map do |versionRange|
      v = versionRange[:version].split(".")

      "UPDATE " +
        "`user` " +
      "SET " +
        "`seen_version_major` = #{v[0]}, " +
        "`seen_version_minor` = #{v[1]}, " +
        "`seen_version_patch` = #{v[2]}, " +
        "`seen_latest_changelog` = #{(versionRange[:end_timestamp].nil?) ? 1 : 0} " +
      "WHERE " +
        "1=1" +
        ((versionRange[:start_timestamp].nil?) ? "" : " AND `last_login` >= '#{Time.at(versionRange[:start_timestamp]).utc.strftime("%Y-%m-%d %H:%M:%S")}'") +
        ((versionRange[:end_timestamp].nil?) ? "" : " AND `last_login` <= '#{Time.at(versionRange[:end_timestamp]).utc.strftime("%Y-%m-%d %H:%M:%S")}'") +
        ";"
    end
  end
end
