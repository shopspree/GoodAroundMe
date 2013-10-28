class ChangeFacebookRunIdInFacebookPost < ActiveRecord::Migration
  def up
    change_column :facebook_posts, :facebook_run_id, :integer
  end

  def down
    change_column :facebook_posts, :facebook_run_id, :string
  end
end
