class AddIndexToUserProjectship < ActiveRecord::Migration
  def change
    add_index :user_projectships, :user_id
    add_index :user_projectships, :project_id
    add_index :user_projectships, [:user_id, :project_id], unique: true
  end
end
