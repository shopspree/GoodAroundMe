class ChangeFacebookRunIdInFacebookPost2 < ActiveRecord::Migration
  def up
    change_column :facebook_posts, :facebook_run_id, 'integer USING CAST(facebook_run_id AS integer)'
  end

  def down
    change_column :facebook_posts, :facebook_run_id, 'string USING CAST(facebook_run_id AS string)'
  end
end
