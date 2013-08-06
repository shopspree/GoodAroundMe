class MediaType < ActiveRecord::Base
  has_many :medias

  attr_accessible :name

end
