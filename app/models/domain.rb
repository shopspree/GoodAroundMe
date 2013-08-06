class Domain < ActiveRecord::Base

  belongs_to :organization

  attr_accessible :blacklist, :name, :organization_id

  validates :name, presence: true, uniqueness: true

end
