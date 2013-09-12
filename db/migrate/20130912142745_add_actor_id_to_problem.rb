class AddActorIdToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :actor_id, :integer
    remove_column :problems, :reporter
  end
end
