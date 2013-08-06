class AddActorIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :actor_id, :integer
  end
end
