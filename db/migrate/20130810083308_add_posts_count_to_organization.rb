class AddPostsCountToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :posts_count, :integer, default: 0

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, posts_count: organization.actor.posts.count
    end
  end
end
