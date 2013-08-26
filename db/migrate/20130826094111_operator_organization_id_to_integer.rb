class OperatorOrganizationIdToInteger < ActiveRecord::Migration
  def up
    remove_column :operators, :organization_id
    add_column :operators, :organization_id, :integer
  end

  def down
  end
end
