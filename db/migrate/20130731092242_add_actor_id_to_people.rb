class AddActorIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :actor_id, :integer
  end
end
