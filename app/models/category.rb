class Category < ActiveRecord::Base
  has_many :subcategories, dependent: :destroy
  has_many :post_subcategories, as: :categorizeable, dependent: :destroy

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

end
