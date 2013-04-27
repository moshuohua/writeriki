class AddProjectIdToEventAndDiscuss < ActiveRecord::Migration
  def change
    add_column :events,:project_id,:integer
    add_column :discusses,:project_id,:integer
    add_column :discusses,:user_id,:integer
  end
end
