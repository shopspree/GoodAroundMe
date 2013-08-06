class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :action_id
      t.integer :activity_object_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
