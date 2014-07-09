class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :points, :user_id
    add_index :points, [:user_id, :id], unique: true
  end
end
