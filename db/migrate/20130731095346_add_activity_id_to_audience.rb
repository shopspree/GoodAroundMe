class AddActivityIdToAudience < ActiveRecord::Migration
  def change
    add_column :audiences, :activity_id, :integer
  end
end
