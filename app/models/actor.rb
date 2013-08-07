class Actor < ActiveRecord::Base
  has_many :posts
  has_many :contributed_posts, class_name: "Post", foreign_key: "contributor_id"
  has_many :comments
  has_many :likes
  has_many :activity_actors
  has_many :activities, through: :activity_actors

  belongs_to :actorable, polymorphic: true
  belongs_to :context

  attr_accessible :context_id, :actorable_id, :actorable_type, :notifications_count

  validates :actorable_id, presence: true
  validates :actorable_type, presence: true
  validates :context_id, presence: true

end
