class DropActivityActor < ActiveRecord::Migration
  def up
    drop_table :activity_actors
  end

  def down
  end
end
