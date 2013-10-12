class FacebookJob < Struct.new(:page_identifier)
  def perform
    Rails.logger.info "FacebookJob for #{page_identifier} started"
    facebook_page = FacebookPage.find_by_identifier(page_identifier)
    facebook_page.run_import
    Rails.logger.info "FacebookJob for #{page_identifier} ended"
  end
end