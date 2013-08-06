class RemoveOrganizationIdFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :organization_id
  end

  def down
    add_column :activities, :organization_id, :string
  end
end
