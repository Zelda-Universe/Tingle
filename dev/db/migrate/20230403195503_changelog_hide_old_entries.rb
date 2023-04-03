class ChangelogHideOldEntries < ActiveRecord::Migration[7.0]
  def up
    execute "
      UPDATE `changelog`
      SET `hidden` = '1'
      WHERE
            `id` > '17'
        AND `id` < '26'
    ;";
  end
end
