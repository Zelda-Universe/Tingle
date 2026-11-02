class UserAddProfilePicture < ActiveRecord::Migration[7.1]
  def change
    add_column :user, :profile_picture, :string, limit: 255, after: :email
  end
end
