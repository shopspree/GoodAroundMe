class GroupType < ActiveRecord::Base
  has_many :groups

  attr_accessible :name

  validates :name, presence: true

end
