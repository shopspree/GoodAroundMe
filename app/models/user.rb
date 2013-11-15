class User < ActiveRecord::Base

  has_one :person, dependent: :destroy
  has_one :waiting_list, dependent: :destroy
  has_one :approver, class_name: "User", foreign_key: "approver_id"

  belongs_to :user
  belongs_to :approver, class_name: "User"

  # Include default devise modules. Others available are:
  # :lockable, :rememberable, :timeoutable, :confirmable, and :omniauthable
  devise :database_authenticatable,
         :token_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token, :admin, :approved, :approver_id

  before_save :ensure_authentication_token

  validate :email_validations


  public

  def approve
    self.approved = true
    self.waiting_list.destroy if self.waiting_list
  end

  def wait_listing
    unless (self.approved?)
      self.build_waitingList(rank: params[:rank])
    end
  end


  protected

  def email_validations
    domain_name = email.split("@").last
    domain = Domain.find_by_name(domain)

    errors.add :email, "#{domain} is blacklisted"  if domain and domain.blacklist?
  end

end
