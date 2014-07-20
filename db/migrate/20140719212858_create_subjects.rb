class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :subjects, :user_id
    add_index :subjects, [:user_id, :id]
  end
end
