class Media < ActiveRecord::Base
  belongs_to :post
  belongs_to :media_type

  attr_accessible :media_type_id, :post_id, :url_string

  before_create :default_values


  protected

  def default_values
    self.media_type_id ||= MediaType.find_or_create_by_name('Picture').id
  end

end
