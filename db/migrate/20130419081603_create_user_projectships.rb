class CreateUserProjectships < ActiveRecord::Migration
  def change
    create_table :user_projectships do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
