class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :value, null: false, default: 0
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
