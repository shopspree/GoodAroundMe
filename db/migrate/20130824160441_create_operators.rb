class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :organization_id
      t.string :email

      t.timestamps
    end
  end
end
