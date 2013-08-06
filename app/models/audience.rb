class Audience < ActiveRecord::Base

  belongs_to :audienceable, polymorphic: true
  belongs_to :activity

  attr_accessible :audienceable_id, :audienceable_type, :activity_id

  validates :audienceable_id, presence: true
  validates :audienceable_type, presence: true

end