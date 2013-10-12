class AddStatusToFacebookRun < ActiveRecord::Migration
  def change
    add_column :facebook_runs, :status, :string
  end
end
