class AddPersonIdToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :person_id, :integer
    remove_column :followers, :actor_id
  end
end
