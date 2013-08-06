class CreateMentionActors < ActiveRecord::Migration
  def change
    create_table :mention_actors do |t|
      t.integer :actor_id
      t.integer :mention_id

      t.timestamps
    end
  end
end
