class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :is_read
      t.integer :actor_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
