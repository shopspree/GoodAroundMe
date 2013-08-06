class CreateOrganizationOrganizationCategories < ActiveRecord::Migration
  def change
    create_table :organization_organization_categories do |t|
      t.integer :organization_id
      t.integer :organization_category_id

      t.timestamps
    end
  end
end
