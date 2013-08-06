class AddNotificationsCountToActor < ActiveRecord::Migration
  def change
    add_column :actors, :notifications_count, :integer

    Actor.reset_column_information
    Actor.all.each do |actor|
      Actor.update_counters actor.id, notifications_count: actor.notifications.count
    end
  end
end
