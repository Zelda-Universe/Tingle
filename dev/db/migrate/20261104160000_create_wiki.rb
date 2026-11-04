class CreateWiki < ActiveRecord::Migration[7.1]
  def up
    # Every saved version of a marker, wiki-style: its fields and visible
    # tabs as JSON (lib/common/wiki.php). Reverts are revisions too, so they
    # can be reverted in turn.
    create_table :marker_revision do |t|
      t.integer  :marker_id          , null: false
      t.integer  :user_id            , null: false
      # create, edit, revert, delete, or import (the version from before
      # history was kept, saved when a marker is first edited).
      t.string   :action             , null: false, limit: 16
      t.string   :summary            , limit: 255
      t.bigint   :reverts_revision_id
      t.text     :data               , null: false, limit: 16_777_215
      t.datetime :created            , null: false
    end
    add_index :marker_revision, :marker_id
    add_index :marker_revision, :user_id

    # Threaded comments on markers' and users' Talk pages.
    create_table :talk_comment do |t|
      t.string   :page_type, null: false, limit: 16
      t.integer  :page_id  , null: false
      t.bigint   :parent_id
      t.integer  :user_id  , null: false
      t.text     :body     , null: false
      t.datetime :created  , null: false
      t.datetime :deleted
    end
    add_index :talk_comment, [:page_type, :page_id]

    # Profile pages.
    add_column :user, :bio, :text
    add_column :user, :profile_banner, :string
  end

  def down
    remove_column :user, :profile_banner
    remove_column :user, :bio
    drop_table :talk_comment
    drop_table :marker_revision
  end
end
