class RemoveColumn < ActiveRecord::Migration

  def down
    remove_column :users, :encrypted_password, default: "", null: false
  end

end
