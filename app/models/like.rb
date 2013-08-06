class Like < ActiveRecord::Base

  has_one :activity, as: :timelineable, dependent: :destroy

  belongs_to :actor
  belongs_to :likeable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :likeable_id, :likeable_type

  validates :actor_id, presence: true, uniqueness: { scope: [:likeable_id, :likeable_type] }
  validates :likeable_id, presence: true
  validates :likeable_type, presence: true

  scope :user_likes, lambda { |actor_id| where(actor_id: actor_id).includes(:likeable) }

  def post
    case likeable
      when Post
        likeable
      when Comment
        comment = likeable
        comment.post
      else
        nil
    end
  end

end
