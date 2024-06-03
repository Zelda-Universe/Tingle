class UserAddDeletedField < ActiveRecord::Migration[7.1]
  def change
    add_column :user, :deleted, :datetime, after: :created
  end
end
