class RemoveActorIdFromNotification < ActiveRecord::Migration
  def up
    remove_column :notifications, :actor_id
  end

  def down
    add_column :notifications, :actor_id, :integer
  end
end
