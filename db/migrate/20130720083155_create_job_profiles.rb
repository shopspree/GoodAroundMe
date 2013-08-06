class CreateJobProfiles < ActiveRecord::Migration
  def change
    create_table :job_profiles do |t|
      t.string :title
      t.integer :actor_id
      t.integer :organization_id
      t.integer :group_id

      t.timestamps
    end
  end
end
