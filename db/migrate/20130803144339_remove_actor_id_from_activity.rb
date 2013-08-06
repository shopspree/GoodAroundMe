class RemoveActorIdFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :actor_id
  end

  def down
    add_column :activities, :actor_id, :string
  end
end
