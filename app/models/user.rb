class User < ActiveRecord::Base

  has_one :person, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :rememberable, :timeoutable, :confirmable, and :omniauthable
  devise :database_authenticatable,
         :token_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token

  before_save :ensure_authentication_token

  validate :email_validations


  protected

  def email_validations
    domain_name = email.split("@").last
    domain = Domain.find_by_name(domain)

    errors.add :email, "#{domain} is blacklisted"  if domain and domain.blacklist?
  end

end
