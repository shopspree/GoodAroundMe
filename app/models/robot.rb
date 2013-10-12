class Robot < ActiveRecord::Base

  has_one :actor, as: :actorable

  attr_accessible :name, :display_name

  validates_presence_of :name

  before_create :default_values


  public

  def default_values
    display_name ||= name
  end

end
