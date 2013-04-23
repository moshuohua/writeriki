class CreateDiscusses < ActiveRecord::Migration
  def change
    create_table :discusses do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
