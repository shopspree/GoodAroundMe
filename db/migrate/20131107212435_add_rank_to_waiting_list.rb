class AddRankToWaitingList < ActiveRecord::Migration
  def change
    add_column :waiting_lists, :rank, :integer
    add_index :waiting_lists, :rank
  end
end
