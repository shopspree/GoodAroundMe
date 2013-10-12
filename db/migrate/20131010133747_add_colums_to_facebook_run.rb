class AddColumsToFacebookRun < ActiveRecord::Migration
  def change
    add_column :facebook_runs, :start_time, :datetime
    add_column :facebook_runs, :end_time, :datetime
    remove_column :facebook_runs, :url
    rename_column :facebook_runs, :facebook_page_id, :page_identifier
  end
end
