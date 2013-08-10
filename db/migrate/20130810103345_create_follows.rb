class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :person_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
