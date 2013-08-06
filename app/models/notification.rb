class Notification < ActiveRecord::Base
  belongs_to :person, counter_cache: true
  belongs_to :notificationable, polymorphic: true

  attr_accessible :notificationable_id, :notificationable_type, :person_id, :is_read

  validates_presence_of :notificationable_id, :notificationable_type, :actor_id, :is_read
  validates_uniqueness_of :actor_id, scope: [ :notificationable_id, :notificationable_type ]

  before_validation :default_values

  protected

  def default_values
    self.is_read ||= false
  end

end
