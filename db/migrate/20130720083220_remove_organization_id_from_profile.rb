class RemoveOrganizationIdFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :organization_id
  end

  def down
    add_column :profiles, :organization_id, :integer
  end
end
