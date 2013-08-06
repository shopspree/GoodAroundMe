class RemoveActionIdFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :action_id
  end

  def down
    add_column :activities, :action_id, :string
  end
end
