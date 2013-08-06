class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.boolean :blacklist

      t.timestamps
    end
  end
end
