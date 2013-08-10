class RemoveWebsiteUrlFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :website_url
  end

  def down
    add_column :organizations, :website_url, :string
  end
end
