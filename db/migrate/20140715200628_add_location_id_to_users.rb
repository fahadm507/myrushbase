class AddLocationIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :location, :string
  end

  def down
    remove_column :users, location
  end
end
