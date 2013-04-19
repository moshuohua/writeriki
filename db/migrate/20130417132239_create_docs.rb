class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :title
      t.text :content
      t.string :keyword

      t.timestamps
    end
  end
end
