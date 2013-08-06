class AddLikesCountToComment < ActiveRecord::Migration
  def change
    add_column :comments, :likes_counter, :integer, default: 0

    Comment.reset_column_information
    Comment.all.each do |comment|
      Comment.update_counters comment.id, likes_counter: comment.likes.count
    end
  end
end
