class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :title
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.integer :address_type_id

      t.timestamps
    end
  end
end
