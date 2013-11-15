class CreateWaitingLists < ActiveRecord::Migration
  def change
    create_table :waiting_lists do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :waiting_lists, :user_id
  end
end
