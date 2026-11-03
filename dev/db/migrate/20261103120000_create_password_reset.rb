class CreatePasswordReset < ActiveRecord::Migration[7.1]
  def change
    # One row per reset link. Only the SHA-256 of the token is stored; the
    # token itself travels in the e-mailed link. Rows are consumed (used set)
    # when the link is used or superseded.
    create_table :password_reset, id: :integer do |t|
      t.integer  :user_id   , null: false
      t.string   :token_hash, null: false, limit: 64
      t.datetime :expires   , null: false
      t.datetime :used
      t.datetime :created   , null: false
      t.string   :ip        , null: false, limit: 46
    end

    add_index :password_reset, :token_hash, unique: true
    add_index :password_reset, :user_id
  end
end
