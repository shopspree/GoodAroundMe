class AddContextIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :context_id, :integer
  end
end
