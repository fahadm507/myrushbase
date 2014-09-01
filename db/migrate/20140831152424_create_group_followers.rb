class CreateGroupFollowers < ActiveRecord::Migration
  def change
    create_table :groupfollowers do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
