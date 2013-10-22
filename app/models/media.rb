class Media < ActiveRecord::Base
  belongs_to :post
  belongs_to :mediable, polymorphic: true

  attr_accessible :mediable_id, :mediable_type, :post_id

  before_create :default_values


  protected

  def default_values
    self.media_type_id ||= MediaType.find_or_create_by_name('Picture').id
  end

end
