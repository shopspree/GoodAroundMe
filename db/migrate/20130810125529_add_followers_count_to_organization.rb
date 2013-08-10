class AddFollowersCountToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :followers_count, :integer
  end
end
