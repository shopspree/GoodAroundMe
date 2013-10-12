class AddLastRunToFacebookRun < ActiveRecord::Migration
  def change
    add_column :facebook_runs, :last_run, :datetime
  end
end
