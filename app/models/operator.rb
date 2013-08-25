class Operator < ActiveRecord::Base

  belongs_to :organization

  attr_accessible :email, :organization_id
end
