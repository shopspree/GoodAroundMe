class AddPostsCountToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :posts_count, :integer

    Subcategory.reset_column_information
    Subcategory.all.each do |subcategory|
      Subcategory.update_counters subcategory.id, posts_count: subcategory.posts.count
    end
  end
end
