class Activity < ActiveRecord::Base

  belongs_to :context
  belongs_to :timelineable, polymorphic: true

  attr_accessible :timelineable_id, :timelineable_type, :context_id

  validates_presence_of :timelineable_id, :timelineable_type, :context_id

  default_scope order: 'activities.created_at DESC'

  scope :from_followed_by, lambda { |person|
    where("timelineable_type = 'Post' AND timelineable_id IN
      (SELECT id FROM posts WHERE actor_id IN
        (SELECT actorable_id FROM actors WHERE actorable_type='Organization' AND actorable_id IN
          (SELECT organization_id FROM followers WHERE person_id = :person_id)))",  person_id: person.id)
  }


  def post
    timelineable if timelineable.is_a? Post
  end

  def like
    timelineable if timelineable.is_a? Like
  end

  def comment
    timelineable if timelineable.is_a? Comment
  end

end
