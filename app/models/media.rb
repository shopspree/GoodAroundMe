class Media < ActiveRecord::Base
  belongs_to :post
  belongs_to :media_type

  attr_accessible :media_type_id, :post_id, :url_string

end
