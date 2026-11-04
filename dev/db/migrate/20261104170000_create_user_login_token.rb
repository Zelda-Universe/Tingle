class CreateUserLoginToken < ActiveRecord::Migration[7.1]
  def up
    # Keeps people signed in until they log out, when their PHP session is
    # lost (lib/common/auth_token.php). One row per signed-in device; the
    # login cookie holds the selector and a validator whose SHA-256 is here.
    create_table :user_login_token do |t|
      t.integer  :user_id   , null: false
      t.string   :selector  , null: false, limit: 24
      t.string   :token_hash, null: false, limit: 64
      t.string   :user_agent, limit: 255
      t.string   :ip        , limit: 46
      t.datetime :created   , null: false
      t.datetime :last_used , null: false
    end
    add_index :user_login_token, :selector, unique: true
    add_index :user_login_token, :user_id
  end

  def down
    drop_table :user_login_token
  end
end
