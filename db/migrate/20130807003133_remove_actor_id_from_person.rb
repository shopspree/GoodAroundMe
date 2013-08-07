class RemoveActorIdFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :actor_id
  end

  def down
    add_column :people, :actor_id, :string
  end
end
