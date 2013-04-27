class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
