class RemoveActorIdToProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :actor_id
  end

  def down
    add_column :profiles, :actor_id, :integer
  end
end
