class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  belongs_to :hashtag, counter_cache: true

  attr_accessible :hashtag_id, :taggable_id, :taggable_type
end
