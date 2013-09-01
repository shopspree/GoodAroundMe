class ChangeAboutInOrganization < ActiveRecord::Migration
  def up
    change_column :organizations, :about, :text
  end

  def down
    change_column :organizations, :about, :string
  end
end
