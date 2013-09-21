class AddFollowerzCountToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :followerz_count, :integer

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, followerz_count: organization.followers.count
    end
  end
end
