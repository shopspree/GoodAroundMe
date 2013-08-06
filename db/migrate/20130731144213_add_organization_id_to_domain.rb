class AddOrganizationIdToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :organization_id, :integer
  end
end
