class AddFollowsToOrganizationAndPerson < ActiveRecord::Migration
  def change
    remove_column :people, :followings_count
    add_column :people, :followings_count, :integer, default: 0

    Person.reset_column_information
    Person.all.each do |person|
      Person.update_counters person.id, followings_count: person.following.count
    end

    remove_column :organizations, :followers_count
    add_column :organizations, :followers_count, :integer, default: 0

    Organization.reset_column_information
    Organization.all.each do |organization|
      Organization.update_counters organization.id, followers_count: organization.followers.count
    end
  end
end
