class Organization < ActiveRecord::Base
  has_many :operators, dependent: :destroy
  has_many :people, through: :operators
  has_many :domains, dependent: :destroy
  has_many :organization_organization_categories, dependent: :destroy
  has_many :organization_categories, through: :organization_organization_categories
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :person
  has_one :actor, as: :actorable
  has_one :facebook_page

  belongs_to :context

  attr_accessible :context_id, :name, :about, :website_url, :image_thumbnail_url, :location, :organization_categories

  validates :name, presence: true, uniqueness: true

  before_save :default_values


  protected

  def default_values
    assign_attributes(context_id: Context.find_by_name(Settings['context.global.name']).id) unless context_id
  end

end
