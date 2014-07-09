class AddColumnCategoryToUsers < ActiveRecord::Migration
  def up
    add_column :users, :category_id, null: false
  end

  def down
    remove_column :users, :category_id
  end
end
