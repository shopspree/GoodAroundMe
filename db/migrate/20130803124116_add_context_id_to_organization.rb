class AddContextIdToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :context_id, :integer
  end
end
