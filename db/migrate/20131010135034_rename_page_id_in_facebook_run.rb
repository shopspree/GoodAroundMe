class RenamePageIdInFacebookRun < ActiveRecord::Migration
  def up
    rename_column :facebook_runs, :page_identifier, :page_id
  end

  def down
    rename_column :facebook_runs, :page_id, :page_identifier
  end
end
