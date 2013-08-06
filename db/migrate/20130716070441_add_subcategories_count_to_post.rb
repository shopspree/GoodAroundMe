class AddSubcategoriesCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :subcategories_count, :integer

    Post.reset_column_information
    Post.all.each do |post|
      Post.update_counters post.id, subcategories_count: post.subcategories.count
    end
  end
end
