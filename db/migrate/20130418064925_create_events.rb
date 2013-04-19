class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :content
      t.string :level
      t.string :appointment
      t.datetime :start_at
      t.datetime :end_at
      t.integer :user_id
      
      t.timestamps
    end
    add_index :events, [:user_id,:created_at]
  end

  def self.down
    drop_table :events
  end
end
