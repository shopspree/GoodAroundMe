class AddOrganizationIdToFollower < ActiveRecord::Migration
  def change
    add_column :followers, :organization_id, :integer
    remove_column :followers, :followable_id
    remove_column :followers, :followable_type
  end
end
