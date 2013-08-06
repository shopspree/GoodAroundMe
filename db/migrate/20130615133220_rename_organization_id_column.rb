class RenameOrganizationIdColumn < ActiveRecord::Migration
  def up
    rename_column :actors, :organization_id, :context_id
    rename_column :activities, :organization_id, :context_id
    rename_column :hashtags, :organization_id, :context_id
    rename_column :groups, :organization_id, :context_id
  end

  def down
    rename_column :actors, :context_id, :organization_id
    rename_column :activities, :context_id, :organization_id
    rename_column :hashtags, :context_id, :organization_id
    rename_column :groups, :context_id, :organization_id
  end
end
