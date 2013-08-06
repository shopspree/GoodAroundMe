class AddTagsCountToHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :tags_counter, :integer, default: 0

    Hashtag.reset_column_information
    Hashtag.all.each do |hashtag|
      Hashtag.update_counters hashtag.id, tags_counter: hashtag.tags.count
    end

  end
end
