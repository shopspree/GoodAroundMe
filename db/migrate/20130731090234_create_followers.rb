class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :actor_id
      t.integer :followable_id
      t.string :followable_type
      t.boolean :approved

      t.timestamps
    end
  end
end
