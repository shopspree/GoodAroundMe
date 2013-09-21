class AddCountOfFollowersToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :count_of_followers, :integer
    remove_column :organizations, :followers_count

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, count_of_followers: organization.followers.count
    end
  end
end
