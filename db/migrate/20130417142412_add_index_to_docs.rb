class AddIndexToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :user_id, :integer
    add_index :docs, [:user_id, :created_at]
  end
end
