class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.integer :audienceable_id
      t.string :audienceable_type
      t.string :audience_type

      t.timestamps
    end
  end
end
