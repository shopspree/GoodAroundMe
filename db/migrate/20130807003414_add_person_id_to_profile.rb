class AddPersonIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :person_id, :integer
  end
end
