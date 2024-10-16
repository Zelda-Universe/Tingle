class ContainerAddEnabledField < ActiveRecord::Migration[7.1]
  def up
    add_column    :container, :enabled, :boolean, null: false, default: '0', after: :visible, comment: 'If map can be accessed.'

    change_column :container, :visible, :boolean, null: false, default: '0', after: :offsetY, comment: 'If map can be discovered.'

    execute <<-SQL
      UPDATE `container` SET `enabled` = '1' WHERE `id` IN (
        SELECT `id` FROM `container` WHERE `visible` = '1'
      );
    SQL
  end
end
