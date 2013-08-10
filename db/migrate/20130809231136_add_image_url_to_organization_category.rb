class AddImageUrlToOrganizationCategory < ActiveRecord::Migration
  def change
    add_column :organization_categories, :image_url, :string
  end
end
