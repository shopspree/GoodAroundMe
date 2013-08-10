class RemoveFollowersCountFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :followers_count
  end

  def down
    add_column :organizations, :followers_count, :string
  end
end
