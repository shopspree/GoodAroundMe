class Organization < ActiveRecord::Base
  has_many :people
  has_many :groups
  has_many :job_profiles
  has_many :domains, dependent: :destroy
  has_many :organization_organization_categories, dependent: :destroy
  has_many :organization_categories, through: :organization_organization_categories
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :person
  has_one :actor, as: :actorable

  belongs_to :context

  attr_accessible :context_id, :name, :followers_count, :posts_count, :about, :website_url, :image_thumbnail_url

  validates :name, presence: true, uniqueness: true

  before_save :default_values


  protected

  def default_values
    assign_attibutes(context_id: Context.find_by_name(Settings['context.global.name']).id) unless context_id
  end

end
