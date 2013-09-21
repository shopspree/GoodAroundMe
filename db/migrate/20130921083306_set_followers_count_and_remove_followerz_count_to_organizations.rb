class SetFollowersCountAndRemoveFollowerzCountToOrganizations < ActiveRecord::Migration
  def up
    remove_column :organizations, :followerz_count

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, followers_count: organization.followers.count
    end
  end

  def down
    add_column :organizations, :followerz_count, :integer
  end
end
