class OrganizationCategory < ActiveRecord::Base

  has_many :organization_organization_categories, dependent: :destroy
  has_many :organizations, through: :organization_organization_categories

  attr_accessible :name, :image_url

  validates :name, presence: true, uniqueness: true

end
