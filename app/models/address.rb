class Address < ActiveRecord::Base
  has_many :profiles

  belongs_to :address_type

  attr_accessible :address_type_id, :city, :country, :state, :street, :title, :zipcode
end
