class FixFacebookPost < ActiveRecord::Migration
  def up
    rename_column :facebook_posts, :facebook_created_time, :facebook_created_at
    rename_column :facebook_posts, :facebook_updated_time, :facebook_updated_at
  end

  def down
    rename_column :facebook_posts, :facebook_created_at, :facebook_created_time
    rename_column :facebook_posts, :facebook_updated_at, :facebook_updated_time
  end
end
