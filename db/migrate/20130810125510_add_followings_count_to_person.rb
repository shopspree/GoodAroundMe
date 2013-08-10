class AddFollowingsCountToPerson < ActiveRecord::Migration
  def change
    add_column :people, :followings_count, :integer
  end
end
