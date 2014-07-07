class AddIndexToPostsAndComments < ActiveRecord::Migration
  def up
    add_index :posts, :user_id
    add_index :comments, :user_id
    add_index :comments, :post_id
  end

  def down
    remove_index :posts, :user_id
    remove_index :comments, :user_id
    remove_index :comments, :post_id
  end
end
