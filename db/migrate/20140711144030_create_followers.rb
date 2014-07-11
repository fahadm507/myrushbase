class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :followed_user_id, null: false
      t.integer :following_user_id, null: false

      t.timestamps
    end
  end
end
