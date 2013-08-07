class Person < ActiveRecord::Base
  has_many :follows, class_name: "Follower", dependent: :destroy
  has_many :followed_orgnizations, class_name: "Organization", foreign_key: "orgnization_id", through: :followers
  has_many :notifications
  has_one :profile
  has_one :actor, as: :actorable

  belongs_to :context
  belongs_to :organization
  belongs_to :user

  attr_accessible :organization_id, :context_id, :user_id

  validates_presence_of :context_id

end
