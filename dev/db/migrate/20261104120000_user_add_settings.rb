class UserAddSettings < ActiveRecord::Migration[7.1]
  def change
    # Map settings as JSON, e.g. {"minimalUI":true}; see lib/common/user_settings.php.
    add_column :user, :settings, :text
  end
end
