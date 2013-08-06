class ChangeActivities < ActiveRecord::Migration
  def up
    add_column :activities, :timelineable_id, :integer
    add_column :activities, :timelineable_type, :string
  end

  def down
    remove_column :activities, :timelineable_id
    remove_column :activities, :timelineable_type
  end
end
