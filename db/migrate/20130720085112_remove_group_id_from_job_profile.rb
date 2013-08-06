class RemoveGroupIdFromJobProfile < ActiveRecord::Migration
  def up
    remove_column :job_profiles, :group_id
  end

  def down
    add_column :job_profiles, :group_id, :integer
  end
end
