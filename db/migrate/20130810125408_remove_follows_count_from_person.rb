class RemoveFollowsCountFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :follows_count
  end

  def down
    add_column :people, :follows_count, :string
  end
end
