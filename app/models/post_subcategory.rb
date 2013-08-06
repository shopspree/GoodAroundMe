class PostSubcategory < ActiveRecord::Base

  belongs_to :post, counter_cache: true
  belongs_to :subcategory, counter_cache: true

  attr_accessible :post_id, :subcategory_id
end
