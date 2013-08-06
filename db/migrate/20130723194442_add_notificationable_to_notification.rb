class AddNotificationableToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :notificationable_id, :integer
    add_column :notifications, :notificationable_type, :string
    remove_column :notifications, :activity_id
  end
end
