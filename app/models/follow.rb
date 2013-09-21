class Follow < ActiveRecord::Base

  belongs_to :person, counter_cache: :followings_count
  belongs_to :organization, counter_cache: :count_of_followers

  attr_accessible :organization_id, :person_id

  validates_presence_of :organization_id, :person_id
  validates_uniqueness_of :person_id, scope: [ :organization_id ]
end
