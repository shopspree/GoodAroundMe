class AddReportsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :reports_count, :integer, default: 0

    Post.reset_column_information
    Post.all.each do |post|
      Post.update_counters post.id, reports_count: post.subcategories.count
    end
  end
end
