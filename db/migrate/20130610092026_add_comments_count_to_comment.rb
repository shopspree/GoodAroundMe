class AddCommentsCountToComment < ActiveRecord::Migration
  def change
    add_column :comments, :comments_counter, :integer, default: 0

    Comment.reset_column_information
    Comment.all.each do |comment|
      Comment.update_counters comment.id, comments_counter: comment.comments.count
    end
  end
end
