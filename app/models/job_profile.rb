class JobProfile < ActiveRecord::Base

  belongs_to :person
  belongs_to :organization

  attr_accessible :actor_id, :title, :email
  attr_readonly :organization_id

  before_create :default_values

  validates :actor_id, presence: true
  validates :organization_id, presence: true


  protected

  def default_values
    org = Organization.find_by_domain(domain email);
    org_id = org.id if org
    self.organization_id ||=  org_id
  end

  def domain(email)
    email.split("@").last if email
  end
end
