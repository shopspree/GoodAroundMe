class FixCounterCacheColumnName < ActiveRecord::Migration
  def up
    rename_column :hashtags, :tags_counter, :tags_count
    rename_column :posts, :likes_counter, :likes_count
    rename_column :posts, :comments_counter, :comments_count
    rename_column :comments, :likes_counter, :likes_count
    rename_column :comments, :comments_counter, :comments_count
  end

  def down
    rename_column :hashtags, :tags_count, :tags_counter
    rename_column :posts, :likes_count, :likes_counter
    rename_column :posts, :comments_count, :comments_counter
    rename_column :comments, :likes_count, :likes_counter
    rename_column :comments, :comments_count, :comments_counter
  end
end
