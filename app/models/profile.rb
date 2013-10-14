class Profile < ActiveRecord::Base
  belongs_to :person
  belongs_to :address

  attr_accessible :person_id, :address_id, :birthday, :first_name, :gender, :last_name, :middle_name, :name_prefix, :name_suffix, :email, :picture_url, :thumbnail_url, :display_name

  validates :person_id, presence: true

  before_save :populate_display_name

  scope :search, lambda { |keyword| where('lower(full_name) LIKE ?', "%#{keyword.downcase}%").order(:full_name) }
  scope :search_exact, lambda { |keyword| where(full_name: keyword).order(:full_name) }


  public

  def first_name
    read_attribute(:first_name).try(:titleize)
  end

  def middle_name
    read_attribute(:middle_name).try(:titleize)
  end

  def last_name
    read_attribute(:last_name).try(:titleize)
  end


  protected

  def populate_display_name
    self.display_name ||= "#{first_name} #{last_name}"
  end

end
