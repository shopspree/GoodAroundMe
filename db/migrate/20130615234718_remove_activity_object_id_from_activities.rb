class RemoveActivityObjectIdFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :activity_object_id
  end

  def down
    add_column :activities, :activity_object_id, :intege
  end
end
