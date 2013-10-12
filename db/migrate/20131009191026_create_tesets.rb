class CreateTesets < ActiveRecord::Migration
  def change
    create_table :tesets do |t|
      t.string :str
      t.integer :int
      t.datetime :d

      t.timestamps
    end
  end
end
