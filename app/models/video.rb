class Video < ActiveRecord::Base

  has_one :media, as: :mediable

  attr_accessible :image_url, :url, :media
end
