class RemoveOrgazniationCategoryIdAddOrganziationIdToFacebookPage < ActiveRecord::Migration
  def up
    remove_column :facebook_pages, :organization_category_id
    add_column :facebook_pages, :organization_id, :integer
  end

  def down
    add_column :facebook_pages, :organization_category_id, :integer
    remove_column :facebook_pages, :organization_id
  end
end
