class Follower < ActiveRecord::Base
  belongs_to :organization
  belongs_to :person

  attr_accessible :person_id, :approved, :organization_id

  validates_presence_of :person_id, :approved, :organization_id

  validates :person_id, uniqueness: { scope: [:organization_id] }

end
