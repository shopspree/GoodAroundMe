class RemoveAboutFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :about
  end

  def down
    add_column :organizations, :about, :string
  end
end
