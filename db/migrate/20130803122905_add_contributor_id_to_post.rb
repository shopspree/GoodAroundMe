class AddContributorIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :contributor_id, :integer
  end
end
