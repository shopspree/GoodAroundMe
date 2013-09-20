class Operator < ActiveRecord::Base

  belongs_to :organization
  belongs_to :person

  attr_accessible :email, :organization_id, :person_id

  validates :person_id, presence: true, uniqueness: { scope: :organization_id }

  before_validation :validate_values


  def validate_values
    user = User.find_by_email(self.email)
    self.person_id = user.person.id if user
  end

end
