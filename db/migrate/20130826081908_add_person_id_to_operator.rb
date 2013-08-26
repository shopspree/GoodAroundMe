class AddPersonIdToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :person_id, :integer
  end
end
