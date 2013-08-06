class AddFollowersCountToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :followers_count, :integer, default: 0

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, followers_count: organization.followers.count
    end
  end
end
