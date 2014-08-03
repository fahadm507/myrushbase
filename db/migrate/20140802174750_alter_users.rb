class AlterUsers < ActiveRecord::Migration
  def up
    add_column :users, :oauth_token, :string, null: false
    add_column :users, :oauth_expires_at, :datetime, null: false
    add_column :users, :provider, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :image, :string, null: false

  end

  def down
    remove_column :users, :oauth_token, :string
    remove_column :users, :oauth_expires_at, :string
    remove_column :users, :provider, :string
    remove_column :users, :name, :string
    remove_column :users, :image, :string
  end
end

