class AddDecriptionAndWebsiteUrlToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :description, :string
    add_column :organizations, :website_url, :string
  end
end
