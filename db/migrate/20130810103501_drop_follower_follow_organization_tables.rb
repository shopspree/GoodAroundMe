class DropFollowerFollowOrganizationTables < ActiveRecord::Migration
  def up
    drop_table :follow_organizations
    drop_table :followers
  end

  def down
  end
end
