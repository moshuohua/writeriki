class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end

    add_index :duties, :user_id
    add_index :duties, :project_id
    add_index :duties, [:user_id, :project_id], unique: true
  end
end
