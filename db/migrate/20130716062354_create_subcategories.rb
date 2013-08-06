class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.integer :actor_id
      t.integer :context_id
      t.string :name

      t.timestamps
    end
  end
end
