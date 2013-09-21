class FollowersCountInOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :followers_count
    add_column :organizations, :followers_count, :integer

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, followers_count: organization.followers.count
    end
  end

  def down
  end
end
