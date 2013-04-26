class AddProjectIdToDoc < ActiveRecord::Migration
  def change
    add_column :docs, :project_id, :integer
  end
end
