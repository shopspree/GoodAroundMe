class RemoveOrganizationIdFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :organization_id
  end

  def down
    add_column :people, :organization_id, :string
  end
end
