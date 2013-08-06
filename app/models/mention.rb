class Mention < ActiveRecord::Base
  has_one :activity_object, as: :timelineable
  has_many :mention_actors

  belongs_to :actor
  belongs_to :mentionable, polymorphic: true

  attr_accessible :actor_id, :mentionable_id, :mentionable_type

  def post
    case mentionable
      when Post
        mentionable
      when Comment
        comment = Comment.find(mentionable_id)
        comment.post
      else
        nil
    end
  end

end
