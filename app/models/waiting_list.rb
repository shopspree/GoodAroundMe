class WaitingList < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id

  attr_accessible :user_id, :rank

  after_create :default_rank


  public

  def number_in_line
    number_in_line = (WaitingList.where('id < :assigned_rank', self.rank).count + 1)
    number_in_line
  end


  protected

  def default_rank
    self.rank ||= self.id
    self.save if self.changed?
  end

end
