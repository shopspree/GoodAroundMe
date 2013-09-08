class AddPostsCountToActor < ActiveRecord::Migration
  def change
    add_column :actors, :posts_count, :integer

    Actor.reset_column_information
    Actor.all.each do |actor|
      Actor.update_counters actor.id, posts_count: actor.posts.count
    end
  end
end
