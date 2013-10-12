class FacebookRun < ActiveRecord::Base

  STATUSES = [STATUS_STARTED = 'Started', STATUS_FAILED = 'Failed', STATUS_COMPLETED = 'Completed']

  has_many :facebook_posts

  belongs_to :facebook_page

  attr_accessible :facebook_page_id, :status, :start_time, :end_time

  before_create :start_job

  validates_presence_of :facebook_page_id
  #validates_inclusion_of :status, in: STATUSES


  public

  def self.last_run_for_page(facebook_page_id)
    where(facebook_page_id: facebook_page_id, status: FacebookRun::STATUS_COMPLETED).order("end_time ASC").last.try(:end_time)
  end

  def end_job
    status = FacebookRun::STATUS_COMPLETED
    end_time = DateTime.now
  end

  def failed_job
    status = FacebookRun::STATUS_FAILED
    end_time = DateTime.now
  end


  protected

  def start_job
    self.status = FacebookRun::STATUS_STARTED
    self.start_time = DateTime.now
    self.last_run = FacebookRun.last_run_for_page(facebook_page_id)
  end
end
