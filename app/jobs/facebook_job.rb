class FacebookJob < Struct.new(:page_id)
  def perform
    logger.debug "FacebookJob started"
    facebook_page = FacebookPage.find_by_identifier(page_id)
    facebook_page.run_import
    logger.debug "FacebookJob ended"
  end
end