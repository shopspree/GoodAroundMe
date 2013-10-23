class Media < ActiveRecord::Base
  belongs_to :post
  belongs_to :mediable, polymorphic: true

  attr_accessible :mediable_id, :mediable_type, :post_id

  validates_presence_of :mediable_id, :mediable_type, :post_id

end
