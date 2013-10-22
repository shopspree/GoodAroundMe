class Photo < ActiveRecord::Base

  has_one :media, as: :mediable

  attr_accessible :url, :media
end
