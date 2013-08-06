class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :key
      t.string :value
      t.integer :actor_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
