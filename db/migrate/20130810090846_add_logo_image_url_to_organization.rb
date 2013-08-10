class AddLogoImageUrlToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :image_thumbnail_url, :string
    add_column :organizations, :about, :string
    add_column :organizations, :website_url, :string
  end
end
