class Context < ActiveRecord::Base

  has_many :people
  has_many :organizations

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

end
