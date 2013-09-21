class RemoveFollowersCountToOrganizations < ActiveRecord::Migration
  def up
    remove_column :organizations, :followers_count
  end

  def down
    add_column :organizations, :followers_count, :integer
  end
end
