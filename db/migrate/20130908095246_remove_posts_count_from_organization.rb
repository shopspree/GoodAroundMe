class RemovePostsCountFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :posts_count
  end

  def down
    add_column :organizations, :posts_count, :integer
  end
end
