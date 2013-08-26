class Person < ActiveRecord::Base

  has_many :follows, dependent: :destroy
  has_many :following, through: :follows, source: :organization
  has_many :notifications, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :actor, as: :actorable, dependent: :destroy
  has_one :operator, dependent: :destroy
  has_one :organization, through: :operator

  belongs_to :context
  belongs_to :user

  attr_accessible :context_id, :user_id, :followings_count

  validates_presence_of :context_id


  def following?(organization)
    following.include? organization
  end

end
