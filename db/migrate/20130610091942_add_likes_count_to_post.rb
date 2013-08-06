class AddLikesCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :likes_counter, :integer, default: 0

    Post.reset_column_information
    Post.all.each do |post|
      Post.update_counters post.id, likes_counter: post.likes.count
    end

  end
end
