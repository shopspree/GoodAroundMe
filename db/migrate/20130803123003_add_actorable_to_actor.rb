class AddActorableToActor < ActiveRecord::Migration
  def change
    add_column :actors, :actorable_id, :integer
    add_column :actors, :actorable_type, :string
    remove_column :actors, :user_id
  end
end
