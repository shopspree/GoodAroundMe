class AddOrganizationIdToActor < ActiveRecord::Migration
  def change
    add_column :actors, :organization_id, :integer
  end
end
