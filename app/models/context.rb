class Context < ActiveRecord::Base

  has_many :people
  has_many :groups
  has_many :subcategories
  has_many :hashtags

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

end
