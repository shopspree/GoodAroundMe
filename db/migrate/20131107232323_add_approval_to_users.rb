class AddApprovalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean, default: false
    add_column :users, :approver_id, :integer
  end
end
