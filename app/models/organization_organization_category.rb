class OrganizationOrganizationCategory < ActiveRecord::Base

  belongs_to :organization
  belongs_to :organization_category

  attr_accessible :organization_category_id, :organization_id
end
