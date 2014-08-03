class AlterColumnsOnUsers < ActiveRecord::Migration
  def up
    remove_column :users, :category_id, :integer
  end

  def down
    add_column :users, :category_id, :integer
  end
end
