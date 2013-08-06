class AddCommentsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :comments_counter, :integer, default: 0

    Post.reset_column_information
    Post.all.each do |post|
      Post.update_counters post.id, comments_counter: post.comments.count
    end
  end
end
