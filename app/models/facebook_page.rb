class FacebookPage < ActiveRecord::Base

  has_many :facebook_runs

  belongs_to :organization
  belongs_to :organization_category

  attr_accessible :identifier, :organization_id

  validates :organization_id, presence: true, uniqueness: true

  after_create :update_from_facebook


  public

  def run_import
    facebook_run = facebook_runs.create
    Rails.logger.debug "Import started for for run #{facebook_run} on page #{identifier}"
    begin
      FacebookService.new.import_facebook_posts(facebook_run)
      facebook_run.end_job
      Rails.logger.debug "Import completed successfully for run #{facebook_run.id} on page #{identifier}"
    rescue Exception => e
      Rails.logger.fatal "Import failed for run #{facebook_run.id} on page #{identifier}"
      facebook_run.failed_job
      raise e
    end
    facebook_run.save

  end

  protected

  def update_from_facebook
    update_organization_from_facebook
    run_import
  end

  def update_organization_from_facebook
    page = FacebookService.new.import_facebook_page(identifier)
    organization.update_attributes(about: page["about"], website_url: page["website"], image_thumbnail_url: page["picture"]["data"]["url"])
  end

end
