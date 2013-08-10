class RemoveOrganziationProfile < ActiveRecord::Migration
  def up
    drop_table :organization_profiles
  end

  def down
  end
end
