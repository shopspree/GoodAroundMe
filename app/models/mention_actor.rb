class MentionActor < ActiveRecord::Base
  belongs_to :mention
  belongs_to :actor

  attr_accessible :actor_id, :mention_id

end
