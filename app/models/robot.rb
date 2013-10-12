class Robot < ActiveRecord::Base

  has_one :actor, as: :actorable

  attr_accessible :name, :display_name

  validates_presence_of :name

  after_save :default_values


  protected

  def default_values
    update_attributes(display_name: name) unless display_name
    create_actor unless actor
  end

end
