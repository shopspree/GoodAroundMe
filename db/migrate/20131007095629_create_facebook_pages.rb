class CreateFacebookPages < ActiveRecord::Migration
  def change
    create_table :facebook_pages do |t|
      t.string :page
      t.integer :organization_category_id

      t.timestamps
    end
  end
end
