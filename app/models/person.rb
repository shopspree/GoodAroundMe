class Person < ActiveRecord::Base
  has_many :follows, class_name: "Follower", dependent: :destroy
  has_many :followed_orgnizations, class_name: "Organization", foreign_key: "orgnization_id", through: :followers
  has_many :notifications
  has_one :job_profile
  has_one :profile
  has_one :actor, as: :actorable

  belongs_to :context
  belongs_to :organization

  attr_readonly :organization_id, :context_id

  validates_presence_of :context_id

end
