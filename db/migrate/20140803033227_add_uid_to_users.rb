class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, null: false
  end
end
