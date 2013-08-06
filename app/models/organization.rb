class Organization < ActiveRecord::Base
  has_many :people
  has_many :groups
  has_many :job_profiles
  has_many :domains, dependent: :destroy
  has_many :organization_organization_categories, dependent: :destroy
  has_many :organization_categories, through: :organization_organization_categories
  has_many :followers, dependent: :destroy
  has_many :follower_people, class_name: "Person", foreign_key: "person_id", through: :followers
  has_one :actor, as: :actorable

  belongs_to :context

  attr_accessible :name, :description,:website_url
  attr_readonly :context_id

  validates :name, presence: true, uniqueness: true

  before_save :default_values


  protected

  def default_values
    context_id ||= Context.find_by_name(Settings['context.global']).id
  end

end
