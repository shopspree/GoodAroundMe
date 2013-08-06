class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :name_prefix
      t.string :name_suffix
      t.date :birthday
      t.string :gender
      t.integer :address_id
      t.integer :actor_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
