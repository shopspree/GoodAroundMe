class RemoveDomainFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :domain
  end

  def down
    add_column :organizations, :domain, :string
  end
end
