class RenameDescrptionToAboutInOrganization < ActiveRecord::Migration
  def up
    rename_column :organizations, :description, :about
  end

  def down
    rename_column :organizations, :about, :description
  end
end
