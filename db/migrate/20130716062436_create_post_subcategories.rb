class CreatePostSubcategories < ActiveRecord::Migration
  def change
    create_table :post_subcategories do |t|
      t.integer :post_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
