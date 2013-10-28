class FacebookPost < ActiveRecord::Base

  belongs_to :facebook_run
  belongs_to :post

  attr_accessible :facebook_id, :facebook_object_id, :facebook_run_id, :facebook_type, :facebook_created_time, :facebook_updated_time, :post_id

  #validates_presence_of :facebook_type
  validates_uniqueness_of :facebook_object_id

end
