class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :group_id
      t.integer :person_id

      t.timestamps
    end
  end
end
