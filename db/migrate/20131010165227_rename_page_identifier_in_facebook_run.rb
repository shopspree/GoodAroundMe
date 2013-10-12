class RenamePageIdentifierInFacebookRun < ActiveRecord::Migration
  def up
    rename_column :facebook_runs, :page_id, :facebook_page_id
  end

  def down
    rename_column :facebook_runs, :facebook_page_id, :page_id
  end
end
