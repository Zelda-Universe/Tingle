class MakeTableReferencesWeak < ActiveRecord::Migration[6.0]
  def up
    # require 'pry-byebug'
    # binding.pry
    
    # change_table :map do |t|
    #   t.references :container, :fk_map_project1, foreign_key: { on_delete: :no_action, on_update: :no_action }
    # end
    # Mysql2::Error: Duplicate column name 'container_id'
    # But I don't want a new column, but to update a foreign key, and not an index either.
    # Seems this may have been the wrong idea?....: https://stackoverflow.com/a/45223598/1091943
    
    # Found this other idea from just looking at schema.rb....
    # add_foreign_key "map", "container", name: "fk_map_project1", on_update: :no_action, on_delete: :no_action
    # ArgumentError: 'no_action' is not supported for :on_update or :on_delete.
    
    # https://kodlogs.com/90486/the-foreign-keys-on-delete-no-action-on-update-no-action
    # Seems we have the InnoDB engine as identified in the SQL export, so RESTRICT and NO ACTION should be the same.
    # Maybe this Ruby/Rails gem is just limiting us, because the option is available in MySQL Workbench..
    
    # https://guides.rubyonrails.org/v3.2/migrations.html#changing-tables
    # The references helper does not actually create foreign key constraints for you. You will need to use execute or a plugin that adds foreign key support.
    
    # remove_foreign_key :map, name: :fk_map_project1
    # execute <<-SQL
    #   ALTER TABLE `map`
    #   ADD CONSTRAINT `fk_map_project1`
    #   FOREIGN KEY (`container_id`) REFERENCES `container` (`id`)
    #   ON DELETE NO ACTION ON UPDATE NO ACTION
    #   ;
    # SQL
    # Completes but not seem to change anything when inspecting my MySQL 8 server, so ignore these changers I guess.  I will update the export process to clean it out.
  end
  
  def down
    # not needed since the rest doesn't work..
  end
end
